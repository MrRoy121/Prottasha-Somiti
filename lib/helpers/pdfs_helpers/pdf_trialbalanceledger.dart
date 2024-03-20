import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../Model/dailyTransactionModel.dart';
import '../../Model/member.dart';
import '../auth_service.dart';
import '../pdf_api.dart';

class PdfTrailbalanceLedger {
  static Future<File> generate({
    required List<DailyTransactionModel> cashinhand,
    required List<DailyTransactionModel> cashcurrentdeposit,
    required List<DailyTransactionModel> savingsdeposit,
    required List<DailyTransactionModel> loanandadvances,
    required DateTime startdate
  }) async {
    final pdf = Document();

    final Uint8List data = await yourBackgroundImageFunction();
    final fontData =
        await rootBundle.load("assets/fonts/opensans/OpenSans-Regular.ttf");
    final ttf = Font.ttf(fontData.buffer.asByteData());

    final fontData2 =
        await rootBundle.load("assets/fonts/opensans/OpenSans-Bold.ttf");
    final ttfbold = Font.ttf(fontData2.buffer.asByteData());
    double totalcashinhand =
        cashinhand.fold(0.0, (sum, transaction) => sum + transaction.amount);
    double totalcashcurrentdeposit =
        cashcurrentdeposit.fold(0.0, (sum, transaction) => sum + transaction.amount);

    pdf.addPage(MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: EdgeInsets.zero,
      build: (context) => [
        Container(
          margin: EdgeInsets.only(
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          width: PdfPageFormat.a4.width,
          child: Text("Head Code : 16 Cash In Hand",
              style: TextStyle(
                  font: ttfbold, fontSize: 10, color: PdfColors.black)),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 8,
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          child: buildInvoice(cashinhand, ttf, ttfbold),
        ),
        Container(
            margin: EdgeInsets.only(
                top: 5,
                left: PdfPageFormat.a4.marginLeft,
                right: PdfPageFormat.a4.marginRight + 2),
            child: Row(children: [
              Expanded(
                  child: Text("Total Credit : ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttf, fontSize: 9, color: PdfColors.black)),
                  flex: 6),
              Expanded(
                  child: Text(totalcashinhand.toStringAsFixed(2),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttf, fontSize: 9, color: PdfColors.black)),
                  flex: 1)
            ])),
        Container(
            margin: EdgeInsets.only(
                top: 5,
                left: PdfPageFormat.a4.marginLeft,
                right: PdfPageFormat.a4.marginRight + 2),
            child: Row(children: [
              Expanded(
                  child: Text("Total Debit : ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttf, fontSize: 9, color: PdfColors.black)),
                  flex: 6),
              Expanded(
                  child: Text("0.00",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttf, fontSize: 9, color: PdfColors.black)),
                  flex: 1)
            ])),
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
                  flex: 6),
              Expanded(
                  child: Text(totalcashinhand.toStringAsFixed(2),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 1)
            ])),
        Container(
          margin: EdgeInsets.only(
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          width: PdfPageFormat.a4.width,
          child: Text("Head Code : 53 Current Deposit",
              style: TextStyle(
                  font: ttfbold, fontSize: 10, color: PdfColors.black)),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 8,
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          child: buildInvoice(cashcurrentdeposit, ttf, ttfbold),
        ),
        Container(
            margin: EdgeInsets.only(
                top: 5,
                left: PdfPageFormat.a4.marginLeft,
                right: PdfPageFormat.a4.marginRight + 2),
            child: Row(children: [
              Expanded(
                  child: Text("Total Credit : ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttf, fontSize: 9, color: PdfColors.black)),
                  flex: 6),
              Expanded(
                  child: Text('0.00',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttf, fontSize: 9, color: PdfColors.black)),
                  flex: 1)
            ])),
        Container(
            margin: EdgeInsets.only(
                top: 5,
                left: PdfPageFormat.a4.marginLeft,
                right: PdfPageFormat.a4.marginRight + 2),
            child: Row(children: [
              Expanded(
                  child: Text("Total Debit : ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttf, fontSize: 9, color: PdfColors.black)),
                  flex: 6),
              Expanded(
                  child: Text(totalcashcurrentdeposit.toStringAsFixed(2),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttf, fontSize: 9, color: PdfColors.black)),
                  flex: 1)
            ])),
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
                  flex: 6),
              Expanded(
                  child: Text(totalcashcurrentdeposit.toStringAsFixed(2),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 1)
            ])),
        Container(
          margin: EdgeInsets.only(
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          width: PdfPageFormat.a4.width,
          child: Text("Head Code : 55 Savings Deposit",
              style: TextStyle(
                  font: ttfbold, fontSize: 10, color: PdfColors.black)),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 8,
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          child: buildInvoice(savingsdeposit, ttf, ttfbold),
        ),
        Container(
            margin: EdgeInsets.only(
                top: 5,
                left: PdfPageFormat.a4.marginLeft,
                right: PdfPageFormat.a4.marginRight + 2),
            child: Row(children: [
              Expanded(
                  child: Text("Total Credit : ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttf, fontSize: 9, color: PdfColors.black)),
                  flex: 6),
              Expanded(
                  child: Text('0.00',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttf, fontSize: 9, color: PdfColors.black)),
                  flex: 1)
            ])),
        Container(
            margin: EdgeInsets.only(
                top: 5,
                left: PdfPageFormat.a4.marginLeft,
                right: PdfPageFormat.a4.marginRight + 2),
            child: Row(children: [
              Expanded(
                  child: Text("Total Debit : ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttf, fontSize: 9, color: PdfColors.black)),
                  flex: 6),
              Expanded(
                  child: Text('0.00',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttf, fontSize: 9, color: PdfColors.black)),
                  flex: 1)
            ])),
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
                  flex: 6),
              Expanded(
                  child: Text('0.00',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 1)
            ])),

        Container(
            margin: EdgeInsets.only(
                top: 10,
                left: PdfPageFormat.a4.marginLeft,
                right: PdfPageFormat.a4.marginRight + 2),
            child: Row(children: [
              Expanded(
                  child: Text("Grand Total : ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 6),
              Expanded(
                  child: Text(((totalcashcurrentdeposit)-(totalcashinhand)).toStringAsFixed(2),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 1)
            ])),
      ],
      header: (context) => buildHeader(
        ttf,
        data,
        ttfbold,startdate,
      ),
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
    List<DailyTransactionModel> invoice,
    final ttf,
    final ttfbold,
  ) {
    final headers = [
      'Sl',
      'GL Code',
      'Description',
      'Credit Amount',
      'Debit Amount',
    ];

    final data = invoice.map((item) {
      return [
        item.acno,
        item.transacno,
        item.naration,
        item.drcr ?item.amount.toStringAsFixed(2):'0',
        item.drcr ?'0':item.amount.toStringAsFixed(2),
      ];
    }).toList();
    return TableHelper.fromTextArray(
      headers: headers,
      columnWidths: {
        0: FixedColumnWidth(50),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(3),
        3: FlexColumnWidth(1),
        4: FlexColumnWidth(1),
      },
      data: data,
      headerStyle: TextStyle(
          font: ttfbold, color: PdfColor.fromHex("#1C1F22"), fontSize: 10),
      headerDecoration: BoxDecoration(color: PdfColors.white),
      cellHeight: 20,
      border: TableBorder.all(color: PdfColor.fromHex("#1C1F22"), width: .5),
      cellStyle:
          TextStyle(font: ttf, color: PdfColor.fromHex("#1C1F22"), fontSize: 9),
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerLeft,
        2: Alignment.centerLeft,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
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
  static Widget buildHeader(final ttf, Uint8List data, final ttfbold, DateTime startdate) =>
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
                Text("Prottyasha Sanchoy & Rindan Co-Operative Samitee LTD.",
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
                Text("Trail Balance as on ${DateFormat('dd MMMM, yyyy').format(startdate)}",
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
