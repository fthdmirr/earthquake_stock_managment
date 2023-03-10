import 'package:earhquake_stock_managment/core/common/models/report/report_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:pdf/pdf.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ReportsDetailViewModel extends BaseViewModel {
  ReportsDetailViewModel(BuildContext context) : super(context: context);

  String currentTime(String time) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd.MM.yyyy');
    final DateTime displayDate = displayFormater.parse(time);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  get _style => pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold);

  final doc = pw.Document();

  Future<void> printReport(Report report) async {
    final afadLogo = await imageFromAssetBundle('assets/images/afad_logo.png');
    List<pw.Column> items1 = [];
    List<pw.Column> items2 = [];

    for (var i = 0; i < report.vehicleInfo.inventoryItems.length; i++) {
      if (i < 6) {
        items1.addAll([
          _dataRow(
              dataKey: report.vehicleInfo.inventoryItems[i].name,
              dataValue: report.vehicleInfo.inventoryItems[i].quantity.toString()),
        ]);
      } else {
        items2.addAll([
          _dataRow(
              dataKey: report.vehicleInfo.inventoryItems[i].name,
              dataValue: report.vehicleInfo.inventoryItems[i].quantity.toString()),
        ]);
      }
    }

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(24),
            child: pw.Column(
              children: [
                pw.SizedBox(height: 8),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Image(afadLogo, height: 40),
                  ],
                ),
                pw.SizedBox(height: 8),
                pw.Expanded(
                  child: pw.Container(
                    decoration: pw.BoxDecoration(
                        border: pw.Border.all(
                      width: 4,
                      color: PdfColor.fromHex('#000000'),
                    )),
                    child: pw.Column(
                      children: [
                        _dataRow(dataKey: 'Tarih', dataValue: currentTime(report.dateTime)),
                        _dataRow(
                            dataKey: 'Gittigi Yer', dataValue: report.vehicleInfo.destinationCity),
                        _dataRow(dataKey: 'PLAKA', dataValue: report.vehicleInfo.vehicle.plate),
                        _dataRow(
                            dataKey: 'SOFOR ADI', dataValue: report.vehicleInfo.vehicle.driverName),
                        _dataRow(
                            dataKey: 'SOFOR ILETISIM',
                            dataValue: report.vehicleInfo.vehicle.driverPhone),
                        ...items1
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(height: 8),
                pw.Text(
                  'MALZEME CIKIS FORMU',
                  style: _style,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Teslim Eden', style: _style),
                    pw.Text('Teslim Alan', style: _style)
                  ],
                ),
                pw.SizedBox(height: 38),
                pw.Text(
                  'Yukarida detay bilgileri yer alan ara?? belirtilen ile yardim amaciyla gitmesine izin verilmistir',
                  style: _style,
                  textAlign: pw.TextAlign.center,
                ),
              ],
            ),
          ); // Center
        },
      ),
    );
    if (items2.isNotEmpty) {
      doc.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Padding(
              padding: const pw.EdgeInsets.all(24),
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 8),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [pw.Image(afadLogo, height: 40)],
                  ),
                  pw.SizedBox(height: 8),
                  pw.Expanded(
                    child: pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(
                        width: 4,
                        color: PdfColor.fromHex('#000000'),
                      )),
                      child: pw.Column(
                        children: items2,
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    'MALZEME CIKIS FORMU',
                    style: _style,
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('Teslim Eden', style: _style),
                      pw.Text('Teslim Alan', style: _style)
                    ],
                  ),
                  pw.SizedBox(height: 38),
                  pw.Text(
                    'Yukarida detay bilgileri yer alan ara?? belirtilen ile yardim amaciyla gitmesine izin verilmistir',
                    style: _style,
                    textAlign: pw.TextAlign.center,
                  ),
                ],
              ),
            ); // Center
          },
        ),
      );
    }
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
  }

  pw.Column _dataRow({required String dataKey, required String dataValue}) => pw.Column(
        children: [
          pw.Column(children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(3),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(dataKey,
                      style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  pw.Text('-', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  pw.Text(dataValue,
                      style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                ],
              ),
            ),
            pw.Divider(thickness: 4, color: PdfColor.fromHex('#000000')),
          ])
        ],
      );
}
