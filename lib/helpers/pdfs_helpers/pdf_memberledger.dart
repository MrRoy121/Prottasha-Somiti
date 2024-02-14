import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../Model/Itemvaluess.dart';
import '../auth_service.dart';
import '../pdf_api.dart';

class PdfMemberss {
  static Future<File> generate(
      List<Itemvaluess> invoice, double total, var balancelist, String ledgeno, ledgertitle, ledgertype,acstatus,DateTime startdate, enddate) async {
    final pdf = Document();

    final Uint8List data = await yourBackgroundImageFunction();
    final fontData =
        await rootBundle.load("Assets/fonts/opensans/OpenSans-Regular.ttf");
    final ttf = Font.ttf(fontData.buffer.asByteData());

    final fontData2 =
        await rootBundle.load("Assets/fonts/opensans/OpenSans-Bold.ttf");
    final ttfbold = Font.ttf(fontData2.buffer.asByteData());

    pdf.addPage(MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: EdgeInsets.zero,
      build: (context) => [
        Container(
          margin: EdgeInsets.only(
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          width: PdfPageFormat.a4.width,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              border:
                  Border.all(width: 0.5, color: PdfColors.black)),
          child: Row(children: [
            Expanded(
                child: Column(children: [
              Row(children: [
                Expanded(
                  child: Text("Ledger No",
                      style: TextStyle(
                          font: ttfbold,
                          fontSize: 8,
                          color: PdfColors.black)),
                ),
                Expanded(
                  child: Text(": $ledgeno",
                      style: TextStyle(
                          font: ttf,
                          fontSize: 8,
                          color: PdfColors.black)),
                )
              ]),
              Row(children: [
                Expanded(
                  child: Text("Ledger Title",
                      style: TextStyle(
                          font: ttfbold,
                          fontSize: 8,
                          color: PdfColors.black)),
                ),
                Expanded(
                  child: Text(": $ledgertitle",
                      style: TextStyle(
                          font: ttf,
                          fontSize: 8,
                          color: PdfColors.black)),
                )
              ]),
                  Row(children: [
                    Expanded(
                      child: Text("Ledger Type",
                          style: TextStyle(
                              font: ttfbold,
                              fontSize: 8,
                              color: PdfColors.black)),
                    ),
                    Expanded(
                      child: Text(": $ledgertype",
                          style: TextStyle(
                              font: ttf,
                              fontSize: 8,
                              color: PdfColors.black)),
                    )
                  ])
            ])),
            Expanded(
                child: Column(children: [
              Row(children: [
                Expanded(
                  child: Text("Currency",
                      style: TextStyle(
                          font: ttfbold,
                          fontSize: 8,
                          color: PdfColors.black)),
                ),
                Expanded(
                  child: Text(": BDT Bangladeshi Taka",
                      style: TextStyle(
                          font: ttf,
                          fontSize: 8,
                          color: PdfColors.black)),
                )
              ]),
              Row(children: [
                Expanded(
                  child: Text("A/c Status",
                      style: TextStyle(
                          font: ttfbold,
                          fontSize: 8,
                          color: PdfColors.black)),
                ),
                Expanded(
                  child: Text(": $acstatus",
                      style: TextStyle(
                          font: ttf,
                          fontSize: 8,
                          color: PdfColors.black)),
                )
              ])
            ])),
          ]),
        ),
        Container(
          margin: EdgeInsets.only(
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),
          child: buildInvoice(invoice, ttf, ttfbold, balancelist),
        ),
        Container(
          margin: EdgeInsets.only(
              left: PdfPageFormat.a4.marginLeft,
              right: PdfPageFormat.a4.marginRight),

          decoration: BoxDecoration(
              border:
              Border.all(width: 0.5, color: PdfColors.black)),
          child: buildTotal(invoice, total, ttfbold),
        ),
      ],
      header: (context) => buildHeader(ttf, data, ttfbold,startdate,enddate),
      footer: (context) => buildFooter(ttf, ttfbold),
    ));
    return PdfApi.saveDocument(
        "Memberss_List${DateFormat('dd-MMM-yyyy-jms').format(DateTime.now())}.pdf",
        pdf);
  }

  static Future<Uint8List> yourBackgroundImageFunction() async {
    ByteData byteData = await rootBundle.load("Assets/logo.jpg");
    return byteData.buffer.asUint8List();
  }

  static Widget buildInvoice(
    List<Itemvaluess> invoice,
    final ttf,
    final ttfbold,
    var balancelist,
  ) {
    final headers = [
      'Trans Date & Doc No.',
      'Narration',
      'Debit',
      'Credit',
      'Balance'
    ];

    final data = invoice.map((item) {
      return [
        item.date + "TR00"+ "${item.sl + 1}",
        item.remarks,
        '',
        item.value,
        balancelist[item.sl]
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
        4: Alignment.centerRight,
        4: Alignment.centerRight,
        4: Alignment.centerRight,
      },
    );
  }

  static Widget buildTotal(
      List<Itemvaluess> invoice, double total, final ttfbold) {
    return Container(
        alignment: Alignment.centerRight,
        child: Row(children: [
          Spacer(flex: 6),
          Expanded(
              flex: 4,
              child: Row(children: [
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Text("Total Debit/Credit :",
                          style: TextStyle(
                              font: ttfbold,
                              color: PdfColors.black,
                              fontSize: 10))),
                  flex: 5,
                ),
                Container(width: 0.5, height: 30, color: PdfColors.black),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Text(total.toString(),
                        style: TextStyle(
                            font: ttfbold,
                            color: PdfColors.black,
                            fontSize: 10)),
                  ),
                  flex: 3,
                ),
              ]))
        ]));
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
  static Widget buildHeader(final ttf, Uint8List data, final ttfbold, DateTime startdate, enddate) =>
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
                Text("Statement For Period:  ${DateFormat('dd MMMM, yyyy').format(startdate)} to  ${DateFormat('dd MMMM, yyyy').format(enddate)}",
                    style: TextStyle(
                        font: ttf,
                        fontSize: 10,
                        color: PdfColor.fromHex("#1E2772"))),
                SizedBox(height: 30),
              ]));
}
