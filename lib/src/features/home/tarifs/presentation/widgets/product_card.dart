import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';

class ProductCard extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onTapMore;
  final Product product;
  final bool isSelected;

  const ProductCard({
    super.key,
    required this.onTap,
    required this.onTapMore,
    required this.product,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) => AppContainer(
    constraints: const BoxConstraints(maxWidth: 300, maxHeight: 400),
    child: Stack(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 16),
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  _buildButton(),
                ],
              ),
            ),
          ),
        ),
        if (isSelected)
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
      ],
    ),
  );

  // ----------ICON-------------------------------------------------------------------------------

  Widget _buildIcon() => Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
      color: Colors.blue[100],
      borderRadius: BorderRadius.circular(24),
    ),
    child: Icon(Icons.analytics, color: Colors.blue[800]),
  );

  Widget _buildTop() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.blue[100],
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Text(
      'Популярный',
      style: TextStyle(
        fontSize: 12,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  // ----------HEADER-----------------------------------------------------------------------------

  Widget _buildHeader() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [_buildIcon(), _buildTop()],
  );

  // ----------BUTTON-----------------------------------------------------------------------------

  Widget _buildButton() => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: onTapMore,
        style: TextButton.styleFrom(foregroundColor: const Color(0xFFE67E22)),
        child: const Text('Подробнее'),
      ),
    ],
  );
}
