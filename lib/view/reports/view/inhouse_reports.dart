import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/common/models/report/report_model.dart';
import 'package:earhquake_stock_managment/core/common/models/status/route_status.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle/vehicle_model.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle_info/vehicle_info_model.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:earhquake_stock_managment/view/reports/view/reports_detail.view.dart';
import 'package:earhquake_stock_managment/view/reports/viewmodel/reports.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class InHouseReports extends StatelessWidget {
  final ReportsViewModel viewModel;
  const InHouseReports({super.key, required this.viewModel});

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
                  onChanged: (value) {
                    viewModel.searchCameReports(value);
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: viewModel.cameReports.isNotNullOrEmpty
                ? viewModel.cameReports.length
                : 0,
            itemBuilder: (context, index) => ReportsCardWidget(
              report: viewModel.cameReports.isNotNullOrEmpty
                  ? viewModel.cameReports[index]
                  : Report(
                      dateTime: DateTime.now().toIso8601String(),
                      vehicleInfo: VehicleInfo(
                          vehicle: Vehicle(
                              driverName: 'Ali',
                              plate: '34',
                              vehicleType: 'Kamyon',
                              driverPhone: '12312'),
                          destinationCity: '',
                          inventoryItems: [],
                          routeStatus: RouteStatus.came)),
            ),
          ),
        ),
      ],
    );
  }
}

class ReportsCardWidget extends StatelessWidget {
  final Report report;
  const ReportsCardWidget({
    super.key,
    required this.report,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReportsDetailView(
              report: report,
            ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          report.vehicleInfo.vehicle.driverName,
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
                            Text(convertDateTimeToString(report.dateTime),
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
                      report.vehicleInfo.vehicle.plate,
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
                        Text(report.vehicleInfo.destinationCity,
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
              spacing: 8,
              children: report.vehicleInfo.inventoryItems
                  .map(
                    (e) => Chip(
                      label: Text(
                        '${e.name}  ${e.quantity}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.darkerGreen,
                            fontWeight: FontWeight.w500),
                      ),
                      backgroundColor: AppColors.ligherGreen,
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

String convertDateTimeToString(String dateTime2) {
  DateTime dateTime = DateTime.parse(dateTime2);

  return '${dateTime.day}.${dateTime.month}.${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
}
