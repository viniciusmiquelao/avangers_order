import 'package:avangers_order/src/ui/components/base_button.dart';
import 'package:flutter/material.dart';

import '../../../../config/constants/spacements.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacements.XL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Não foi possível buscar os dados',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: Spacements.M),
          BaseButton(text: 'Tentar Novamente', onPressed: onPressed),
        ],
      ),
    );
  }
}
