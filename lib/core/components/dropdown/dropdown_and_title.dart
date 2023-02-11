import 'package:earhquake_stock_managment/core/components/dropdown/dropdown_input.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';
import '../text/headline/headline5_text.dart';

class DropdownAndTitleWidget extends StatelessWidget {
  const DropdownAndTitleWidget({
    super.key,
    required this.title,
    required this.dropdownList,
    this.dropDownFirstValue,
  });

  final String title;
  final List<String> dropdownList;
  final String? dropDownFirstValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Headline5Text(
                text: '$title:   ',
                color: AppColors.black,
              ),
            ),
            Expanded(
              flex: 3,
              child: DropdownInput<String>(
                dropdownValues: dropdownList,
                firstValue: dropDownFirstValue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
