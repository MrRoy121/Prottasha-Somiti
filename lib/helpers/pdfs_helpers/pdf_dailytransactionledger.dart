import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../Model/dailyTransactionModel.dart';
import '../../Model/member.dart';
import '../auth_service.dart';
import '../pdf_api.dart';

class PdfDailyTransactionLedger {
  static Future<File> generate({
    required List<DailyTransactionModel> cashdeposit,
    required List<DailyTransactionModel> cashwithdraw,
    required List<DailyTransactionModel> loandisburse,
    required List<DailyTransactionModel> loanrepayment,
    required String ledgeno,
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
    loanrepayment.fold(0.0, (sum, transaction) => sum + transaction.amount);

    double totalrepayment =
    cashwithdraw.fold(0.0, (sum, transaction) => sum + transaction.amount);

    pdf.addPage(MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: EdgeInsets.zero,
      build: (context) => [
        Container(
          margin: EdgeInsets.only(
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          width: PdfPageFormat.a4.width,
          child: Text("Transaction Type : Cash Deposit",
              style: TextStyle(
                  font: ttfbold, fontSize: 10, color: PdfColors.black)),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 8,
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          child: buildInvoice(cashdeposit, ttf, ttfbold),
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
                  child: Text(totalcashdeposit.toStringAsFixed(2),
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
                  child: Text(totalcashdeposit.toStringAsFixed(2),
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
          child: Text("Transaction Type : Cash Withdraw",
              style: TextStyle(
                  font: ttfbold, fontSize: 10, color: PdfColors.black)),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 8,
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          child: buildInvoice(cashwithdraw, ttf, ttfbold),
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
                  child: Text(totalcashwithdraw.toStringAsFixed(2),
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
                  child: Text(totalcashwithdraw.toStringAsFixed(2),
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
          child: Text("Transaction Type : Loan Disbursement",
              style: TextStyle(
                  font: ttfbold, fontSize: 10, color: PdfColors.black)),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 8,
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          child: buildInvoice(loandisburse, ttf, ttfbold),
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
                  child: Text(totaldisbursement.toStringAsFixed(2),
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
                  child: Text(totaldisbursement.toStringAsFixed(2),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 1)
            ])),Container(
          margin: EdgeInsets.only(
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          width: PdfPageFormat.a4.width,
          child: Text("Transaction Type : Loan Repayment",
              style: TextStyle(
                  font: ttfbold, fontSize: 10, color: PdfColors.black)),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 8,
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          child: buildInvoice(cashwithdraw, ttf, ttfbold),
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
                  child: Text(totalrepayment.toStringAsFixed(2),
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
                  child: Text(totalrepayment.toStringAsFixed(2),
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
                  child: Text(((totalcashwithdraw+totaldisbursement)-(totalrepayment+totalcashdeposit)).toStringAsFixed(2),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          font: ttfbold, fontSize: 9, color: PdfColors.black)),
                  flex: 1)
            ])),
      ],
      header: (context) => buildHeader(
        ttf,
        data,
        ttfbold,
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
      'Trans No',
      'Date',
      'DR/CR',
      'Narration',
      'AC No',
      'AC Title',
      'Amount',
    ];

    final data = invoice.map((item) {
      return [
        item.transacno,
        DateFormat.yMd().format(item.transactiondate),
        item.drcr ? 'Debit' : 'Credit',
        item.naration,
        item.acno,
        item.actitle,
        item.amount.toStringAsFixed(2),
      ];
    }).toList();

    return TableHelper.fromTextArray(
      headers: headers,
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
        3: Alignment.centerLeft,
        4: Alignment.centerLeft,
        5: Alignment.centerLeft,
        6: Alignment.centerRight,
        7: Alignment.centerRight,
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
  static Widget buildHeader(final ttf, Uint8List data, final ttfbold) =>
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
                Text("Daily Transaction List",
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
