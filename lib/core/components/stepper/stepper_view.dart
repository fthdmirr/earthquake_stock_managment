import 'package:earhquake_stock_managment/core/components/stepper/stepper_model.dart';
import 'package:earhquake_stock_managment/core/components/text/button/button_large_text.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class StepperView extends StatefulWidget {
  const StepperView({
    super.key,
    required this.steppers,
    required this.onPressed,
    required this.widget,
  });

  final List<StepperModel> steppers;
  final Function onPressed;
  final Widget widget;

  @override
  State<StepperView> createState() => _StepperViewViewState();
}

class _StepperViewViewState extends State<StepperView> {
  int currentIndex = 0;

  void changeCurrentIndex(int value) {
    currentIndex = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: context.dynamicHeight(0.02)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...widget.steppers
                  .map((step) => Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: step.index <= currentIndex
                                    ? AppColors.green
                                    : AppColors.greyapp,
                                maxRadius: 17.5,
                              ),
                              Text(step.title),
                            ],
                          ),
                        ],
                      ))
                  .toList(),
            ],
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 5,
            child: widget.widget,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              changeCurrentIndex(currentIndex + 1);
              widget.onPressed();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                context.width / 1.5,
                context.dynamicHeight(0.06),
              ),
            ),
            child: ButtonLargeText(
              text: 'Yüklenen Ürünleri Tamamla',
              color: AppColors.dark,
            ),
          ),
        ),
      ),
    );
  }
}
