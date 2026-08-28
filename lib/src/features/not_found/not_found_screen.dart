import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              '404 — Страница не найдена',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Запрошенная страница не существует.',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => context.go(MainRouters.home.route),
              icon: const Icon(Icons.home),
              label: const Text('На главную'),
            ),
          ],
        ),
      ),
    );
  }
}
