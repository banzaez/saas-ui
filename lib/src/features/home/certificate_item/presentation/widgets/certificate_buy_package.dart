import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart' show AppRouters;
import 'package:saas_ui/src/features/home/certificate_item/application/certificate_detail_notifier.dart';
import 'package:saas_ui/src/features/home/tarifs/presentation/widgets/package_comparison.dart';
import 'package:saas_ui/src/shared/widgets/app_expansion_tile.dart';

class CertificateBuyPackage extends ConsumerStatefulWidget {
  const CertificateBuyPackage({
    super.key,
    required this.certificateId,
    this.highlightFromQuery = false,
  });

  final int certificateId;
  final bool highlightFromQuery;

  @override
  ConsumerState<CertificateBuyPackage> createState() =>
      _CertificateBuyPackageState();
}

class _CertificateBuyPackageState extends ConsumerState<CertificateBuyPackage>
    with SingleTickerProviderStateMixin {
  AnimationController? _highlightAnimationController;
  Animation<Color?>? _highlightColorAnimation;
  Color _highlightColor = Colors.transparent;
  bool _isBuySectionExpanded = false;

  @override
  void initState() {
    super.initState();
    _isBuySectionExpanded = widget.highlightFromQuery;
    if (widget.highlightFromQuery) {
      _highlightAnimationController =
          AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 800),
          )..addListener(() {
            if (_highlightColorAnimation != null) {
              setState(() {
                _highlightColor =
                    _highlightColorAnimation!.value ?? Colors.transparent;
              });
            }
          });

      _highlightColorAnimation =
          ColorTween(
            begin: Colors.transparent,
            end: Colors.orange.withValues(alpha: 0.2),
          ).animate(
            CurvedAnimation(
              parent: _highlightAnimationController!,
              curve: Curves.easeInOutSine,
            ),
          );

      _highlightAnimationController!.repeat(reverse: true);

      Future<void>.delayed(const Duration(milliseconds: 3200), () {
        if (!mounted) return;
        if (_highlightAnimationController?.isAnimating ?? false) {
          _highlightAnimationController?.stop();
          _highlightAnimationController?.reverse();
          Future<void>.delayed(const Duration(milliseconds: 800), () {
            if (mounted) setState(() => _highlightColor = Colors.transparent);
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _highlightAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(certificateDetailProvider(widget.certificateId));

    return async.when(
      data: (data) {
        if (data == null) return const SizedBox.shrink();
        final packages = data.packages;
        if (packages.isEmpty) return const SizedBox.shrink();

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: _highlightColor,
          ),
          child: AppExpansionTile(
            title: const Text('Покупка пакета'),
            initiallyExpanded: _isBuySectionExpanded,
            onExpansionChanged: (value) =>
                setState(() => _isBuySectionExpanded = value),
            children: [
              PackageComparison(
                onSelectPackage: (package) {
                  final id = package.id;
                  if (id == null) return;
                  AppRouters.goToBuy(
                    context.go,
                    offerId: id,
                    certificateId: data.certificate.id,
                  );
                },
                packages: packages,
                isMini: true,
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
