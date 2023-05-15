import 'package:avangers_order/src/config/constants/spacements.dart';
import 'package:avangers_order/src/data/models/marvel_film_model.dart';
import 'package:avangers_order/src/ui/pages/home/components/skeleton_home_banner.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeBannerComponent extends StatelessWidget {
  const HomeBannerComponent({super.key, required this.film});

  final MarvelFilmModel film;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              width: 140,
              height: 185,
              imageUrl: film.posterPath,
              placeholder: (context, url) => const SkeletonBannerImage(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: Spacements.XS),
          Text(
            film.title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: Spacements.XS),
          Text(
            '(${film.releaseDate.substring(0, 4)})',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
          )
        ],
      ),
    );
  }
}
