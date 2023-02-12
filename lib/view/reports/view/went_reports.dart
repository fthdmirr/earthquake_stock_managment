import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/common/models/report/report_model.dart';
import 'package:earhquake_stock_managment/core/common/models/status/route_status.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle/vehicle_model.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle_info/vehicle_info_model.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:earhquake_stock_managment/view/reports/view/inhouse_reports.dart';
import 'package:earhquake_stock_managment/view/reports/viewmodel/reports.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class WentReports extends StatelessWidget {
  final ReportsViewModel viewModel;
  const WentReports({super.key, required this.viewModel});

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
            itemCount: viewModel.wentReports.isNotNullOrEmpty ? viewModel.wentReports.length : 0,
            itemBuilder: (context, index) => ReportsCardWidget(
              report: viewModel.wentReports.isNotNullOrEmpty
                  ? viewModel.wentReports[index]
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
