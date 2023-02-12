import '../../../core/components/text/headline/headline3_text.dart';
import '../../../core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/common/provider/view_model_provider.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SplashViewModel>(
      model: SplashViewModel(context: context)..navigateToBottomBar(),
      builder: (model) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lottie/green_trucks.json',
              ),
              Column(
                children: [
                  Headline3Text(
                    text: 'Loading',
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 30),
                  const CircularProgressIndicator.adaptive()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
