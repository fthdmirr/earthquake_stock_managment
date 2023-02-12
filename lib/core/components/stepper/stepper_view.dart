// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:earhquake_stock_managment/core/components/text/headline/headline5_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:earhquake_stock_managment/core/components/stepper/stepper_model.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';

class StepperView extends StatefulWidget {
  const StepperView({
    Key? key,
    required this.steppers,
    required this.onPressed,
    required this.widgets,
    required this.singleButtontitle,
    this.validated = true,
  }) : super(key: key);

  final List<StepperModel> steppers;
  final Function(int) onPressed;
  final List<Widget> widgets;
  final String singleButtontitle;
  final bool? validated;
  @override
  State<StepperView> createState() => _StepperViewViewState();
}

class _StepperViewViewState extends State<StepperView> {
  int currentIndex = 0;

  void changeCurrentIndex(int value) {
    currentIndex = value;
    setState(() {});
  }
  void buttonPressed() {
    widget.onPressed(currentIndex);
      if(widget.validated==false) return;
    if (currentIndex != widget.widgets.length - 1) {
      changeCurrentIndex(currentIndex + 1);
    }
  }

  void backButton() {
    changeCurrentIndex(currentIndex - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...widget.steppers
                    .map(
                      (step) => Row(
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
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          Expanded(flex: 8, child: widget.widgets[currentIndex]),
        ],
      ),
      bottomNavigationBar: currentIndex == 0
          ? _SingleButton(
              title: widget.singleButtontitle,
              onPressed: buttonPressed,
            )
          : Row(
              children: [
                Expanded(
                  child: _SingleButton(
                    title: 'Geri Dön',
                    color: AppColors.greyapp,
                    onPressed: backButton,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _SingleButton(
                    title: 'Devam Et',
                    onPressed: buttonPressed,
                  ),
                )
              ],
            ),
    );
  }
}

class _SingleButton extends StatelessWidget {
  const _SingleButton({required this.title, required this.onPressed, this.color});
  final String title;
  final Function() onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: color != null ? MaterialStateProperty.all<Color>(color!) : null,
          minimumSize: MaterialStateProperty.all<Size>(
            Size(
              double.infinity,
              context.dynamicHeight(0.06),
            ),
          ),
        ),
        child: Headline5Text(
          text: title,
          color: AppColors.dark,
        ),
      ),
    );
  }
}
