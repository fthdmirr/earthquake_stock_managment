import 'package:earhquake_stock_managment/core/common/models/report/report_model.dart';
import 'package:earhquake_stock_managment/core/common/models/sheetlistmodel/sheetlistmodel.dart';
import 'package:earhquake_stock_managment/core/common/models/status/route_status.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/main.dart';
import 'package:earhquake_stock_managment/view/reports/view/inhouse_reports.dart';
import 'package:earhquake_stock_managment/view/reports/view/went_reports.dart';
import 'package:flutter/material.dart';

class ReportsViewModel extends BaseViewModel {
  int currentIndex = 0;
  ReportsViewModel(BuildContext context) : super(context: context);
  List<Report> cameReports = [];
  List<Report> wentReports = [];
  List<Report> tempReports = [];

  @override
  initViewModel() async {
    super.initViewModel();
    getReportsFromHive();
  }

  List<SheetListModel<Widget>> get reportsTabs => [
        SheetListModel<Widget>(
            key: const Key("Gelen Tır"),
            title: 'Gelen Tır',
            payload: InHouseReports(
              viewModel: this,
            )),
        SheetListModel<Widget>(
            key: const Key("Giden Tır"),
            title: 'Giden Tır',
            payload: WentReports(
              viewModel: this,
            )),
      ];

  updateSelectedTab(int index) {
    currentIndex = index;
    notifyListeners();
  }

  getReportsFromHive() {
    tempReports = reportCacheManager.getValues() ?? [];
    cameReports = tempReports
        .where((element) => element.vehicleInfo.routeStatus == RouteStatus.came)
        .toList();

    wentReports = tempReports
        .where((element) => element.vehicleInfo.routeStatus == RouteStatus.sending)
        .toList();

    notifyListeners();
  }

  searchCameReports(String value) {
    if (value.isEmpty) {
      cameReports = tempReports
          .where((element) => element.vehicleInfo.routeStatus == RouteStatus.came)
          .toList();
      notifyListeners();
      return;
    }
    if (value.length < 3) {
      return;
    }
    cameReports = tempReports
        .where(
          (element) =>
              element.vehicleInfo.routeStatus == RouteStatus.came &&
              element.vehicleInfo.vehicle.driverName.toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
    notifyListeners();
  }
}
