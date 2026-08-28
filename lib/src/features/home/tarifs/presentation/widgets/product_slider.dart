import 'package:flutter/material.dart';
import 'package:saas_ui/src/features/home/tarifs/presentation/widgets/product_card.dart';
import 'package:saas_ui/src/core/network/models/product.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    super.key,
    required this.onSelectProduct,
    required this.products,
    this.selectedProduct,
  });

  final ValueChanged<Product> onSelectProduct;
  final List<Product> products;
  final Product? selectedProduct;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    spacing: 16,
    children: [
      Wrap(
        alignment: WrapAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: [
          ...products.map(
            (product) => ProductCard(
              onTap: () => onSelectProduct(product),
              onTapMore: () => onSelectProduct(product),
              product: product,
              isSelected: selectedProduct?.id == product.id,
            ),
          ),
        ],
      ),
    ],
  );
}
