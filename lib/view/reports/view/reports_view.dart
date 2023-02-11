import '../../../core/utils/constants/app_color.dart';
import '../../../core/utils/responsive_builder.dart';
import '../../../core/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ReportsView extends StatelessWidget {
  ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ResponsiveBuilder(
                  builder: (windowsize) => DataTable(
                    columnSpacing:
                        windowsize.isTablet != true ? context.width / 7 : 100,
                    columns: List.generate(
                      _dataTableColumnLabelText.length,
                      (index) => DataColumn(
                        label: Text(
                          _dataTableColumnLabelText[index],
                          style: TextStyle(
                            color: AppColors.whiteGrey,
                            fontSize: myTheme.textTheme.displaySmall!.fontSize,
                          ),
                        ),
                      ),
                    ),
                    rows: const [
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              '0',
                            ),
                          ),
                          DataCell(
                            Text(
                              '0',
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                'o',
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                '0',
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                '0',
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                '0',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<String> _dataTableColumnLabelText = [
    'Araç Tipi',
    'Araç Plakası',
    'Gelen İl',
    'Ürün',
    'Ürün Tipi',
    'Miktar',
  ];
}
