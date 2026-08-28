import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/features/support/products/application/products_notifier.dart';
import 'package:saas_ui/src/features/support/products/application/products_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/app_divider.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/base_riverpod_crud_edit_panel.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/info_item.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/legal_entity_reference_field.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/product_offers_reference_field.dart';

class ProductsEditPanel extends BaseRiverpodCrudEditPanel<Product> {
  const ProductsEditPanel({super.key});

  @override
  Product? watchPanel(WidgetRef ref) => ref.watch(productsPanelProvider);

  @override
  String get createTitle => 'Создание продукта';

  @override
  String get editTitle => 'Редактирование продукта';

  @override
  Future<Product?> performSave(WidgetRef ref, Product item) =>
      ref.read(productsProvider.notifier).saveItem(item);

  @override
  void closePanel(WidgetRef ref) =>
      ref.read(productsPanelProvider.notifier).close();

  @override
  List<EditPanelInfoItem>? buildInfo(WidgetRef ref, Product item) => [
    EditPanelInfoItem(title: 'ID', value: '${item.id ?? ''}'),
  ];

  void _set(WidgetRef ref, Product item) =>
      ref.read(productsPanelProvider.notifier).open(item);

  @override
  List<Widget> buildFormChildren(
    BuildContext context,
    WidgetRef ref,
    Product item,
  ) => [
    TextFormField(
      onChanged: (value) => _set(ref, item.copyWith(name: value)),
      initialValue: item.name,
      decoration: const InputDecoration(labelText: 'Наименование'),
      maxLines: null,
      validator: _nameValidator,
    ),
    LegalEntityReferenceField(
      onChanged: (value) => _set(ref, item.copyWith(sellerId: value!.id!)),
      decoration: const InputDecoration(labelText: 'Продавец'),
      initialValue: item.sellerId,
      sellersOnly: true,
      validator: _sellerValidator,
    ),
    TextFormField(
      onChanged: (value) => _set(ref, item.copyWith(description: value)),
      initialValue: item.description,
      decoration: const InputDecoration(labelText: 'Описание'),
      maxLines: null,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      validator: _descriptionValidator,
    ),
    const AppDivider(),
    ProductOffersReferenceField(
      productId: item.id,
      onChanged: (value) =>
          _set(ref, item.copyWith(demoProductOfferId: value?.id)),
      initialValue: item.demoProductOfferId,
      decoration: const InputDecoration(
        labelText: 'Демо пакет',
        hintText: 'Выберите пакет',
        helperText: 'Пакет для демонстрации продукта',
      ),
      showClearButton: true,
    ),
    const AppDivider(),
    TextFormField(
      onChanged: (value) => _set(ref, item.copyWith(url: value)),
      initialValue: item.url,
      decoration: const InputDecoration(labelText: 'URL API сервиса'),
      maxLines: null,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      validator: _urlValidator,
    ),
    TextFormField(
      onChanged: (value) => _set(ref, item.copyWith(keyName: value)),
      initialValue: item.keyName,
      decoration: const InputDecoration(labelText: 'Ключевое имя'),
    ),
    Container(
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: item.useProxy 
          ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.03)
          : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: item.useProxy 
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.15)
            : Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        children: [
          SwitchListTile(
            secondary: Icon(
              Icons.vpn_lock, 
              color: item.useProxy 
                ? Theme.of(context).colorScheme.primary 
                : Theme.of(context).hintColor,
            ),
            title: const Text('Использовать прокси'),
            subtitle: item.useProxy ? null : Text(
              'Перенаправлять трафик через промежуточный сервер',
              style: TextStyle(fontSize: 11, color: Theme.of(context).hintColor),
            ),
            value: item.useProxy,
            onChanged: (v) => _set(
                ref,
                item.copyWith(
                  useProxy: v,
                  proxyParameters: v ? item.proxyParameters : null,
                )),
          ),
          if (item.useProxy) ...[
            Divider(
              height: 1,
              thickness: 1,
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              indent: 16,
              endIndent: 16,
            ),
            ..._buildProxySettings(context, ref, item),
          ],
        ],
      ),
    ),
    const AppDivider(),
    SwitchListTile(
      title: const Text('Активен'),
      value: item.isActive,
      onChanged: (v) => _set(ref, item.copyWith(isActive: v)),
    ),
  ];

  void _updateProxy(WidgetRef ref, Product item, ProxyParameters proxy) {
    _set(ref, item.copyWith(proxyParameters: proxy));
  }

  List<Widget> _buildProxySettings(
    BuildContext context,
    WidgetRef ref,
    Product item,
  ) =>
      [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.tune,
                      size: 14,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.7)),
                  const SizedBox(width: 8),
                  Text(
                    'КОНФИГУРАЦИЯ СОЕДИНЕНИЯ',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      color:
                          Theme.of(context).colorScheme.primary.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      initialValue: item.proxyParameters?.host,
                      onChanged: (v) => _updateProxy(
                          ref,
                          item,
                          (item.proxyParameters ?? const ProxyParameters())
                              .copyWith(
                                  host: v.trim().isEmpty ? null : v.trim())),
                      decoration: const InputDecoration(
                        labelText: 'Host',
                        hintText: 'например: 192.168.1.1',
                        isDense: true,
                        prefixIcon: Icon(Icons.lan_outlined, size: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      initialValue: item.proxyParameters?.port,
                      onChanged: (v) => _updateProxy(
                          ref,
                          item,
                          (item.proxyParameters ?? const ProxyParameters())
                              .copyWith(
                                  port: v.trim().isEmpty ? null : v.trim())),
                      decoration: const InputDecoration(
                        labelText: 'Port',
                        hintText: '8080',
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: item.proxyParameters?.user,
                      onChanged: (v) => _updateProxy(
                          ref,
                          item,
                          (item.proxyParameters ?? const ProxyParameters())
                              .copyWith(
                                  user: v.trim().isEmpty ? null : v.trim())),
                      decoration: const InputDecoration(
                        labelText: 'User',
                        isDense: true,
                        prefixIcon: Icon(Icons.person_outline, size: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      initialValue: item.proxyParameters?.password,
                      onChanged: (v) => _updateProxy(
                          ref,
                          item,
                          (item.proxyParameters ?? const ProxyParameters())
                              .copyWith(
                                  password:
                                      v.trim().isEmpty ? null : v.trim())),
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        isDense: true,
                        prefixIcon: Icon(Icons.lock_outline, size: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ];

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Наименование не может быть пустым';
    }
    return null;
  }

  String? _sellerValidator(LegalEntity? value) {
    if (value == null) return 'Продавец не может быть пустым';
    return null;
  }

  String? _descriptionValidator(String? value) {
    if (value == null || value.isEmpty) return 'Описание не может быть пустым';
    return null;
  }

  String? _urlValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL API сервиса не может быть пустым';
    }
    return null;
  }
}
