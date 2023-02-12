import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/common/provider/view_model_provider.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SplashViewModel>(
      model: SplashViewModel(context: context)..navigateToBottomBar(),
      builder: (model) => Scaffold(
        backgroundColor: const Color(0xff1E1E1E),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/yas_logo.png'),
                  Text(
                    'Geçmiş Olsun',
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Türkiye',
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ),
              const Spacer(flex: 2),
              Text(
                'Bu uygulama deprem bölgelerinde yardım alanları için yazılmıştır.',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
