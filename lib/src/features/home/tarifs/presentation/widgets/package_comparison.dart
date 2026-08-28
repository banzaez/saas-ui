import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/features/home/tarifs/presentation/widgets/package_card.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

class TariffGroup {
  final String label;
  final int sortOrder;

  const TariffGroup(this.label, this.sortOrder);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TariffGroup &&
          runtimeType == other.runtimeType &&
          label == other.label;

  @override
  int get hashCode => label.hashCode;
}

class PackageComparison extends StatefulWidget {
  const PackageComparison({
    super.key,
    required this.onSelectPackage,
    required this.packages,
    this.isMini = false,
  });

  final ValueChanged<ProductOffer> onSelectPackage;
  final List<ProductOffer> packages;
  final bool isMini;

  @override
  State<PackageComparison> createState() => _PackageComparisonState();
}

class _PackageComparisonState extends State<PackageComparison> {
  Map<TariffGroup, List<ProductOffer>> _grouped = {};
  List<TariffGroup> _availableGroups = [];
  TariffGroup? _selectedGroup;

  @override
  void initState() {
    super.initState();
    _recalculateGroups();
    if (_availableGroups.isNotEmpty) {
      _selectedGroup = _availableGroups.first;
    }
  }

  @override
  void didUpdateWidget(PackageComparison oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(oldWidget.packages, widget.packages)) {
      _recalculateGroups();
      if (_availableGroups.isEmpty) {
        _selectedGroup = null;
      } else if (_selectedGroup == null ||
          !_availableGroups.contains(_selectedGroup)) {
        _selectedGroup = _availableGroups.first;
      }
    }
  }

  void _recalculateGroups() {
    final Map<TariffGroup, List<ProductOffer>> data = {};

    for (final p in widget.packages) {
      TariffGroup group;

      if (p.periodType == PeriodType.month && p.totalPeriodValue > 0) {
        final months = p.totalPeriodValue;
        group = TariffGroup(_monthLabel(months), months);
      } else {
        if (p.type == PackageType.tokenBased) {
          group = const TariffGroup('Пакеты', 10000);
        } else {
          group = const TariffGroup('Другое', 20000);
        }
      }

      data.putIfAbsent(group, () => []).add(p);
    }
    _grouped = data;

    final keys = data.keys.toList();
    keys.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    _availableGroups = keys;
  }

  String _monthLabel(int months) {
    final n = months % 100;
    final n1 = n % 10;
    if (n > 10 && n < 20) return '$months месяцев';
    if (n1 > 1 && n1 < 5) return '$months месяца';
    if (n1 == 1) return '$months месяц';
    return '$months месяцев';
  }

  @override
  Widget build(BuildContext context) {
    if (_availableGroups.isEmpty) return const SizedBox.shrink();

    final selectedGroup = _selectedGroup ?? _availableGroups.first;
    final currentPackages = _grouped[selectedGroup] ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: widget.isMini ? 16 : 32,
      children: [
        if (!widget.isMini)
          const Text(
            'Тарифы',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          ),
        if (_availableGroups.length > 1)
          Center(
            child: _TariffSwitcher(
              groups: _availableGroups,
              selectedGroup: selectedGroup,
              onChanged: (group) => setState(() => _selectedGroup = group),
            ),
          ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            ...currentPackages.map(
              (p) => SizedBox(
                width: widget.isMini ? 280 : 300,
                height: widget.isMini ? 360 : 410,
                child: PackageCard(
                  key: ValueKey('pkg_${p.id}'),
                  onTap: () => widget.onSelectPackage(p),
                  package: p,
                  isRecommended: widget.packages.indexOf(p) == 1,
                  isMini: widget.isMini,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TariffSwitcher extends StatelessWidget {
  final List<TariffGroup> groups;
  final TariffGroup selectedGroup;
  final ValueChanged<TariffGroup> onChanged;

  const _TariffSwitcher({
    required this.groups,
    required this.selectedGroup,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F4F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < groups.length; i++) ...[
            _buildTab(groups[i]),
            if (i < groups.length - 1) _buildDivider(i),
          ],
        ],
      ),
    );
  }

  Widget _buildTab(TariffGroup group) {
    final isSelected = group == selectedGroup;
    return GestureDetector(
      key: ValueKey('tab_${group.label}'),
      onTap: () => onChanged(group),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withAlpha(13),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Text(
          group.label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? AppColors.primary : AppColors.textGrey,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider(int index) {
    final showDivider =
        groups[index] != selectedGroup && groups[index + 1] != selectedGroup;

    if (!showDivider) return const SizedBox(width: 5);

    return Container(
      width: 1,
      height: 16,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      color: const Color(0xFFD1D5DB),
    );
  }
}
