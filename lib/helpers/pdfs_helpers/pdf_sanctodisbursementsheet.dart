import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:prottashasomit/Model/loanSanction.dart';
import 'package:prottashasomit/Model/scheme.dart';

import '../../Model/member.dart';
import '../auth_service.dart';
import '../pdf_api.dart';

class PdfSanctionDisbursementSheet {
  static Future<File> generate(loanSanction sss, Scheme scc, Memberss member,
      var dsc, bool disbuse) async {
    final pdf = Document();

    final Uint8List data = await yourBackgroundImageFunction();
    final fontData =
        await rootBundle.load("Assets/fonts/opensans/OpenSans-Regular.ttf");
    final ttf = Font.ttf(fontData.buffer.asByteData());

    final fontData2 =
        await rootBundle.load("Assets/fonts/opensans/OpenSans-Bold.ttf");
    final ttfbold = Font.ttf(fontData2.buffer.asByteData());

    String sts = "Requested";
    int app = dsc.approvedby.indexOf('-(*)-');
    int req = sss.requestedby.indexOf('-(*)-');
    String appdate = ": N/A";
    String reqdate = ": N/A";
    String approvedby = ": N/A";
    String requestedby = ": N/A";
    if (app != -1) {
      approvedby = dsc.approvedby.substring(app + 1);
      appdate = DateFormat.yMMMMd().format(dsc.disbursedate);
    }
    if (disbuse) {
      sts = "Disbursed";
    }
    if (req != -1) {
      requestedby = sss.requestedby.substring(req + 1);
      reqdate = DateFormat.yMMMMd().format(sss.sanctiondate);
    }

    pdf.addPage(MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: EdgeInsets.zero,
      orientation: PageOrientation.landscape,
      build: (context) => [
        Container(
            margin: EdgeInsets.only(
                left: PdfPageFormat.a4.marginLeft,
                right: PdfPageFormat.a4.marginRight),
            child: Column(children: [
              Container(
                width: PdfPageFormat.a4.height,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: PdfColors.black)),
                child: Row(children: [
                  Expanded(
                      child: Column(children: [
                    Row(children: [
                      Expanded(
                        child: Text("Samitee Code",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(": ${sss.somiteeid}",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Sanction ID",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(": ${sss.id}",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Sanction Amount",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(": ${sss.sanctionlimit}",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Service Charge",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(": ${sss.servicecharge}%",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Loan Purpose",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(": ${sss.loanpurpose}",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Disbursed By",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(approvedby,
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                  ])),
                  Expanded(
                      child: Column(children: [
                    Row(children: [
                      Expanded(
                        child: Text("Samitee Name",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(": ${sss.somiteename}",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Loan Period",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(": ${scc.duration}",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Service Amount",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(": ${sss.serviceamount}",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Approved By",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(requestedby,
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Disbursed Date",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(appdate,
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                  ])),
                  Expanded(
                      child: Column(children: [
                    Row(children: [
                      Expanded(
                        child: Text("District",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(": SUNAMGANJ",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Install Amount",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(": ${scc.installmentamount}",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Death Risk Amount",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(": ${dsc.deathriskamount}",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Approve Date",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(reqdate,
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                  ])),
                  Expanded(
                      child: Column(children: [
                    Row(children: [
                      Expanded(
                        child: Text("Upozilla",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(": SUNAMGANJ SADAR",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Install Frequency",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(": Daily",
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Disburse Amount",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(dsc.disburseamount.toString(),
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text("Status",
                            style: TextStyle(
                                font: ttfbold,
                                fontSize: 10,
                                color: PdfColors.black)),
                      ),
                      Expanded(
                        child: Text(sts,
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColors.black)),
                      )
                    ]),
                  ])),
                ]),
              ),
              SizedBox(height: 10),
              Container(
                width: PdfPageFormat.a4.height,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: PdfColors.black)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Beneficiary Details :",
                          style: TextStyle(
                              font: ttfbold,
                              fontSize: 10,
                              color: PdfColors.black)),
                      Container(
                          width: 100, color: PdfColors.black, height: 0.5),
                      SizedBox(height: 5),
                      Row(children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Member Code :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin: const EdgeInsets.only(
                                        right: 3, bottom: 5)),
                                Text(sss.memberid,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Member Name :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(sss.membername,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Father/Husband :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(member.fathername,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Mother Name :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(member.mothername,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Mobile No :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(member.mobilenno,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("National ID :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(member.nationalid,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Present Address :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(member.presentadd,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                      ]),
                    ]),
              ),
              SizedBox(height: 10),
              Container(
                width: PdfPageFormat.a4.height,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: PdfColors.black)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Grantor Details : (Social)",
                          style: TextStyle(
                              font: ttfbold,
                              fontSize: 10,
                              color: PdfColors.black)),
                      Container(width: 80, color: PdfColors.black, height: 0.5),
                      SizedBox(height: 5),
                      Row(children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Grantor Name:",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin: const EdgeInsets.only(
                                        right: 3, bottom: 5)),
                                Text(sss.grantorsname,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Father Name :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(sss.grantorsfname,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Mobile Number :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(sss.grantorsmobile,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Occupation :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(sss.grantorsocupasion,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Relation :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(sss.grantorsrelation,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                      ]),
                    ]),
              ),
            ])),
        Container(
            margin: EdgeInsets.only(
                left: PdfPageFormat.a4.marginLeft,
                right: PdfPageFormat.a4.marginRight),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: PdfPageFormat.a4.height,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: PdfColors.black)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Grantor Details : (Family)",
                          style: TextStyle(
                              font: ttfbold,
                              fontSize: 10,
                              color: PdfColors.black)),
                      Container(width: 80, color: PdfColors.black, height: 0.5),
                      SizedBox(height: 5),
                      Row(children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Grantor Name:",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin: const EdgeInsets.only(
                                        right: 3, bottom: 5)),
                                Text(sss.grantorfname,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Father Name :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(sss.grantorffname,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Mobile Number :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(sss.grantorfmobile,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Occupation :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(sss.grantorfocupasion,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Relation :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(sss.grantorfrelation,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                      ]),
                    ]),
              ),
              SizedBox(height: 10),
              Container(
                width: PdfPageFormat.a4.height,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: PdfColors.black)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Grantor Details : (Bussiness)",
                          style: TextStyle(
                              font: ttfbold,
                              fontSize: 10,
                              color: PdfColors.black)),
                      Container(width: 80, color: PdfColors.black, height: 0.5),
                      SizedBox(height: 5),
                      Row(children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Grantor Name:",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin: const EdgeInsets.only(
                                        right: 3, bottom: 5)),
                                Text(sss.grantorpname,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Father Name :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(sss.grantorpfname,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Mobile Number :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(sss.grantorpmobile,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Occupation :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(sss.grantorpocupasion,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Relation :",
                                    style: TextStyle(
                                        font: ttfbold,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                                Container(
                                    color: PdfColors.black,
                                    height: 0.5,
                                    margin:
                                        EdgeInsets.only(right: 3, bottom: 5)),
                                Text(sss.grantorprelation,
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 10,
                                        color: PdfColors.black)),
                              ]),
                        ),
                      ]),
                    ]),
              ),
              SizedBox(height: 10),
              Text("Request To Disburse : sssssss",
                  style: TextStyle(
                      font: ttfbold, fontSize: 10, color: PdfColors.black)),
              Container(width: 100, color: PdfColors.black, height: 0.5),
              SizedBox(height: 5),
              Row(children: [
                Expanded(
                  child: Text("Cash Received By Beneficiary:",
                      style: TextStyle(
                          font: ttfbold, fontSize: 10, color: PdfColors.black)),
                ),
                SizedBox(width: 105),
                Expanded(
                  child: Text("Field Assistant (FA):",
                      style: TextStyle(
                          font: ttfbold, fontSize: 10, color: PdfColors.black)),
                )
              ]),
              Row(children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 40),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sign:",
                                  style: TextStyle(
                                      font: ttf,
                                      fontSize: 10,
                                      color: PdfColors.black)),
                              Text("Name:",
                                  style: TextStyle(
                                      font: ttf,
                                      fontSize: 10,
                                      color: PdfColors.black)),
                              Text("Date:",
                                  style: TextStyle(
                                      font: ttf,
                                      fontSize: 10,
                                      color: PdfColors.black)),
                            ]))),
                Container(
                  width: 85,
                  height: 50,
                  margin: EdgeInsets.only(right: 25),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: PdfColors.black)),
                  alignment: Alignment.center,
                  child: Text("Stamp",
                      style: TextStyle(
                          font: ttfbold, fontSize: 10, color: PdfColors.black)),
                ),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 40),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sign:",
                                  style: TextStyle(
                                      font: ttf,
                                      fontSize: 10,
                                      color: PdfColors.black)),
                              Text("Name:",
                                  style: TextStyle(
                                      font: ttf,
                                      fontSize: 10,
                                      color: PdfColors.black)),
                              Text("Date:",
                                  style: TextStyle(
                                      font: ttf,
                                      fontSize: 10,
                                      color: PdfColors.black)),
                            ]))),
              ]),
              SizedBox(height: 5),
              Row(children: [
                Expanded(
                  child: Text("Verified By Branch Manager:",
                      style: TextStyle(
                          font: ttfbold, fontSize: 10, color: PdfColors.black)),
                ),
                SizedBox(width: 105),
                Expanded(
                  child: Text(
                      "Disbursed By:\nComputer Operator(CO)/ Cash Assistant(CA)",
                      style: TextStyle(
                          font: ttfbold, fontSize: 10, color: PdfColors.black)),
                )
              ]),
              Row(children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 40),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sign:",
                                  style: TextStyle(
                                      font: ttf,
                                      fontSize: 10,
                                      color: PdfColors.black)),
                              Text("Name:",
                                  style: TextStyle(
                                      font: ttf,
                                      fontSize: 10,
                                      color: PdfColors.black)),
                              Text("Date:",
                                  style: TextStyle(
                                      font: ttf,
                                      fontSize: 10,
                                      color: PdfColors.black)),
                            ]))),
                Container(
                  width: 85,
                  height: 50,
                  margin: EdgeInsets.only(right: 25),
                ),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 40),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sign:",
                                  style: TextStyle(
                                      font: ttf,
                                      fontSize: 10,
                                      color: PdfColors.black)),
                              Text("Name:",
                                  style: TextStyle(
                                      font: ttf,
                                      fontSize: 10,
                                      color: PdfColors.black)),
                              Text("Date:",
                                  style: TextStyle(
                                      font: ttf,
                                      fontSize: 10,
                                      color: PdfColors.black)),
                            ]))),
              ]),
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
    ByteData byteData = await rootBundle.load("Assets/logo.jpg");
    return byteData.buffer.asUint8List();
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
                          width: 70, height: 70, fit: BoxFit.fill),
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
                                fontSize: 10,
                                color: PdfColor.fromHex("#1E2772"))),
                        Text(
                            'User: ${AuthService.to.user!.type} - ${AuthService.to.user!.id}',
                            style: TextStyle(
                                font: ttf,
                                fontSize: 10,
                                color: PdfColor.fromHex("#1E2772"))),
                      ]))),
                ]),
                Text("Prottsha Samitee LTD.",
                    style: TextStyle(
                        font: ttfbold,
                        fontSize: 16,
                        color: PdfColor.fromHex("#1E2772"))),
                Text("Sunamgonj Sadar",
                    style: TextStyle(
                        font: ttfbold,
                        fontSize: 12,
                        color: PdfColor.fromHex("#1E2772"))),
                SizedBox(height: 5),
                Text("Loan Santion & Disbursement Sheet",
                    style: TextStyle(
                        font: ttf,
                        fontSize: 12,
                        color: PdfColor.fromHex("#1C1F22"))),
                SizedBox(height: 5),
              ]));
}
