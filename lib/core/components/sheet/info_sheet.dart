import 'package:flutter/material.dart';

class AppInfoSheet {
  showAlertDialog(BuildContext context, Function()? onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            const Center(
                child: Icon(
              Icons.abc,
              size: 74,
            )),
            const SizedBox(height: 15),
            const Center(
              child: Expanded(
                child: Text(
                  'Tır gönderimi tamamlandı. Raporlar ekranından görüntileyebilirsiniz',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                onPressed: onPressed,
                child: const Text("Tamam"),
              ),
            ),
          ],
        );
      },
    );
  }
}
