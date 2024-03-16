import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../Model/ProfitLossModel.dart';
import '../../Model/dailyTransactionModel.dart';
import '../../Model/member.dart';
import '../auth_service.dart';
import '../pdf_api.dart';

class PdfProfitLossStatement {
  static Future<File> generate({
    required List<ProfitLossModel> getincome,
    required List<ProfitLossModel> getexpense,
    required DateTime date,
  }) async {
    final pdf = Document();

    final Uint8List data = await yourBackgroundImageFunction();
    final fontData =
        await rootBundle.load("assets/fonts/opensans/OpenSans-Regular.ttf");
    final ttf = Font.ttf(fontData.buffer.asByteData());

    final fontData2 =
        await rootBundle.load("assets/fonts/opensans/OpenSans-Bold.ttf");
    final ttfbold = Font.ttf(fontData2.buffer.asByteData());
    double totalgetincomecur =
        getincome.fold(0.0, (sum, transaction) => sum + transaction.current);
    double totalgetincometil = getincome.fold(
        0.0, (sum, transaction) => sum + transaction.tillprevious);
    double totalgetincometo =
        getincome.fold(0.0, (sum, transaction) => sum + transaction.total);

    double totalgetexcur =
        getexpense.fold(0.0, (sum, transaction) => sum + transaction.current);
    double totalgetextil = getexpense.fold(
        0.0, (sum, transaction) => sum + transaction.tillprevious);
    double totalgetexto =
        getexpense.fold(0.0, (sum, transaction) => sum + transaction.total);

    pdf.addPage(MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: EdgeInsets.zero,
      build: (context) => [
        Container(
          margin: EdgeInsets.only(
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          width: PdfPageFormat.a4.width,
          child: Text("Transaction Type : Income",
              style: TextStyle(
                  font: ttfbold, fontSize: 10, color: PdfColors.black)),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 8,
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          child: buildInvoice(getincome, ttf, ttfbold),
        ),
        Container(
            margin: EdgeInsets.only(
                top: 5,
                left: PdfPageFormat.a4.marginLeft,
                right: PdfPageFormat.a4.marginRight + 2),
            child: Row(children: [
              Expanded(
                  child: Text("Sub Total : ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 7),
              Expanded(
                  child: Text(totalgetincometil.toStringAsFixed(1),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 2),
              Expanded(
                  child: Text(totalgetincomecur.toStringAsFixed(1),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 2),
              Expanded(
                  child: Text(totalgetincometo.toStringAsFixed(1),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 3)
            ])),
        Container(
          margin: EdgeInsets.only(
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          width: PdfPageFormat.a4.width,
          child: Text("Transaction Type : Expense",
              style: TextStyle(
                  font: ttfbold, fontSize: 10, color: PdfColors.black)),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 8,
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          child: buildInvoice(getexpense, ttf, ttfbold),
        ),
        Container(
            margin: EdgeInsets.only(
                top: 5,
                left: PdfPageFormat.a4.marginLeft,
                right: PdfPageFormat.a4.marginRight + 2),
            child: Row(children: [
              Expanded(
                  child: Text("Sub Total : ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 7),
              Expanded(
                  child: Text(totalgetextil.toStringAsFixed(1),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 2),
              Expanded(
                  child: Text(totalgetexcur.toStringAsFixed(1),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 2),
              Expanded(
                  child: Text(totalgetexto.toStringAsFixed(1),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 3)
            ])),
        Container(
          margin: EdgeInsets.only(
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          width: PdfPageFormat.a4.width,
          child: Text("Profit/Loss",
              style: TextStyle(
                  font: ttfbold, fontSize: 10, color: PdfColors.black)),
        ),
    Container(
    margin: EdgeInsets.only(
    top: 5,
    left: PdfPageFormat.a4.marginLeft,
    right: PdfPageFormat.a4.marginRight + 2),
    child:Divider()),
        Container(
            margin: EdgeInsets.only(
                top: 5,
                left: PdfPageFormat.a4.marginLeft,
                right: PdfPageFormat.a4.marginRight + 2),
            child: Row(children: [
              Expanded(
                  child: Text("Grand Total : ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 7),
              Expanded(
                  child: Text(
                      (totalgetincometil - totalgetextil).toStringAsFixed(1),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 2),
              Expanded(
                  child: Text(
                      (totalgetincomecur - totalgetexcur).toStringAsFixed(1),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 2),
              Expanded(
                  child: Text(
                      (totalgetincometo - totalgetexto).toStringAsFixed(1),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 3)
            ])),
        Container(
          margin: EdgeInsets.only(
              top: 75,
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight + 2),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Container(color: PdfColors.blue100, height: 1),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Container(color: PdfColors.blue100, height: 1),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Container(color: PdfColors.blue100, height: 1),
            ),
          ]),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 15,
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight + 2),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Text(
                  "Checked By\nName & Designation",
                  style: TextStyle(
                      font: ttf, fontSize: 9, color: PdfColors.black)),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Text(
                  "Authorized Signature & Date",
                  style: TextStyle(
                      font: ttf, fontSize: 9, color: PdfColors.black)),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child:  Text(
                  "Authorized Signature & Date",
                  style: TextStyle(
                      font: ttf, fontSize: 9, color: PdfColors.black)),
            ),
          ]),
        ),
      ],
      header: (context) => buildHeader(ttf, data, ttfbold, date),
      footer: (context) => buildFooter(ttf, ttfbold),
    ));
    return PdfApi.saveDocument(
        "Memberss_List${DateFormat('dd-MMM-yyyy-jms').format(DateTime.now())}.pdf",
        pdf);
  }

  static Future<Uint8List> yourBackgroundImageFunction() async {
    ByteData byteData = await rootBundle.load("assets/logo.jpg");
    return byteData.buffer.asUint8List();
  }

  static Widget buildInvoice(
    List<ProfitLossModel> invoice,
    final ttf,
    final ttfbold,
  ) {
    final headers = [
      'Sl',
      'GL Code',
      'Description',
      'Till Previous Month',
      'Current',
      'Cumulative Total',
    ];

    final data = invoice.map((item) {
      return [
        item.sl,
        item.glcode,
        item.desc,
        item.tillprevious.toStringAsFixed(2),
        item.current.toStringAsFixed(2),
        item.total.toStringAsFixed(2),
      ];
    }).toList();

    return TableHelper.fromTextArray(
      headers: headers,
      data: data,
      headerStyle: TextStyle(
          font: ttfbold, color: PdfColor.fromHex("#1C1F22"), fontSize: 10),
      headerDecoration: BoxDecoration(color: PdfColors.white),
      cellHeight: 20,
      columnWidths: {
        2: FlexColumnWidth(),
      },
      border: TableBorder.all(color: PdfColor.fromHex("#1C1F22"), width: .5),
      cellStyle:
          TextStyle(font: ttf, color: PdfColor.fromHex("#1C1F22"), fontSize: 9),
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerLeft,
        2: Alignment.centerLeft,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
        6: Alignment.centerRight,
      },
    );
  }

  static Widget buildFooter(final ttf, final ttfbold) => Container(
      margin: EdgeInsets.only(bottom: PdfPageFormat.a4.marginBottom - 40),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 20),
        Divider(color: PdfColor.fromHex("#808080")),
        Text("Developed By MeetTechLab",
            style: TextStyle(
                font: ttfbold,
                fontSize: 12,
                color: PdfColor.fromHex("#1E2772"))),
      ]));
  static Widget buildHeader(
          final ttf, Uint8List data, final ttfbold, DateTime date) =>
      Container(
          alignment: Alignment.center,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Row(children: [
                  Expanded(child: SizedBox()),
                  Expanded(child: SizedBox()),
                  Container(
                      child: Image(MemoryImage(data),
                          width: 60, height: 60, fit: BoxFit.fill),
                      color: PdfColors.black),
                  Expanded(child: SizedBox()),
                  Expanded(
                      child: Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                        Text(
                            'Date: ${DateFormat('dd MMMM, yyyy').format(DateTime.now())}',
                            style: TextStyle(
                                font: ttf,
                                fontSize: 8,
                                color: PdfColor.fromHex("#1E2772"))),
                        Text(
                            'User: ${AuthService.to.user!.type} - ${AuthService.to.user!.id}',
                            style: TextStyle(
                                font: ttf,
                                fontSize: 8,
                                color: PdfColor.fromHex("#1E2772"))),
                      ]))),
                ]),
                Text("Prottsha Samitee LTD.",
                    style: TextStyle(
                        font: ttfbold,
                        fontSize: 14,
                        color: PdfColor.fromHex("#1E2772"))),
                Text("Sunamgonj Sadar",
                    style: TextStyle(
                        font: ttfbold,
                        fontSize: 10,
                        color: PdfColor.fromHex("#1E2772"))),
                SizedBox(height: 5),
                Text(
                    "Profit & Loss Statement as on ${DateFormat.yMMMMd().format(date)}",
                    style: TextStyle(
                        font: ttfbold,
                        fontSize: 10,
                        color: PdfColor.fromHex("#1C1F22"))),
                // Text(
                //     "Statement For Period:  ${DateFormat('dd MMMM, yyyy').format(startdate)} to  ${DateFormat('dd MMMM, yyyy').format(enddate)}",
                //     style: TextStyle(
                //         font: ttf,
                //         fontSize: 10,
                //         color: PdfColor.fromHex("#1E2772"))),
                SizedBox(height: 30),
              ]));
}
