import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';

class BaseReferenceChoiceList<T extends BaseModel> extends StatefulWidget {
  const BaseReferenceChoiceList({
    super.key,
    this.onCreate,
    required this.selectedItem,
    required this.items,
    this.buildEditPanel,
  });

  final ValueChanged<T?>? onCreate;
  final T? selectedItem;
  final List<T> items;

  /// Ленивый builder — вызывается только при нажатии кнопки "Создать новый"
  final Widget? Function(BuildContext)? buildEditPanel;

  @override
  State<BaseReferenceChoiceList<T>> createState() =>
      _BaseReferenceChoiceListState<T>();
}

class _BaseReferenceChoiceListState<T extends BaseModel>
    extends State<BaseReferenceChoiceList<T>> {
  final _searchController = TextEditingController();
  List<T> _filtered = [];

  @override
  void initState() {
    super.initState();
    _filtered = widget.items;
    _searchController.addListener(_onSearch);
  }

  @override
  void didUpdateWidget(BaseReferenceChoiceList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _onSearch();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filtered = query.isEmpty
          ? widget.items
          : widget.items
                .where(
                  (item) =>
                      item.getName.toLowerCase().contains(query) ||
                      item.id.toString().contains(query),
                )
                .toList();
    });
  }

  @override
  Widget build(BuildContext context) => Dialog(
    backgroundColor: Colors.transparent,
    insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
    child: AppContainer(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(maxWidth: 420, maxHeight: 620),
      borderRadius: 16,
      borderColor: Colors.grey.withValues(alpha: .18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: 40,
          spreadRadius: 2,
          offset: const Offset(0, 12),
        ),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildSearch(context),
          ),
          if (widget.buildEditPanel != null) ...[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildButtonCreate(context),
            ),
          ],
          const SizedBox(height: 10),
          Expanded(child: _buildList()),
          const SizedBox(height: 12),
        ],
      ),
    ),
  );

  Widget _buildHeader() => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColors.primary, AppColors.primary.shade800],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
    ),
    padding: const EdgeInsets.fromLTRB(20, 16, 8, 16),
    child: Row(
      children: [
        const Icon(Icons.list_alt_rounded, color: Colors.white70, size: 20),
        const SizedBox(width: 10),
        const Expanded(
          child: Text(
            'Выберите из списка',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => context.pop(null),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.close_rounded,
                color: Colors.white.withValues(alpha: .8),
                size: 20,
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildSearch(BuildContext context) => TextField(
    controller: _searchController,
    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    decoration: InputDecoration(
      hintText: 'Поиск по названию или ID...',
      hintStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textGrey,
      ),
      prefixIcon: const Icon(
        Icons.search_rounded,
        size: 20,
        color: AppColors.primary,
      ),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primary.withValues(alpha: .3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.withValues(alpha: .3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface,
      suffixIcon: _searchController.text.isNotEmpty
          ? IconButton(
              icon: const Icon(Icons.clear_rounded, size: 16),
              color: AppColors.textGrey,
              onPressed: _searchController.clear,
            )
          : null,
    ),
  );

  Widget _buildList() {
    if (_filtered.isEmpty) {
      final bool isSearchActive = _searchController.text.isNotEmpty;
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Icon(
              isSearchActive ? Icons.search_off_rounded : Icons.inbox_rounded,
              size: 42,
              color: AppColors.textGrey.withValues(alpha: .4),
            ),
            Text(
              isSearchActive ? 'Ничего не найдено' : 'Список пуст',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: _filtered.length,
      separatorBuilder: (_, _) => const SizedBox(height: 4),
      itemBuilder: (context, index) => _buildItem(context, _filtered[index]),
    );
  }

  Widget _buildItem(BuildContext context, T item) {
    final bool isSelected = item.id == widget.selectedItem?.id;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => context.pop(item),
        hoverColor: AppColors.primary.withValues(alpha: .05),
        splashColor: AppColors.primary.withValues(alpha: .1),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withValues(alpha: .07)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected
                  ? AppColors.primary.withValues(alpha: .3)
                  : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              _buildIdBadge(item),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item.getName,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              if (isSelected)
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIdBadge(T item) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    decoration: BoxDecoration(
      color: AppColors.primary.withValues(alpha: .08),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      '${item.id}',
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
    ),
  );

  Widget _buildButtonCreate(BuildContext context) => OutlinedButton.icon(
    onPressed: () => _openCreateDialog(context),
    icon: const Icon(Icons.add_rounded, size: 16),
    label: const Text('Создать новый'),
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      side: BorderSide(color: AppColors.primary.withValues(alpha: .5)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 10),
    ),
  );

  Future<void> _openCreateDialog(BuildContext context) async {
    final Widget? panel = widget.buildEditPanel?.call(context);
    if (panel == null) return;

    final router = GoRouter.of(context);

    final T? created = await showDialog<T>(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: SizedBox(height: double.infinity, child: panel),
          ),
        ),
      ),
    );
    if (created != null) {
      widget.onCreate?.call(created);
      router.pop(created);
    }
  }
}
