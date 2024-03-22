import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../Model/dailyTransactionModel.dart';
import '../../Model/member.dart';
import '../auth_service.dart';
import '../pdf_api.dart';

class PdfDailyAffairStatementLedger {
  static Future<File> generate({
    required List<DailyTransactionModel> cashdeposit,
    required List<DailyTransactionModel> cashwithdraw,
    required List<DailyTransactionModel> expense,
    required DateTime date,
    required ledgertitle,
  }) async {
    final pdf = Document();

    final Uint8List data = await yourBackgroundImageFunction();
    final fontData =
        await rootBundle.load("assets/fonts/opensans/OpenSans-Regular.ttf");
    final ttf = Font.ttf(fontData.buffer.asByteData());

    final fontData2 =
        await rootBundle.load("assets/fonts/opensans/OpenSans-Bold.ttf");
    final ttfbold = Font.ttf(fontData2.buffer.asByteData());
    double totalcashdeposit =
        cashdeposit.fold(0.0, (sum, transaction) => sum + transaction.amount);
    double totalcashwithdraw =
        cashwithdraw.fold(0.0, (sum, transaction) => sum + transaction.amount);

    double totaldisbursement =
        expense.fold(0.0, (sum, transaction) => sum + transaction.amount);

    pdf.addPage(MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: EdgeInsets.zero,
      build: (context) => [
        Container(
          margin: EdgeInsets.only(
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  width: PdfPageFormat.a4.width,
                  child: Text("Head Name : 10200000 Deposit",
                      style: TextStyle(
                          font: ttfbold, fontSize: 8, color: PdfColors.black)),
                ),
                Container(
                  child: buildInvoice(cashdeposit, ttf, ttfbold, false),
                ),
                Container(
                    child: Row(children: [
                  Expanded(
                      child: Text("Sub Total : ",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              font: ttfbold,
                              fontSize: 6,
                              color: PdfColors.black)),
                      flex: 6),
                  Expanded(
                      child: Text(totalcashdeposit.toStringAsFixed(2),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              font: ttfbold,
                              fontSize: 6,
                              color: PdfColors.black)),
                      flex: 1)
                ])),
              ]),
            ),
            SizedBox(width: 5),
            Expanded(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: PdfPageFormat.a4.width,
                child: Text("30100000 Cash & Cash Equivalent",
                    style: TextStyle(
                        font: ttfbold, fontSize: 8, color: PdfColors.black)),
              ),
              Container(
                child: buildInvoice(
                    cashwithdraw.sublist(0, 1), ttf, ttfbold, true),
              ),
              Container(
                  child: Row(children: [
                Expanded(
                    child: Text("Sub Total : ",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            font: ttfbold,
                            fontSize: 6,
                            color: PdfColors.black)),
                    flex: 6),
                Expanded(
                    child: Text(cashwithdraw[0].amount.toStringAsFixed(2),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            font: ttfbold,
                            fontSize: 6,
                            color: PdfColors.black)),
                    flex: 1)
              ])),
                  Container(
                    width: PdfPageFormat.a4.width,
                    child: Text("30250000 Cash at Bank",
                        style: TextStyle(
                            font: ttfbold, fontSize: 8, color: PdfColors.black)),
                  ),
                  Container(
                    child: buildInvoice(
                        cashwithdraw.sublist(1), ttf, ttfbold, true),
                  ),
                  Container(
                      child: Row(children: [
                        Expanded(
                            child: Text("Sub Total : ",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    font: ttfbold,
                                    fontSize: 6,
                                    color: PdfColors.black)),
                            flex: 6),
                        Expanded(
                            child: Text(cashwithdraw[0].amount.toStringAsFixed(2),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    font: ttfbold,
                                    fontSize: 6,
                                    color: PdfColors.black)),
                            flex: 1)
                      ])),
            ])),
          ]),
        ),
        Container(
          margin: EdgeInsets.only(
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: SizedBox(),
            ),
            SizedBox(width: 5),
            Expanded(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: PdfPageFormat.a4.width,
                child: Text("Head Name : 90100000 Expense",
                    style: TextStyle(
                        font: ttfbold, fontSize: 8, color: PdfColors.black)),
              ),
              Container(
                child: buildInvoice(expense, ttf, ttfbold, true),
              ),
              Container(
                  child: Row(children: [
                Expanded(
                    child: Text("Sub Total : ",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            font: ttfbold,
                            fontSize: 6,
                            color: PdfColors.black)),
                    flex: 6),
                Expanded(
                    child: Text(totaldisbursement.toStringAsFixed(2),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            font: ttfbold,
                            fontSize: 6,
                            color: PdfColors.black)),
                    flex: 1)
              ])),
            ])),
          ]),
        ),
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
                          font: ttfbold, fontSize: 6, color: PdfColors.black)),
                  flex: 6),
              Expanded(
                  child: Text(
                      ((totalcashwithdraw + totaldisbursement) -
                              (totalcashdeposit))
                          .toStringAsFixed(2),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 6, color: PdfColors.black)),
                  flex: 1)
            ])),
      ],
      header: (context) => buildHeader(
        ttf,
        data,
        ttfbold,
        date,
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
      List<DailyTransactionModel> invoice, final ttf, final ttfbold, bool dr) {
    final headers = [
      'GL Head',
      dr ? 'Assets (Dr)' : 'Liabilities (Cr)',
      'Amount',
    ];

    final data = invoice.map((item) {
      return [
        item.transacno,
        item.naration,
        item.amount.toStringAsFixed(2),
      ];
    }).toList();

    return TableHelper.fromTextArray(
      headers: headers,
      data: data,
      headerStyle: TextStyle(
          font: ttfbold, color: PdfColor.fromHex("#1C1F22"), fontSize: 6),
      headerDecoration: BoxDecoration(color: PdfColors.white),
      cellHeight: 15,
      border: TableBorder.all(color: PdfColor.fromHex("#1C1F22"), width: .5),
      cellStyle:
          TextStyle(font: ttf, color: PdfColor.fromHex("#1C1F22"), fontSize: 6),
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerLeft,
        2: Alignment.centerRight,
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
          final ttf, Uint8List data, final ttfbold, DateTime startdate) =>
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
                        fontSize: 8,
                        color: PdfColor.fromHex("#1E2772"))),
                SizedBox(height: 5),
                Text(
                    "Statement Of Affairs As On ${DateFormat('dd MMMM, yyyy').format(startdate)}",
                    style: TextStyle(
                        font: ttfbold,
                        fontSize: 8,
                        color: PdfColor.fromHex("#1C1F22"))),
                // Text(
                //     "Statement For Period:  ${DateFormat('dd MMMM, yyyy').format(startdate)} to  ${DateFormat('dd MMMM, yyyy').format(enddate)}",
                //     style: TextStyle(
                //         font: ttf,
                //         fontSize: 8,
                //         color: PdfColor.fromHex("#1E2772"))),
                SizedBox(height: 30),
              ]));
}
