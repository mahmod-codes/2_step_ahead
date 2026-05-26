import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/theme/app_text_styles.dart';

class SpecSections extends StatelessWidget {
  const SpecSections({super.key, required this.contentJson});

  final String contentJson;

  @override
  Widget build(BuildContext context) {
    final decoded = jsonDecode(contentJson);
    if (decoded is! Map<String, dynamic>) {
      return Text(contentJson, style: AppTextStyles.specContent);
    }
    return Column(
      children: decoded.entries.map((entry) {
        return Card(
          child: ExpansionTile(
            initiallyExpanded: true,
            maintainState: true,
            title: Text(_title(entry.key)),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    const JsonEncoder.withIndent('  ').convert(entry.value),
                    style: AppTextStyles.specContent.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _title(String value) {
    final words = value
        .replaceAllMapped(RegExp('[A-Z]'), (match) => ' ${match.group(0)}')
        .split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => '${word[0].toUpperCase()}${word.substring(1)}');
    return words.join(' ');
  }
}
