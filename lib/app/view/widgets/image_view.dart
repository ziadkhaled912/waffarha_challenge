import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:waffarha_challenge/generated/assets.dart';

enum ImageType { asset, file, url, svg }

class ImageView extends StatelessWidget {
  const ImageView(
    this.path,
    this.type, {
    super.key,
    this.placeHolderImagePath = Assets.imagesImagePlaceholder,
    this.height,
    this.width,
    this.isVideo = false,
    this.bottomRadius = true,
    this.fit,
    this.isCircular = false,
    this.backgroundColor,
    this.imageColor,
    this.radius,
    this.maxCacheHeight,
    this.maxCacheWidth,
    this.border,
  });
  final String path;
  final ImageType type;
  final String placeHolderImagePath;
  final double? height;
  final double? width;
  final double? radius;
  final BoxFit? fit;
  final bool isCircular;
  final Color? backgroundColor;
  final Color? imageColor;
  final bool isVideo;
  final int? maxCacheHeight;
  final int? maxCacheWidth;
  final bool bottomRadius;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          border: border,
          borderRadius: radius == null
              ? null
              : BorderRadius.vertical(
                  top: Radius.circular(radius ?? 0),
                  bottom:
                      bottomRadius ? Radius.circular(radius ?? 0) : Radius.zero,
                ),
        ),
        child: showImage(
          context,
          path,
          type,
          height,
          width,
          placeHolderImagePath,
          fit,
        ));
  }

  /// returns suitable Image widget.
  Widget showImage(
    BuildContext context,
    String path,
    ImageType type,
    double? height,
    double? width,
    String placeHolderImagePath,
    BoxFit? fit,
  ) {
    if (path.isNotEmpty) {
      switch (type) {
        case ImageType.svg:
          return SvgPicture.asset(
            path,
            height: height,
            width: width,
            fit: fit ?? BoxFit.scaleDown,
            color: imageColor,
          );
        case ImageType.asset:
          try {
            return Image.asset(
              path,
              height: height,
              width: width,
              fit: fit,
              color: imageColor,
            );
          } catch (e) {
            return _placeHolder(
              placeHolderImagePath: placeHolderImagePath,
              height: height,
              width: width,
              fit: fit,
            );
          }
        case ImageType.file:
          try {
            final f = File(path);
            if (f.existsSync()) {
              return Image.file(
                f,
                height: height,
                width: width,
                fit: fit,
              );
            } else {
              return _placeHolder(
                placeHolderImagePath: placeHolderImagePath,
                height: height,
                width: width,
                fit: fit,
              );
            }
          } catch (e) {
            return _placeHolder(
                placeHolderImagePath: placeHolderImagePath,
                height: height,
                width: width,
                fit: fit);
          }
        case ImageType.url:
          try {
            if (path.contains('.svg')) {
              return SvgPicture.network(
                path,
                height: height,
                width: width,
                fit: fit ?? BoxFit.scaleDown,
                color: imageColor,
                theme: const SvgTheme(
                  currentColor: Colors.white,
                ),
              );
            }
            return SizedBox(
              width: width,
              height: height,
              child: CachedNetworkImage(
                imageUrl: path,
                placeholder: (context, url) => loadingWidget(height, width),
                errorWidget: (context, url, error) => _placeHolder(
                  placeHolderImagePath: placeHolderImagePath,
                  height: height,
                  width: width,
                  fit: fit,
                ),
                height: height,
                fit: fit,
              ),
            );
          } catch (e) {
            return _placeHolder(
              placeHolderImagePath: placeHolderImagePath,
              height: height,
              width: width,
              fit: fit,
            );
          }
      }
    } else {
      return _placeHolder(
        placeHolderImagePath: placeHolderImagePath,
        height: height,
        width: width,
        fit: fit,
      );
    }
  }

  /// A Placeholder widget.
  Widget _placeHolder({
    required String placeHolderImagePath,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    if (isVideo == true) {
      return Container();
    }
    return Image.asset(
      placeHolderImagePath,
      height: height,
      width: width,
      fit: fit,
    );
  }

  /// A loader widget
  Widget loadingWidget(double? height, double? width) {
    if (isVideo == true) {
      return const SizedBox();
    }
    return LottieBuilder.asset(
      Assets.lottieLoadingImg,
      height: height,
      width: width,
    );
  }
}
