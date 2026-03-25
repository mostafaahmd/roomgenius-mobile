import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {

  const CustomShimmer.circular({
    required double size, super.key,
    this.shapeBorder = const CircleBorder(),
  })  : width = size,
        height = size;

  const CustomShimmer.rectangular({
    required this.height, super.key,
    this.width = double.infinity,
    this.shapeBorder = const RoundedRectangleBorder(),
  });
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFF0F0F0),
      highlightColor: const Color(0xFFFAFAFA),
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.white, // Color doesn't matter, just needs to be opaque?
          // Actually for Shimmer to work, the child needs to be opaque.
          shape: shapeBorder,
        ),
      ),
    );
  }
}
