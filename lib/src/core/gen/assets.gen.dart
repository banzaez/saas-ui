// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsAppIconGen {
  const $AssetsAppIconGen();

  /// File path: assets/app_icon/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/app_icon/logo.svg');

  /// List of all assets
  List<SvgGenImage> get values => [logo];
}

class $AssetsBuyGen {
  const $AssetsBuyGen();

  /// File path: assets/buy/bank.svg
  SvgGenImage get bank => const SvgGenImage('assets/buy/bank.svg');

  /// File path: assets/buy/card.svg
  SvgGenImage get card => const SvgGenImage('assets/buy/card.svg');

  /// File path: assets/buy/qr.svg
  SvgGenImage get qr => const SvgGenImage('assets/buy/qr.svg');

  /// List of all assets
  List<SvgGenImage> get values => [bank, card, qr];
}

class $AssetsIntegrationsGen {
  const $AssetsIntegrationsGen();

  /// File path: assets/integrations/moysklad.png
  AssetGenImage get moysklad =>
      const AssetGenImage('assets/integrations/moysklad.png');

  /// List of all assets
  List<AssetGenImage> get values => [moysklad];
}

class $AssetsSidebarGen {
  const $AssetsSidebarGen();

  /// Directory path: assets/sidebar/icons
  $AssetsSidebarIconsGen get icons => const $AssetsSidebarIconsGen();
}

class $AssetsSidebarIconsGen {
  const $AssetsSidebarIconsGen();

  /// File path: assets/sidebar/icons/certificates.svg
  SvgGenImage get certificates =>
      const SvgGenImage('assets/sidebar/icons/certificates.svg');

  /// File path: assets/sidebar/icons/companies.svg
  SvgGenImage get companies =>
      const SvgGenImage('assets/sidebar/icons/companies.svg');

  /// File path: assets/sidebar/icons/files.svg
  SvgGenImage get files => const SvgGenImage('assets/sidebar/icons/files.svg');

  /// File path: assets/sidebar/icons/legal_entities.svg
  SvgGenImage get legalEntities =>
      const SvgGenImage('assets/sidebar/icons/legal_entities.svg');

  /// File path: assets/sidebar/icons/packages.svg
  SvgGenImage get packages =>
      const SvgGenImage('assets/sidebar/icons/packages.svg');

  /// File path: assets/sidebar/icons/payments.svg
  SvgGenImage get payments =>
      const SvgGenImage('assets/sidebar/icons/payments.svg');

  /// File path: assets/sidebar/icons/referrals.svg
  SvgGenImage get referrals =>
      const SvgGenImage('assets/sidebar/icons/referrals.svg');

  /// File path: assets/sidebar/icons/services.svg
  SvgGenImage get services =>
      const SvgGenImage('assets/sidebar/icons/services.svg');

  /// File path: assets/sidebar/icons/settings.svg
  SvgGenImage get settings =>
      const SvgGenImage('assets/sidebar/icons/settings.svg');

  /// File path: assets/sidebar/icons/statistics.svg
  SvgGenImage get statistics =>
      const SvgGenImage('assets/sidebar/icons/statistics.svg');

  /// File path: assets/sidebar/icons/system_logs.svg
  SvgGenImage get systemLogs =>
      const SvgGenImage('assets/sidebar/icons/system_logs.svg');

  /// File path: assets/sidebar/icons/tarifs.svg
  SvgGenImage get tarifs =>
      const SvgGenImage('assets/sidebar/icons/tarifs.svg');

  /// File path: assets/sidebar/icons/token_transactions.svg
  SvgGenImage get tokenTransactions =>
      const SvgGenImage('assets/sidebar/icons/token_transactions.svg');

  /// File path: assets/sidebar/icons/users.svg
  SvgGenImage get users => const SvgGenImage('assets/sidebar/icons/users.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    certificates,
    companies,
    files,
    legalEntities,
    packages,
    payments,
    referrals,
    services,
    settings,
    statistics,
    systemLogs,
    tarifs,
    tokenTransactions,
    users,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsAppIconGen appIcon = $AssetsAppIconGen();
  static const $AssetsBuyGen buy = $AssetsBuyGen();
  static const $AssetsIntegrationsGen integrations = $AssetsIntegrationsGen();
  static const $AssetsSidebarGen sidebar = $AssetsSidebarGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
