import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/app_providers.dart';
import 'spec_viewer_screen.dart';

class VersionHistoryScreen extends ConsumerWidget {
  const VersionHistoryScreen({super.key, required this.projectId});

  final int projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final specs = ref.watch(specHistoryProvider(projectId));
    return Scaffold(
      appBar: AppBar(title: const Text('Version history')),
      body: SafeArea(
        child: specs.when(
          data: (items) => ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final spec = items[index];
              return Card(
                child: ListTile(
                  title: Text('Version ${spec.version}'),
                  subtitle: Text(_formatDate(spec.createdAt)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SpecViewerScreen(spec: spec),
                    ),
                  ),
                ),
              );
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }

  String _formatDate(int millis) {
    final date = DateTime.fromMillisecondsSinceEpoch(millis);
    return '${date.year}-${_two(date.month)}-${_two(date.day)} '
        '${_two(date.hour)}:${_two(date.minute)}';
  }

  String _two(int value) => value.toString().padLeft(2, '0');
}
