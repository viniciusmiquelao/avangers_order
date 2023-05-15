import 'package:avangers_order/src/config/constants/spacements.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'custom_image.dart';

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomError({
    required this.errorDetails,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(Spacements.M),
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomImage(image: CustomImages.mobile_error_image),
              const SizedBox(height: Spacements.M),
              Text(
                kDebugMode
                    ? errorDetails.summary.toString()
                    : 'Ops! Ocorreu um erro inesperado!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: kDebugMode ? Colors.red : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 21),
              ),
              const SizedBox(height: Spacements.S),
              const Text(
                kDebugMode
                    ? 'https://docs.flutter.dev/testing/errors'
                    : 'Já estamos trabalhando para corrigir.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
