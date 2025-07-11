/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/origemjhanpoll.png
  AssetGenImage get origemjhanpoll =>
      const AssetGenImage('assets/images/origemjhanpoll.png');

  /// List of all assets
  List<AssetGenImage> get values => [origemjhanpoll];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/applestore_dark.svg
  String get applestoreDark => 'assets/svg/applestore_dark.svg';

  /// File path: assets/svg/applestore_light.svg
  String get applestoreLight => 'assets/svg/applestore_light.svg';

  /// File path: assets/svg/icon_pdf.svg
  String get iconPdf => 'assets/svg/icon_pdf.svg';

  /// File path: assets/svg/icon_whats_app.svg
  String get iconWhatsApp => 'assets/svg/icon_whats_app.svg';

  /// File path: assets/svg/playstore_dark.svg
  String get playstoreDark => 'assets/svg/playstore_dark.svg';

  /// File path: assets/svg/playstore_light.svg
  String get playstoreLight => 'assets/svg/playstore_light.svg';

  /// List of all assets
  List<String> get values => [
    applestoreDark,
    applestoreLight,
    iconPdf,
    iconWhatsApp,
    playstoreDark,
    playstoreLight,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
