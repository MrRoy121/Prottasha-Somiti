import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:prottashasomit/Model/loanSanction.dart';
import 'package:prottashasomit/Model/scheme.dart';

import '../../Model/cashWithdrawModel.dart';
import '../../Model/member.dart';
import '../auth_service.dart';
import '../pdf_api.dart';

class PdfCashwithdrawSlip {
  static Future<File> generate(CashWithdrawModel sss) async {
    final pdf = Document();

    final Uint8List data = await yourBackgroundImageFunction();
    final fontData =
        await rootBundle.load("assets/fonts/opensans/OpenSans-Regular.ttf");
    final ttf = Font.ttf(fontData.buffer.asByteData());

    final fontData2 =
        await rootBundle.load("assets/fonts/opensans/OpenSans-Bold.ttf");
    final ttfbold = Font.ttf(fontData2.buffer.asByteData());

    pdf.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      margin: EdgeInsets.zero,
      build: (context) => Container(
        width: PdfPageFormat.a4.width,
        margin: EdgeInsets.only(
            top: PdfPageFormat.a4.marginTop,
            left: PdfPageFormat.a4.marginLeft-10,
            right: PdfPageFormat.a4.marginRight-10,),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(width: 0.8, color: PdfColors.black)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Expanded(
              flex: 1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Savings Account No:",
                        style: TextStyle(
                            font: ttfbold,
                            fontSize: 10,
                            color: PdfColors.black)),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.4, color: PdfColors.black)),
                      padding: EdgeInsets.all(5),
                      child: Text(sss.accountno,
                          style: TextStyle(
                              font: ttfbold,
                              fontSize: 10,
                              color: PdfColors.blue)),
                    ),
                    SizedBox(height: 3),
                    Row(children: [
                      Expanded(
                        child: Container(
                            child: Image(MemoryImage(data),
                                width: 25, height: 25, fit: BoxFit.fill),
                            color: PdfColors.black),
                      ),
                      Expanded(
                        child: Text("    PSRCSL",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Text("Date: ${DateFormat.yMMMMd().format(sss.approvedate)}",
                        style: TextStyle(
                            font: ttfbold,
                            fontSize: 10,
                            color: PdfColors.black)),
                    Container(
                        width: double.infinity,
                        height: 0.6,
                        margin: const EdgeInsets.only(bottom: 5),
                        color: PdfColors.grey),
                    Text("Pay To: ${sss.membername}",
                        style: TextStyle(
                            font: ttfbold,
                            fontSize: 10,
                            color: PdfColors.black)),
                    Container(
                        width: double.infinity,
                        height: 0.6,
                        margin: const EdgeInsets.only(bottom: 5),
                        color: PdfColors.grey),
                    Text("Amount: ${sss.withdrawamount}",
                        style: TextStyle(
                            font: ttfbold,
                            fontSize: 10,
                            color: PdfColors.black)),
                    Container(
                        width: double.infinity,
                        height: 0.6,
                        margin: const EdgeInsets.only(bottom: 5),
                        color: PdfColors.grey),
                    Text("Status:",
                        style: TextStyle(
                            font: ttfbold,
                            fontSize: 10,
                            color: PdfColors.black)),
                    Container(
                        width: double.infinity,
                        height: 0.6,
                        margin: const EdgeInsets.only(bottom: 5),
                        color: PdfColors.grey),
                    Text("Serial No: ${sss.sl}",
                        style: TextStyle(
                            font: ttfbold,
                            fontSize: 10,
                            color: PdfColors.black)),
                    Container(
                        width: double.infinity,
                        height: 0.6,
                        margin: const EdgeInsets.only(bottom: 5),
                        color: PdfColors.grey),
                  ])),
          SizedBox(width: 15),
          Expanded(
              flex: 3,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 25),
                    Text("Cash Withdrawal Form",
                        style: TextStyle(
                            font: ttfbold,
                            fontSize: 10,
                            color: PdfColors.grey)),
                    Expanded(child: SizedBox()),
                    Text("Form No. S-17  SL NO. ${sss.sl}",
                        style: TextStyle(
                            font: ttfbold,
                            fontSize: 10,
                            color: PdfColors.grey)),
                    SizedBox(width: 25),
                  ],
                ),
                Row(children: [
                  Container(
                      child: Image(MemoryImage(data),
                          width: 35, height: 35, fit: BoxFit.fill),
                      color: PdfColors.black),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          'Prottyasha Sanchoy & Rindan Co-Operative Samitee Ltd.',
                          style: TextStyle(
                              font: ttfbold,
                              fontSize: 10,
                              color: PdfColors.black)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Branch : ",
                              style: TextStyle(
                                  font: ttfbold,
                                  fontSize: 10,
                                  color: PdfColors.blue)),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Sunamgomj Sadar - 5200  ",
                                  style: TextStyle(
                                      font: ttf,
                                      fontSize: 10,
                                      color: PdfColors.blue)),
                              Container(
                                  width: 115,
                                  height: 0.6,
                                  color: PdfColors.grey),
                            ],
                          ),
                          Text(
                              "     Date: ${DateFormat.yMMMMd().format(sss.approvedate)}",
                              style: TextStyle(
                                  font: ttf,
                                  fontSize: 10,
                                  color: PdfColors.black)),
                        ],
                      ),
                    ],
                  ),
                ]),
                Container(
                    decoration: BoxDecoration(
                        color: PdfColors.brown50,
                        border: Border.all(width: 0.4, color: PdfColors.black)),
                    padding: EdgeInsets.all(5),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Pay To :   ",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Text("${sss.membername}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Expanded(child: SizedBox()),
                              ]),
                          Container(
                              width: double.infinity,
                              height: 0.6,
                              margin:
                                  const EdgeInsets.only(left: 50, bottom: 5),
                              color: PdfColors.grey),
                          Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Amount In Words :   ",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Text("${sss.amountinword}/=",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Expanded(child: SizedBox()),
                              ]),
                          Container(
                              width: double.infinity,
                              height: 0.6,
                              margin:
                                  const EdgeInsets.only(left: 95, bottom: 5),
                              color: PdfColors.grey),
                          Container(
                            margin: EdgeInsets.only(left: 180),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: PdfColors.white,
                                border: Border.all(
                                    width: 0.8, color: PdfColors.black)),
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Amount :  ",
                                      style: TextStyle(
                                          font: ttfbold,
                                          fontSize: 10,
                                          color: PdfColors.black)),
                                  Text("${sss.withdrawamount}/=",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          font: ttf,
                                          fontSize: 10,
                                          color: PdfColors.black)),
                                  Expanded(child: SizedBox()),
                                ]),
                          ),
                          Container(
                              width: double.infinity,
                              height: 0.6,
                              margin:
                                  const EdgeInsets.only(right: 100, bottom: 5),
                              color: PdfColors.grey),
                          Text("Savings Account No:",
                              style: TextStyle(
                                  font: ttfbold,
                                  fontSize: 10,
                                  color: PdfColors.black)),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: PdfColors.white,
                                      border: Border.all(
                                          width: 0.4, color: PdfColors.black)),
                                  padding: EdgeInsets.all(5),
                                  child: Text(sss.accountno,
                                      style: TextStyle(
                                          font: ttfbold,
                                          fontSize: 10,
                                          color: PdfColors.blue)),
                                ),
                                Column(
                                  children: [Container(
                                      width: 90,
                                      height: 0.6,
                                      margin: const EdgeInsets.only(
                                          right: 5, top:10),
                                      color: PdfColors.grey),
                                    Text("Signature",
                                        style: TextStyle(
                                            font: ttf,
                                            fontSize: 10,
                                            color: PdfColors.black)),
                                  ]
                                )

                              ]),
                          SizedBox(height: 3),

                        ]))
              ])),
        ]),
      ),
    ));
    return PdfApi.saveDocument(
        "Memberss_List${DateFormat('dd-MMM-yyyy-jms').format(DateTime.now())}.pdf",
        pdf);
  }

  static Future<Uint8List> yourBackgroundImageFunction() async {
    ByteData byteData = await rootBundle.load("assets/logo.jpg");
    return byteData.buffer.asUint8List();
  }
}
