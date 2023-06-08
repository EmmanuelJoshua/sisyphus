import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sisyphus/core/core.dart';

import 'package:sisyphus/shared/widgets/widgets.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.title,
    required this.onPressed,
    required this.color,
    this.height,
    this.width,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;
  final Color color;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        color: color,
        elevation: 0,
        padding: const EdgeInsets.all(6),
        onPressed: onPressed,
        child: SubText(
          text: title,
          foreground: white,
          textSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class DefaultImageButton extends StatelessWidget {
  const DefaultImageButton({
    required this.image,
    required this.onPressed,
    this.isSvg = false,
    this.size = 32,
    super.key,
  });

  final String image;
  final VoidCallback onPressed;
  final bool isSvg;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: InkWell(
        child: isSvg
            ? SvgPicture.asset(
                image,
              )
            : Image.asset(
                image,
              ),
      ),
    );
  }
}
