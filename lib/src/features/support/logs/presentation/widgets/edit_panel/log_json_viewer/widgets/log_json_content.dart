import 'package:flutter/material.dart';
import '../models/log_json_models.dart';
import '../controllers/log_json_controller.dart';

class LogJsonContent extends StatelessWidget {
  final LogJsonController controller;

  const LogJsonContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TokenizationResult>(
      future: controller.futureResult,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            controller.tokenizationResult == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Ошибка: ${snapshot.error}'));
        }

        final result = snapshot.data ?? controller.tokenizationResult;
        if (result == null) return const SizedBox.shrink();

        return ListenableBuilder(
          listenable: controller,
          builder: (context, _) {
            return ListView.builder(
              controller: controller.scrollController,
              itemCount: result.lines.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                return Text.rich(
                  controller.buildLineSpan(context, result.lines[index].tokens),
                  softWrap: true,
                );
              },
            );
          },
        );
      },
    );
  }
}
