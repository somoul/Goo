import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:goo_rent/enum/media_type.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/helper/view_photo.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:shimmer/shimmer.dart';

ImageProvider getImageProvider({
  required dynamic data,
  required MediaSourceTypes source,
  ImageBuilder? builder,
}) {
  switch (source) {
    case MediaSourceTypes.asset:
      assert(builder?.cacheWidth == null || builder!.cacheWidth! > 0);
      assert(builder?.cacheHeight == null || builder!.cacheHeight! > 0);

      if (data.toString().toLowerCase().endsWith('.svg')) {
        return svg_provider.Svg(
          data,
          size: builder?.size,
          scale: builder?.scale,
          color: builder?.color,
          source: svg_provider.SvgSource.asset,
        );
      }

      return ResizeImage.resizeIfNeeded(
        builder?.cacheWidth,
        builder?.cacheHeight,
        builder?.scale != null
            ? ExactAssetImage(
                data as String,
                bundle: builder?.bundle,
                scale: builder?.scale ?? 1.0,
                package: builder?.package,
              )
            : AssetImage(
                data as String,
                bundle: builder?.bundle,
                package: builder?.package,
              ),
      );
    case MediaSourceTypes.file:
      assert(
        !kIsWeb,
        'Image.file is not supported on Flutter Web. '
        'Consider using either Image.asset or Image.network instead.',
      );
      assert(builder?.cacheWidth == null || builder!.cacheWidth! > 0);
      assert(builder?.cacheHeight == null || builder!.cacheHeight! > 0);

      if (data.toString().toLowerCase().endsWith('.svg')) {
        return svg_provider.Svg(
          data,
          size: builder?.size,
          scale: builder?.scale,
          color: builder?.color,
          source: svg_provider.SvgSource.file,
        );
      }

      return ResizeImage.resizeIfNeeded(
        builder?.cacheWidth,
        builder?.cacheHeight,
        FileImage(
          data as File,
          scale: builder?.scale ?? 1.0,
        ),
      );
    case MediaSourceTypes.network:
      assert(builder?.cacheWidth == null || builder!.cacheWidth! > 0);
      assert(builder?.cacheHeight == null || builder!.cacheHeight! > 0);

      if (data.toString().toLowerCase().endsWith('.svg')) {
        return svg_provider.Svg(
          data,
          size: builder?.size,
          scale: builder?.scale,
          color: builder?.color,
          source: svg_provider.SvgSource.network,
        );
      }

      return ResizeImage.resizeIfNeeded(
        builder?.cacheWidth,
        builder?.cacheHeight,
        NetworkImage(
          data as String,
          scale: builder?.scale ?? 1.0,
          headers: builder?.headers,
        ),
      );
    case MediaSourceTypes.cacheNetwork:
      assert(builder?.cacheWidth == null || builder!.cacheWidth! > 0);
      assert(builder?.cacheHeight == null || builder!.cacheHeight! > 0);

      if (data.toString().toLowerCase().endsWith('.svg')) {
        return svg_provider.Svg(
          data,
          size: builder?.size,
          scale: builder?.scale,
          color: builder?.color,
          source: svg_provider.SvgSource.network,
        );
      }

      return ResizeImage.resizeIfNeeded(
        builder?.cacheWidth,
        builder?.cacheHeight,
        CachedNetworkImageProvider(
          data as String,
          scale: builder?.scale ?? 1.0,
          headers: builder?.headers,
        ),
      );
    case MediaSourceTypes.memory:
      assert(builder?.cacheWidth == null || builder!.cacheWidth! > 0);
      assert(builder?.cacheHeight == null || builder!.cacheHeight! > 0);

      return ResizeImage.resizeIfNeeded(
          builder?.cacheWidth,
          builder?.cacheHeight,
          MemoryImage(Uint8List.fromList(data), scale: builder?.scale ?? 1.0));
    case MediaSourceTypes.base64:
      assert(builder?.cacheWidth == null || builder!.cacheWidth! > 0);
      assert(builder?.cacheHeight == null || builder!.cacheHeight! > 0);

      final bytes =
          convert.base64.decode((data as String).split(',').last.trim());

      return ResizeImage.resizeIfNeeded(
        builder?.cacheWidth,
        builder?.cacheHeight,
        MemoryImage(
          bytes,
          scale: builder?.scale ?? 1.0,
        ),
      );
    default:
      throw 'Unknown image source $source';
  }
}

// ignore: unused_element
class _ImageProviderConstruct {
  final dynamic path;
  final MediaSourceTypes source;
  final ImageBuilder builder;

  _ImageProviderConstruct(this.path, this.source, this.builder);

  @override
  bool operator ==(Object other) {
    if (other is _ImageProviderConstruct) {
      return other.path == path &&
          other.source == source &&
          other.builder == builder;
    }
    return false;
  }

  @override
  int get hashCode => path.hashCode + source.hashCode + builder.hashCode;
}

Widget _defaultErrorBuilder(
  BuildContext context,
  Object error,
  StackTrace? stackTrace, {
  double? width,
  double? height,
  VoidCallback? onReload,
  ValueNotifier<bool>? loading,
}) {
  return Semantics(
    label: 'Image Error',
    child: GestureDetector(
      onTap: () {
        onReload?.call();
      },
      child: Container(
        width: width,
        height: height,
        color: Colors.grey[200],
        // color: Colors.transparent,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Builder(
            builder: (context) {
              if (loading != null) {
                return ValueListenableBuilder(
                  valueListenable: loading,
                  builder:
                      (BuildContext context, bool isLoading, Widget? child) {
                    if (isLoading) {
                      return const Padding(
                        padding: EdgeInsets.all(2),
                        child: CupertinoActivityIndicator(),
                      );
                    } else {
                      return ImageBuilder(width: 40, height: 40)
                          .asset("assets/image/app_logo.png");
                    }
                  },
                );
              } else {
                return ImageBuilder(width: 40, height: 40)
                    .asset("assets/image/app_logo.png");
              }
            },
          ),
        ),
      ),
    ),
  );
}

Widget _defaultLoadingBuilder(
  BuildContext context,
  Widget child,
  ImageChunkEvent? loadingProgress,
  ImageBuilder imageBuilder,
  ImageProvider imageProvider,
) {
  if (loadingProgress == null) {
    return GestureDetector(
      onTap: imageBuilder.canView
          ? () {
              // var index = imageBuilder.images.indexOf(imageProvider);
              // if (index >= 0) {
              //   viewPhotoByProvider(
              //       imageProviders: imageBuilder.images, initialIndex: index);
              // } else {
              //   viewPhotoByProvider(
              //     imageProviders: [imageProvider],
              //   );
              // }
              var index = imageBuilder.images.indexOf(imageProvider);
              if (index >= 0) {
                viewPhotoByProvider(
                    imageProviders: imageBuilder.images, initialIndex: index);
              } else {
                viewPhotoByProvider(imageProviders: [imageProvider]);
              }
            }
          : null,
      child: child,
    );
  }
  return Stack(
    children: [
      Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: Colors.grey[200]!,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 10,
            minWidth: 10,
          ),
          child: Container(
            height: imageBuilder.height,
            width: imageBuilder.width,
            decoration: BoxDecoration(
              color: Colors.grey[200]!,
              borderRadius: imageBuilder.clipRadius?.borderRadius,
            ),
          ),
        ),
      ),
    ],
  );
}

class ImageBuilder {
  List<ImageProvider> images = [];
  final ImageFrameBuilder? frameBuilder;
  final ImageLoadingBuilder? loadingBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;
  final String? semanticLabel;
  final bool? excludeFromSemantics;
  final double? width;
  final double? height;
  final Color? color;
  final Animation<double>? opacity;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final Alignment? alignment;
  final ImageRepeat? repeat;
  final Rect? centerSlice;
  final bool? matchTextDirection;
  final bool? gaplessPlayback;
  final bool? isAntiAlias;
  final FilterQuality? filterQuality;
  final double? scale;
  final Map<String, String>? headers;
  final int? cacheWidth;
  final int? cacheHeight;
  final AssetBundle? bundle;
  final String? package;
  final double? clipRadius;
  final WidgetBuilder? placeholderBuilder;
  final bool canView;

  Size? get size {
    if (width != null || height != null) {
      return Size(width ?? height!, height ?? width!);
    }
    return null;
  }

  ImageBuilder({
    Key? key,
    this.clipRadius,
    this.frameBuilder,
    this.loadingBuilder,
    this.placeholderBuilder,
    this.errorBuilder,
    this.semanticLabel,
    this.excludeFromSemantics,
    this.width,
    this.height,
    this.color,
    this.opacity,
    this.colorBlendMode,
    this.fit,
    this.alignment,
    this.repeat,
    this.centerSlice,
    this.matchTextDirection,
    this.gaplessPlayback,
    this.isAntiAlias,
    this.filterQuality,
    this.scale,
    this.headers,
    this.cacheWidth,
    this.cacheHeight,
    this.bundle,
    this.package,
    this.canView = false,
  });

  ImageProvider networkProvider(String url) {
    return getImageProvider(
      data: url,
      source: MediaSourceTypes.network,
      builder: this,
    );
  }

  Widget asset(
    String path, {
    bool? allowDrawingOutsideViewBox,
    String? semanticsLabel,
    bool? excludeFromSemantics,
    Clip? clipBehavior,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    BlendMode? colorBlendMode,
    bool? cacheColorFilter,
  }) {
    return _ImageRenderer(
      imageBuilder: this,
      type: MediaSourceTypes.asset,
      data: path,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      theme: theme,
      colorFilter: colorFilter,
      colorBlendMode: colorBlendMode,
      cacheColorFilter: cacheColorFilter,
      cache: true,
    );
  }

  Widget network(
    String url, {
    bool cache = false,
    Widget? placeholder,
    bool? allowDrawingOutsideViewBox,
    String? semanticsLabel,
    bool? excludeFromSemantics,
    Clip? clipBehavior,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    BlendMode? colorBlendMode,
    bool? cacheColorFilter,
  }) {
    return _ImageRenderer(
      imageBuilder: this,
      type: cache ? MediaSourceTypes.cacheNetwork : MediaSourceTypes.network,
      data: url,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      theme: theme,
      colorFilter: colorFilter,
      colorBlendMode: colorBlendMode,
      cacheColorFilter: cacheColorFilter,
      cache: true,
    );
  }
}

class _ImageRenderer extends StatefulWidget {
  final ImageBuilder imageBuilder;
  final MediaSourceTypes type;
  final dynamic data;
  final bool? allowDrawingOutsideViewBox;
  final String? semanticsLabel;
  final bool? excludeFromSemantics;
  final Clip? clipBehavior;
  final SvgTheme theme;
  final ColorFilter? colorFilter;
  final BlendMode? colorBlendMode;
  final bool? cacheColorFilter;
  final bool cache;

  const _ImageRenderer({
    required this.imageBuilder,
    required this.type,
    required this.data,
    this.allowDrawingOutsideViewBox,
    this.semanticsLabel,
    this.excludeFromSemantics,
    this.clipBehavior,
    this.theme = const SvgTheme(),
    this.colorFilter,
    this.colorBlendMode,
    this.cacheColorFilter,
    required this.cache,
  });

  @override
  State<_ImageRenderer> createState() => _ImageRendererState();
}

class _ImageRendererState extends State<_ImageRenderer> {
  var randomString = getRandomString(10);
  late ImageProvider imageProvider;
  dynamic previousData;
  final imageLoading = ValueNotifier(false);
  Timer? _loadingTimer;

  _reloadImage() {
    print(widget.type);
    print(widget.data);
    _loadingTimer?.cancel();
    imageLoading.value = true;
    _loadingTimer = Timer(const Duration(milliseconds: 600), () {
      imageLoading.value = false;
      _loadingTimer = null;
    });

    setState(() {
      imageProvider = getImageProvider(
        data: widget.data,
        source: widget.type,
        builder: widget.imageBuilder,
      );
      randomString = getRandomString(10);
    });
  }

  makeProvider() {
    if (previousData != widget.data) {
      previousData = widget.data;
      imageProvider = getImageProvider(
        data: widget.data,
        source: widget.type,
        builder: widget.imageBuilder,
      );
    }
  }

  @override
  void initState() {
    makeProvider();
    widget.imageBuilder.images.add(imageProvider);

    super.initState();
  }

  @override
  void dispose() {
    widget.imageBuilder.images.remove(imageProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    try {
      makeProvider();
      late Widget image;

      if ((widget.data is String &&
              widget.data.toLowerCase().endsWith('.svg')) ||
          (widget.data is File &&
              widget.data.path.toLowerCase().endsWith('.svg'))) {
        if (widget.type == MediaSourceTypes.asset) {
          image = SizedBox(
            height: widget.imageBuilder.height,
            width: widget.imageBuilder.width,
            child: SvgPicture.asset(
              widget.data,
              key: ValueKey(randomString),
              matchTextDirection:
                  widget.imageBuilder.matchTextDirection ?? false,
              bundle: widget.imageBuilder.bundle,
              package: widget.imageBuilder.package,
              width: widget.imageBuilder.width,
              height: widget.imageBuilder.height,
              fit: widget.imageBuilder.fit ?? BoxFit.contain,
              alignment: widget.imageBuilder.alignment ?? Alignment.center,
              allowDrawingOutsideViewBox:
                  widget.allowDrawingOutsideViewBox ?? false,
              semanticsLabel: widget.semanticsLabel,
              excludeFromSemantics: widget.excludeFromSemantics ?? false,
              clipBehavior: widget.clipBehavior ?? Clip.hardEdge,
              theme: widget.theme,
              color: widget.imageBuilder.color,
              colorBlendMode: widget.colorBlendMode ?? BlendMode.srcIn,
              cacheColorFilter: widget.cacheColorFilter ?? false,
            ),
          );
        } else if (widget.type == MediaSourceTypes.network) {
          image = SizedBox(
            height: widget.imageBuilder.height,
            width: widget.imageBuilder.width,
            child: SvgPicture.network(
              widget.data,
              key: ValueKey(randomString),
              matchTextDirection:
                  widget.imageBuilder.matchTextDirection ?? false,
              width: widget.imageBuilder.width,
              height: widget.imageBuilder.height,
              fit: widget.imageBuilder.fit ?? BoxFit.contain,
              alignment: widget.imageBuilder.alignment ?? Alignment.center,
              allowDrawingOutsideViewBox:
                  widget.allowDrawingOutsideViewBox ?? false,
              placeholderBuilder: widget.imageBuilder.placeholderBuilder,
              semanticsLabel: widget.semanticsLabel,
              excludeFromSemantics:
                  widget.imageBuilder.excludeFromSemantics ?? false,
              clipBehavior: widget.clipBehavior ?? Clip.hardEdge,
              theme: widget.theme,
              colorBlendMode:
                  widget.imageBuilder.colorBlendMode ?? BlendMode.srcIn,
              cacheColorFilter: widget.cacheColorFilter ?? false,
            ),
          );
        } else if (widget.type == MediaSourceTypes.file) {
          image = SizedBox(
            height: widget.imageBuilder.height,
            width: widget.imageBuilder.width,
            child: Builder(
              builder: (context) {
                if (!(widget.data as File).existsSync()) {
                  return _defaultErrorBuilder(
                    context,
                    const FileNotFoundException('IMAGE'),
                    null,
                    onReload: _reloadImage,
                    loading: imageLoading,
                  );
                }
                return SvgPicture.file(
                  widget.data,
                  key: ValueKey(randomString),
                  matchTextDirection:
                      widget.imageBuilder.matchTextDirection ?? false,
                  width: widget.imageBuilder.width,
                  height: widget.imageBuilder.height,
                  fit: widget.imageBuilder.fit ?? BoxFit.contain,
                  alignment: widget.imageBuilder.alignment ?? Alignment.center,
                  allowDrawingOutsideViewBox:
                      widget.allowDrawingOutsideViewBox ?? false,
                  // placeholderBuilder: (context) {
                  //   return Text("hii");
                  // },
                  // placeholderBuilder: widget.imageBuilder.placeholderBuilder,
                  semanticsLabel: widget.semanticsLabel,
                  excludeFromSemantics:
                      widget.imageBuilder.excludeFromSemantics ?? false,
                  clipBehavior: widget.clipBehavior ?? Clip.hardEdge,
                  theme: widget.theme,
                  colorBlendMode:
                      widget.imageBuilder.colorBlendMode ?? BlendMode.srcIn,
                  cacheColorFilter: widget.cacheColorFilter ?? false,
                );
              },
            ),
          );
        }
      } else {
        image = Image(
          key: ValueKey(randomString),
          image: imageProvider,
          frameBuilder: widget.imageBuilder.frameBuilder,
          loadingBuilder: widget.imageBuilder.loadingBuilder ??
              (context, child, event) {
                return _defaultLoadingBuilder(
                  context,
                  child,
                  event,
                  widget.imageBuilder,
                  imageProvider,
                );
              },
          errorBuilder: widget.imageBuilder.errorBuilder ??
              (
                BuildContext context,
                Object error,
                StackTrace? stackTrace,
              ) {
                return _defaultErrorBuilder(
                  context,
                  error,
                  stackTrace,
                  width: widget.imageBuilder.width,
                  height: widget.imageBuilder.height,
                  onReload: _reloadImage,
                  loading: imageLoading,
                );
              },
          semanticLabel: widget.imageBuilder.semanticLabel,
          excludeFromSemantics:
              widget.imageBuilder.excludeFromSemantics ?? false,
          width: widget.imageBuilder.width,
          height: widget.imageBuilder.height,
          color: widget.imageBuilder.color,
          opacity: widget.imageBuilder.opacity,
          colorBlendMode: widget.imageBuilder.colorBlendMode,
          fit: widget.imageBuilder.fit,
          alignment: widget.imageBuilder.alignment ?? Alignment.center,
          repeat: widget.imageBuilder.repeat ?? ImageRepeat.noRepeat,
          centerSlice: widget.imageBuilder.centerSlice,
          matchTextDirection: widget.imageBuilder.matchTextDirection ?? false,
          gaplessPlayback: widget.imageBuilder.gaplessPlayback ?? false,
          isAntiAlias: widget.imageBuilder.isAntiAlias ?? false,
          filterQuality: widget.imageBuilder.filterQuality ?? FilterQuality.low,
        );
      }

      if (widget.imageBuilder.clipRadius != null &&
          widget.imageBuilder.clipRadius! > 0) {
        return ClipRRect(
          borderRadius: widget.imageBuilder.clipRadius!.borderRadius,
          child: image,
        );
      }
      return image;
    } catch (error, stackTrace) {
      return _defaultErrorBuilder(
        context,
        error,
        stackTrace,
        width: widget.imageBuilder.width,
        height: widget.imageBuilder.height,
        onReload: _reloadImage,
        loading: imageLoading,
      );
    }
  }
}
