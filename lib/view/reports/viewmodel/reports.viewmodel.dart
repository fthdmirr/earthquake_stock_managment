import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/common/models/sheetlistmodel/sheetlistmodel.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:earhquake_stock_managment/view/reports/view/reports_detail.view.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ReportsViewModel extends BaseViewModel {
  int currentIndex = 0;
  ReportsViewModel(BuildContext context) : super(context: context);

  List<SheetListModel<Widget>> get reportsTabs => [
        SheetListModel<Widget>(
            key: const Key("Gelen Tır"),
            title: 'Gelen Tır',
            payload: const InHouseReports()),
        SheetListModel<Widget>(
            key: const Key("Giden Tır"),
            title: 'Giden Tır',
            payload: const InHouseReports()),
      ];

  updateSelectedTab(int index) {
    currentIndex = index;
    notifyListeners();
  }
}

class InHouseReports extends StatelessWidget {
  const InHouseReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.dynamicWidth(1),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Image(
                image: AppImages.memoryImage('search_icon'),
                width: 24,
                height: 24,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Ara',
                    hintStyle: TextStyle(
                      color: AppColors.lynch,
                      fontSize: 16,
                    ),
                  ),
                  style: const TextStyle(
                    color: AppColors.lynch,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => const ReportsCardWidget(),
          ),
        ),
      ],
    );
  }
}

class ReportsCardWidget extends StatelessWidget {
  const ReportsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ReportsDetailView(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.whiteGrey.withOpacity(0.5),
                      maxRadius: 25,
                      child: Text(
                        'AB',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: AppColors.lynch),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Betül Üsküdar',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: AppColors.black),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AppImages.memoryImage(
                                'clock_icon',
                              ),
                              width: 24,
                              height: 24,
                              color: AppColors.textColor,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text('11.02.23 20.02',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: AppColors.textColor)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '34 TV 4843',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: AppColors.textColor),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Image(
                          image: AppImages.memoryImage(
                            'map_pin',
                          ),
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text('Hatay',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: AppColors.red)),
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              children: [
                Chip(
                  label: Text('Kargo  50',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.darkerGreen,
                          fontWeight: FontWeight.w500)),
                  backgroundColor: AppColors.ligherGreen,
                ),
                Chip(
                  label: Text('Kargo  50',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.darkerGreen,
                          fontWeight: FontWeight.w500)),
                  backgroundColor: AppColors.ligherGreen,
                ),
                Chip(
                  label: Text('Kargo  50',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.darkerGreen,
                          fontWeight: FontWeight.w500)),
                  backgroundColor: AppColors.ligherGreen,
                ),
                Chip(
                  label: Text('Kargo  50',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.darkerGreen,
                          fontWeight: FontWeight.w500)),
                  backgroundColor: AppColors.ligherGreen,
                ),
                Chip(
                  label: Text('Kargo  50',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.darkerGreen,
                          fontWeight: FontWeight.w500)),
                  backgroundColor: AppColors.ligherGreen,
                ),
                Chip(
                  label: Text('Kargo  50',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.darkerGreen,
                          fontWeight: FontWeight.w500)),
                  backgroundColor: AppColors.ligherGreen,
                ),
                Chip(
                  label: Text('Kargo  50',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.darkerGreen,
                          fontWeight: FontWeight.w500)),
                  backgroundColor: AppColors.ligherGreen,
                ),
                Chip(
                  label: Text('Kargo  50',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.darkerGreen,
                          fontWeight: FontWeight.w500)),
                  backgroundColor: AppColors.ligherGreen,
                ),
                Chip(
                  label: Text('Kargo  50',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.darkerGreen,
                          fontWeight: FontWeight.w500)),
                  backgroundColor: AppColors.ligherGreen,
                ),
                Chip(
                  label: Text('Kargo  50',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.darkerGreen,
                          fontWeight: FontWeight.w500)),
                  backgroundColor: AppColors.ligherGreen,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
