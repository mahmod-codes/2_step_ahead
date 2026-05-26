import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/app_providers.dart';

class ApiKeyDialog extends ConsumerStatefulWidget {
  const ApiKeyDialog({super.key});

  @override
  ConsumerState<ApiKeyDialog> createState() => _ApiKeyDialogState();
}

class _ApiKeyDialogState extends ConsumerState<ApiKeyDialog> {
  final _controller = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Gemini API key required'),
      content: TextField(
        controller: _controller,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'API key',
          errorText: _error,
        ),
      ),
      actions: [
        FilledButton(
          onPressed: () async {
            final value = _controller.text.trim();
            if (value.isEmpty) {
              setState(() => _error = 'Enter your Gemini API key.');
              return;
            }
            await ref.read(geminiServiceProvider).saveApiKey(value);
            if (context.mounted) {
              Navigator.of(context).pop(true);
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

Future<bool> ensureGeminiApiKey(BuildContext context, WidgetRef ref) async {
  final hasKey = await ref.read(geminiServiceProvider).hasApiKey();
  if (hasKey) {
    return true;
  }
  if (!context.mounted) {
    return false;
  }
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (_) => const ApiKeyDialog(),
  );
  return result ?? false;
}
