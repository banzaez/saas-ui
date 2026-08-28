import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';

/// Виджет панели для перетаскивания и загрузки файлов.
/// Поддерживает Drag and Drop и отрисовывает современную зону для сброса файлов.
class AppDropFilePanel extends StatefulWidget {
  final Widget? child;
  final void Function(DropItem file) onFileDrop;
  final void Function()? onDragEnter;
  final void Function()? onDragExit;
  final void Function()? onDragDone;

  const AppDropFilePanel({
    super.key,
    this.child,
    required this.onFileDrop,
    this.onDragEnter,
    this.onDragExit,
    this.onDragDone,
  });

  @override
  State<AppDropFilePanel> createState() => _AppDropFilePanelState();
}

class _AppDropFilePanelState extends State<AppDropFilePanel>
    with TickerProviderStateMixin {
  bool _dragging = false;

  late final AnimationController _scaleController;
  late final Animation<double> _scaleAnimation;

  late final AnimationController _borderController;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.985).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    _borderController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _borderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: (detail) {
        if (detail.files.isNotEmpty) {
          for (final file in detail.files) {
            widget.onFileDrop(file);
          }
        }
        widget.onDragDone?.call();
        setState(() => _dragging = false);
        _scaleController.reverse();
        _borderController.stop();
      },
      onDragEntered: (detail) {
        setState(() => _dragging = true);
        widget.onDragEnter?.call();
        _scaleController.forward();
        _borderController.repeat();
      },
      onDragExited: (detail) {
        setState(() => _dragging = false);
        widget.onDragExit?.call();
        _scaleController.reverse();
        _borderController.stop();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AppContainer(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(minHeight: 160),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              if (widget.child != null) widget.child!,
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  /// Содержимое панели с анимированной границей и переключением текста
  Widget _buildContent() {
    return AnimatedBuilder(
      animation: _borderController,
      builder: (context, child) {
        return CustomPaint(
          painter: _DashedBorderPainter(
            color: _dragging
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.2),
            strokeWidth: 2,
            dashPattern: const [8, 4],
            borderRadius: 16,
            phase:
                _borderController.value *
                24, // Смещение для анимации «марширующих муравьев»
          ),
          child: child,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: _dragging
              ? AppColors.primary.withValues(alpha: 0.05)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: _dragging
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: _dragging
              ? Column(
                  key: const ValueKey('active_content'),
                  spacing: 12,
                  children: [
                    const Icon(
                      Icons.upload_file_rounded,
                      size: 48,
                      color: AppColors.primary,
                    ),
                    const Text(
                      'Отпустите для загрузки',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      'Ваши файлы будут добавлены автоматически',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                )
              : Column(
                  key: const ValueKey('idle_content'),
                  spacing: 12,
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 48,
                      color: AppColors.primary.withValues(alpha: 0.4),
                    ),
                    const Text(
                      'Перетащите файл сюда для загрузки',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      'Поддерживаются любые форматы файлов',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

/// Отрисовка пунктирной границы с поддержкой фазы для анимации
class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final List<double> dashPattern;
  final double borderRadius;
  final double phase;

  _DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashPattern,
    required this.borderRadius,
    this.phase = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            strokeWidth / 2,
            strokeWidth / 2,
            size.width - strokeWidth,
            size.height - strokeWidth,
          ),
          Radius.circular(borderRadius),
        ),
      );

    final dashPath = Path();
    for (final metric in path.computeMetrics()) {
      double distance = phase % (dashPattern[0] + dashPattern[1]);
      bool draw = true;
      int i = 0;

      while (distance < metric.length) {
        final length = dashPattern[i];
        if (draw) {
          dashPath.addPath(
            metric.extractPath(
              distance,
              (distance + length).clamp(0, metric.length),
            ),
            Offset.zero,
          );
        }
        distance += length;
        draw = !draw;
        i = (i + 1) % dashPattern.length;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(_DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.phase != phase ||
        oldDelegate.borderRadius != borderRadius;
  }
}
