import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/features/home/tarifs/application/tarifs_notifier.dart';
import 'package:saas_ui/src/features/home/tarifs/presentation/widgets/package_comparison.dart';
import 'package:saas_ui/src/features/home/tarifs/presentation/widgets/product_slider.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart' show AppRouters;
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/shared/widgets/padding_page_content.dart';

class TarifsScreen extends ConsumerStatefulWidget {
  const TarifsScreen({super.key, this.isStandalone = false});

  final bool isStandalone;

  @override
  ConsumerState<TarifsScreen> createState() => _TarifsScreenState();
}

class _TarifsScreenState extends ConsumerState<TarifsScreen> {
  @override
  Widget build(BuildContext context) {
    final async = ref.watch(tarifsProvider);

    return Scaffold(
      appBar: widget.isStandalone
          ? null
          : const AppHomeHeader(title: 'Наши тарифы'),
      body: PaddingPageContent(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: async.when(
                data: (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  children: [
                    if (widget.isStandalone)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          'Наши тарифы',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textBold,
                          ),
                        ),
                      ),
                    if (data.products.length > 1)
                      ProductSlider(
                        onSelectProduct: (product) => ref
                            .read(tarifsProvider.notifier)
                            .selectProduct(product),
                        products: data.products,
                        selectedProduct: data.selectedProduct,
                      ),
                    if (data.packages.isNotEmpty)
                      PackageComparison(
                        onSelectPackage: (package) => _onSelectPackage(package),
                        packages: data.packagesForSelectedProduct,
                      ),
                  ],
                ),
                loading: () => const Padding(
                  padding: EdgeInsets.all(48),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (e, _) => Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text('$e'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSelectPackage(ProductOffer package) {
    final id = package.id;
    if (id == null) return;
    AppRouters.goToBuy(context.go, offerId: id);
  }
}
