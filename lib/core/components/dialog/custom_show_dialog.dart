import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../utils/constants/app_color.dart';
import '../../utils/theme/theme.dart';

Future<void> customMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.ligherGreen,
          child: Icon(
            Icons.check,
            color: AppColors.bermuda,
            size: 50,
          ),
        ),
        content: SingleChildScrollView(
          child: Text(
            'Tır gönderimi tamamlandı. Raporlar ekranında görüntüleyebilirsiniz.',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: myTheme.textTheme.headlineSmall!.copyWith(
              color: AppColors.lynch,
              fontWeight: myTheme.textTheme.headlineSmall!.fontWeight,
              fontSize: myTheme.textTheme.headlineSmall!.fontSize,
              fontStyle: myTheme.textTheme.headlineSmall!.fontStyle,
            ),
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.bermuda,
                ),
                minimumSize: MaterialStatePropertyAll(
                  Size(context.width / 2, 45),
                ),
              ),
              child: Text(
                'Tamam',
                style: myTheme.textTheme.headlineLarge!.copyWith(
                  color: AppColors.dark,
                  fontWeight: FontWeight.bold,
                  fontSize: myTheme.textTheme.headlineLarge!.fontSize,
                  fontStyle: myTheme.textTheme.headlineLarge!.fontStyle,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
