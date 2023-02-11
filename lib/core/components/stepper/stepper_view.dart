import 'package:earhquake_stock_managment/core/components/stepper/stepper_model.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class StepperView extends StatefulWidget {
  const StepperView({
    super.key,
    required this.steppers,
    required this.onPressed,
    required this.widgets,
  });

  final List<StepperModel> steppers;
  final Function onPressed;
  final List<Widget> widgets;

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
          Expanded(flex: 8, child: widget.widgets[currentIndex]),
        ],
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          if (currentIndex != widget.widgets.length - 1) changeCurrentIndex(currentIndex + 1);
          widget.onPressed();
        },
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
                Size(double.infinity, context.dynamicHeight(0.06)))),
        child: const Text('Devam Et'),
      ),
    );
  }
}
