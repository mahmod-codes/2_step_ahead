import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../domain/entities/generated_spec.dart';
import '../../widgets/spec_sections.dart';
import 'spec_editor_screen.dart';

class SpecViewerScreen extends ConsumerWidget {
  const SpecViewerScreen({super.key, required this.spec});

  final GeneratedSpec spec;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spec v${spec.version}'),
        actions: [
          IconButton(
            tooltip: 'Share markdown',
            onPressed: () => _shareMarkdown(spec),
            icon: const Icon(Icons.ios_share),
          ),
          IconButton(
            tooltip: 'Edit',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SpecEditorScreen(spec: spec),
              ),
            ),
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Chip(
                    label: Text(
                      'Version ${spec.version} • ${_formatDate(spec.createdAt)}',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SpecSections(contentJson: spec.contentJson),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _shareMarkdown(GeneratedSpec spec) {
    return SharePlus.instance.share(
      ShareParams(
        subject: '2step aheaad spec v${spec.version}',
        text: _toMarkdown(spec),
      ),
    );
  }

  String _toMarkdown(GeneratedSpec spec) {
    final buffer = StringBuffer()
      ..writeln('# Technical Specification v${spec.version}')
      ..writeln()
      ..writeln('Generated: ${_formatDate(spec.createdAt)}')
      ..writeln();
    final decoded = jsonDecode(spec.contentJson);
    if (decoded is Map<String, dynamic>) {
      for (final entry in decoded.entries) {
        buffer
          ..writeln('## ${entry.key}')
          ..writeln()
          ..writeln('```json')
          ..writeln(const JsonEncoder.withIndent('  ').convert(entry.value))
          ..writeln('```')
          ..writeln();
      }
    } else {
      buffer.writeln(spec.contentJson);
    }
    return buffer.toString();
  }

  String _formatDate(int millis) {
    final date = DateTime.fromMillisecondsSinceEpoch(millis);
    return '${date.year}-${_two(date.month)}-${_two(date.day)} '
        '${_two(date.hour)}:${_two(date.minute)}';
  }

  String _two(int value) => value.toString().padLeft(2, '0');
}
