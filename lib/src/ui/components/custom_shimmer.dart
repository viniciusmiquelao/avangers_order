import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Widget loadingChild;
  final bool enabled;
  final Color? baseColor;
  final Color? highlightColor;
  final BorderRadius? borderRadius;

  const CustomShimmer({
    required this.isLoading,
    required this.child,
    required this.loadingChild,
    this.enabled = true,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child;
    }
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Shimmer.fromColors(
        baseColor: baseColor ?? Colors.grey[800]!,
        highlightColor: highlightColor ?? Colors.grey[600]!,
        child: loadingChild,
      ),
    );
  }
}
