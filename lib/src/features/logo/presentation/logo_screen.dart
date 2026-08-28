import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/constants/app_constants.dart';
import '../application/logo_controller.dart';

class LogoScreen extends ConsumerWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Триггерим логику LogoController
    ref.watch(logoControllerProvider);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade900, Colors.blue.shade600],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 2),
                builder: (context, value, child) =>
                    Transform.scale(scale: value, child: child),
                child: const Icon(Icons.cloud, size: 100, color: Colors.white),
              ),
              const SizedBox(height: 20),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 2),
                builder: (context, value, child) =>
                    Opacity(opacity: value, child: child),
                child: const Text(
                  AppConstants.appTitle,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 2),
                builder: (context, value, child) =>
                    Opacity(opacity: value, child: child),
                child: const Text(
                  'Инновационные решения для бизнеса',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
