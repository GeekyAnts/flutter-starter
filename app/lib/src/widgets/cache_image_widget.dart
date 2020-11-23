import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  CachedImage({
    Key key,
    @required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.placeholder,
    this.errorWidget,
  })  : assert(imageUrl != null),
        super(key: key);

  final String imageUrl;
  final BoxFit fit;
  final double height;
  final double width;
  final Widget placeholder;
  final Widget errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) => placeholder ?? CircularProgressIndicator(),
      errorWidget: (context, url, err) =>
          errorWidget ?? Icon(Icons.error_outline),
    );
  }
}
