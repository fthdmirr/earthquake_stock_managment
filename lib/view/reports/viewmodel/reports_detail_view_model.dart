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

  String get currentTime {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd.MM.yyyy');
    final DateTime displayDate =
        displayFormater.parse(DateTime.now().toString());
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  get _style => pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold);

  final doc = pw.Document();

  _image(String image) async =>
      await imageFromAssetBundle('assets/images/$image');

  void printReport() {
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(24),
            child: pw.Column(
              children: [
                pw.SizedBox(height: 16),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Image(_image('afad_logo.png'), height: 42),
                    pw.Image(_image('afad_logo.png'), height: 42),
                  ],
                ),
                pw.SizedBox(height: 12),
                pw.Expanded(
                  child: pw.Container(
                    decoration: pw.BoxDecoration(
                        border: pw.Border.all(
                      width: 5,
                      color: PdfColor.fromHex('#000000'),
                    )),
                    child: pw.Column(
                      children: [
                        _dataRow(dataKey: 'Tarih', dataValue: currentTime),
                        _dataRow(
                            dataKey: 'Gittiği Yer', dataValue: 'KAHRAMANMARAS'),
                        _dataRow(
                            dataKey: 'Gittiği Yer Kişi',
                            dataValue: 'CEMIL BOZ'),
                        _dataRow(dataKey: 'GÖREV DURUMU', dataValue: 'GÖNÜLLÜ'),
                        _dataRow(dataKey: 'PLAKA', dataValue: '38 AGE 127'),
                        _dataRow(
                            dataKey: 'ŞOFÖR ADI',
                            dataValue: 'YAHYA KEMAL ULUTOPÇU'),
                        _dataRow(
                            dataKey: 'ŞOFÖR İLETİŞİM',
                            dataValue: '507 899 48 00'),
                        _dataRow(dataKey: 'MALZEME CİNSİ', dataValue: 'TON'),
                        _dataRow(dataKey: 'ODUN', dataValue: '5'),
                      ],
                    ),
                  ),
                ),
                pw.Text(
                  'MALZEME ÇIKIŞ FORMU',
                  style: _style,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Teslim Eden', style: _style),
                    pw.Text('Teslim Alan', style: _style)
                  ],
                ),
                pw.SizedBox(height: 42),
                pw.Text(
                  'Yukarıda detay bilgileri yer alan araç belirtilen ile yardım amacıyla gitmesine izin verilmiştir',
                  style: _style,
                  textAlign: pw.TextAlign.center,
                )
              ],
            ),
          ); // Center
        },
      ),
    );
    notifyListeners();
  }

  _dataRow({required String dataKey, required String dataValue}) => pw.Column(
        children: [
          pw.Column(children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(dataKey,
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.Text('-',
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.Text(dataValue,
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold)),
              ],
            ),
            pw.Divider(thickness: 4, color: PdfColor.fromHex('#000000')),
          ])
        ],
      );
}
