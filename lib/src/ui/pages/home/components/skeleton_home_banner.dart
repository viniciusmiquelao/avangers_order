import 'package:avangers_order/src/config/constants/spacements.dart';
import 'package:avangers_order/src/ui/components/custom_shimmer.dart';
import 'package:flutter/material.dart';

class SkeletonHomeBanner extends StatelessWidget {
  const SkeletonHomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 125,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonBannerImage(),
          SizedBox(height: Spacements.XS),
          SkeletonBannerText(),
          SizedBox(height: Spacements.XS),
          SkeletonBannerText(width: 60),
        ],
      ),
    );
  }
}

class SkeletonBannerImage extends StatelessWidget {
  const SkeletonBannerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      isLoading: true,
      loadingChild: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: Alignment.center,
        width: 140,
        height: 185,
      ),
      child: Container(),
    );
  }
}

class SkeletonBannerText extends StatelessWidget {
  const SkeletonBannerText({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      isLoading: true,
      loadingChild: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: Alignment.center,
        height: 20,
        width: width,
      ),
      child: Container(),
    );
  }
}
