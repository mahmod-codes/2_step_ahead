import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/project.dart';
import '../../providers/app_providers.dart' show authServiceProvider, themeProvider;
import '../../providers/project_provider.dart';
import '../../widgets/async_error_view.dart';
import '../../widgets/status_badge.dart';
import '../generation/generation_screen.dart';
import '../project/create_project_screen.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key, required this.localUserId});

  final int localUserId;

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final projects = ref.watch(filteredProjectsProvider(widget.localUserId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('2step aheaad'),
        actions: [
          IconButton(
            tooltip: 'Toggle theme',
            onPressed: () => ref.read(themeProvider.notifier).toggle(),
            icon: const Icon(Icons.brightness_6_outlined),
          ),
          IconButton(
            tooltip: 'Sign out',
            onPressed: () => ref.read(authServiceProvider).signOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: projects.when(
          data: (items) => _ProjectList(
            projects: items,
            queryChanged: ref.read(searchQueryProvider.notifier).setQuery,
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => AsyncErrorView(
            error: error,
            onRetry: () => ref
                .read(projectListControllerProvider(widget.localUserId).notifier)
                .loadProjects(widget.localUserId),
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CreateProjectScreen(userId: widget.localUserId),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

}

class _ProjectList extends StatelessWidget {
  const _ProjectList({
    required this.projects,
    required this.queryChanged,
  });

  final List<Project> projects;
  final ValueChanged<String> queryChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextField(
          onChanged: queryChanged,
          decoration: const InputDecoration(
            hintText: 'Search projects...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 16),
        if (projects.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 96),
            child: Center(
              child: Text(
                'No projects found.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          )
        else
          ...projects.map(
            (project) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ProjectCard(project: project),
            ),
          ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => GenerationScreen(project: project),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      project.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(width: 12),
                  StatusBadge(status: project.status),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _formatDate(project.createdAt),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(int millis) {
    final date = DateTime.fromMillisecondsSinceEpoch(millis);
    return '${date.year}-${_two(date.month)}-${_two(date.day)}';
  }

  String _two(int value) => value.toString().padLeft(2, '0');
}
