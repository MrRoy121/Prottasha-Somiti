import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Constants/values.dart';
import '../../../../Model/loanSanction.dart';
import '../../../../Model/member.dart';
import 'package:get/get.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../../Model/scheme.dart';
import '../../helpers/auth_service.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

class LoanSanctionApprove extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  LoanSanctionApprove({required this.appbool, required this.navbool});

  @override
  State<LoanSanctionApprove> createState() => _LoanSanctionApproveState();
}

class _LoanSanctionApproveState extends State<LoanSanctionApprove> {
  late loanSanction lst;
  bool selectloan = false;

  void _addinit(loanSanction cst) {
    selectloan = true;
    lst = cst;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    loanSanction mst = loanSanction(
        somiteename: arguments['LoanSanction']["Somitee Name"] ?? " ",
        somiteeid: arguments['LoanSanction']["Somitee ID"] ?? " ",
        loanpurpose: arguments['LoanSanction']['Loan Purpose'] ?? " ",
        scheme: arguments['LoanSanction']["Loan Scheme"] ?? " ",
        category: arguments['LoanSanction']['Loan Category'] ?? " ",
        approvedate: arguments['LoanSanction']["Approve Date"] ?? " ",
        membername: arguments['LoanSanction']['Member Name'] ?? " ",
        memberid: arguments['LoanSanction']['Member ID'] ?? " ",
        memberphone: arguments['LoanSanction']['Member Phone'] ?? " ",
        sanctionlimit: arguments['LoanSanction']["Sanction Limit"] ?? 0,
        installmentfrequency:
            arguments['LoanSanction']["Installment Frequency"] ?? " ",
        approvedby: arguments['LoanSanction']["Approved By"] ?? " ",
        requestedby: arguments['LoanSanction']["Requested By"] ?? " ",
        sanctiondate: arguments['LoanSanction']["Sanction Date"] ?? " ",
        servicecharge: arguments['LoanSanction']["Service Charge"] ?? 0,
        installmentno: arguments['LoanSanction']["Installment No"] ?? 0,
        installmentamount: arguments['LoanSanction']["Installment Amount"] ?? 0,
        remarks: arguments['LoanSanction']["Remarks"] ?? " ",
        serviceamount: arguments['LoanSanction']["Service Amount"] ?? 0,
        grantorfname: arguments['LoanSanction']["Grantor F Name"] ?? " ",
        grantorffname: arguments['LoanSanction']["Grantor F FatherName"] ?? " ",
        grantorfrelation:
            arguments['LoanSanction']["Grantor F Relation"] ?? " ",
        grantorfmobile: arguments['LoanSanction']["Grantor F Mobile"] ?? " ",
        grantorfocupasion:
            arguments['LoanSanction']["Grantor F Occupation"] ?? " ",
        grantorsname: arguments['LoanSanction']["Grantor S Name"] ?? " ",
        grantorsfname: arguments['LoanSanction']["Grantor S FatherName"] ?? " ",
        grantorsrelation:
            arguments['LoanSanction']["Grantor S Relation"] ?? " ",
        grantorsmobile: arguments['LoanSanction']["Grantor S Mobile"] ?? " ",
        grantorsocupasion:
            arguments['LoanSanction']["Grantor S Occupation"] ?? " ",
        grantorpname: arguments['LoanSanction']["Grantor P Name"] ?? " ",
        grantorpfname: arguments['LoanSanction']["Grantor P FatherName"] ?? " ",
        grantorprelation:
            arguments['LoanSanction']["Grantor P Relation"] ?? " ",
        grantorpmobile: arguments['LoanSanction']["Grantor P Mobile"] ?? " ",
        grantorpocupasion:
            arguments['LoanSanction']["Grantor P Occupation"] ?? " ",
        status: arguments['LoanSanction']["Status"] ?? " ",
        id: arguments['LoanSanction']['ID'] ?? " ",
        sl: arguments['LoanSanction']['SL'] ?? 0);
    _addinit(mst);

    Scheme scheme =
        LoanSchemes.firstWhere((element) => element.name == mst.scheme);
    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: 1400,
              // color: Colors.white,
              margin: EdgeInsets.only(top: 100, left: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),

              child: Column(
                children: [
                  Container(
                    width: 1400,
                    height: 40,
                    color: navbarColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text(
                            "Loan Status Update",
                            style: TextStyle(
                              color: AppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                            Get.toNamed(
                              sanctionloaneditPageRoute,
                              arguments: {
                                'LoanSanction': lst.toJson(),
                              },
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 90,
                            color: AppColor_yellow,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 3.0, left: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Edit",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            FirebaseFirestore.instance
                                .collection('LoanSanction')
                                .doc(lst.id)
                                .update({
                              "Status": "Approved",
                              "Approved By":
                                  "${AuthService.to.user!.id}-(*)-${AuthService.to.user!.name}",
                              "Approve Date": DateTime.now(),
                            }).then((value) async {
                              Get.offNamed(sanctionloanapprovelistPageRoute);
                              Get.snackbar(
                                  "Loan Sanction Approved Successfully.",
                                  "Redirecting to Loan Sanction List Page.",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                  backgroundColor: Colors.green,
                                  margin: EdgeInsets.zero,
                                  duration: const Duration(milliseconds: 2000),
                                  boxShadows: [
                                    const BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(-100, 0),
                                        blurRadius: 20),
                                  ],
                                  borderRadius: 0);
                            }).catchError((error) =>
                                    print("Failed to add user: $error"));
                          },
                          child: Container(
                            height: 40,
                            width: 90,
                            color: Colors.green,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 15),
                              child: Text(
                                "✓ Approve",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            FirebaseFirestore.instance
                                .collection('LoanSanction')
                                .doc(lst.id)
                                .update({
                              "Status": "Rejected",
                              "Approved By":
                                  "${AuthService.to.user!.id}-(*)-${AuthService.to.user!.name}",
                              "Approve Date": DateTime.now(),
                            }).then((value) async {
                              Get.offNamed(sanctionloanapprovelistPageRoute);
                              Get.snackbar(
                                  "Loan Sanction Rejected Successfully.",
                                  "Redirecting to Loan Sanction List Page.",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                  backgroundColor: Colors.green,
                                  margin: EdgeInsets.zero,
                                  duration: const Duration(milliseconds: 2000),
                                  boxShadows: [
                                    const BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(-100, 0),
                                        blurRadius: 20),
                                  ],
                                  borderRadius: 0);
                            }).catchError((error) =>
                                    print("Failed to add user: $error"));
                          },
                          child: Container(
                            height: 40,
                            width: 90,
                            color: Colors.red,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 3.0, left: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Reject",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            width: 50,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 20),
                              child: Text(
                                "X",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 60),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Samitee Name',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.somiteename : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Sanction Limit',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan
                                        ? lst.sanctionlimit.toString()
                                        : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Mobile Number :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.memberphone : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Duration :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 135,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan
                                        ? scheme.duration.toString()
                                        : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Service Charge :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan
                                        ? lst.servicecharge.toString()
                                        : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Installment Frequency',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.installmentfrequency : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Installment No :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan
                                        ? lst.installmentno.toString()
                                        : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Sanction Date',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan
                                        ? DateFormat.yMMMMd()
                                            .format(lst.sanctiondate)
                                        : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Loan Guarantor (Social) Information",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 390,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Guarantor Name',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorsname : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Relation With Beneficiary',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorsrelation : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Occupasion',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 95,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorsocupasion : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Loan Guarantor (Family) Information",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 390,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Guarantor Name',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorfname : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Relation With Beneficiary',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorfrelation : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Occupasion',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 95,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorfocupasion : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Loan Guarantor (Business) Information",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 390,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Guarantor Name',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorpname : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Relation With Beneficiary',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorprelation : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Occupasion',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 95,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorpocupasion : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Select Member',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.membername : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Loan Category",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.category : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Loan Scheme",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.scheme : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Loan Purpose ",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.loanpurpose : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Amount :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan
                                        ? lst.serviceamount.toString()
                                        : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Installment Amount :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan
                                        ? lst.installmentamount.toString()
                                        : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Remarks :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.remarks : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 105,
                            ),
                            Text(
                              " ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Guarantor Father Name',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorsfname : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Guarantor Mobile Number',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorsmobile : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 105,
                            ),
                            Text(
                              " ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Guarantor Father Name',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorffname : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Guarantor Mobile Number',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorfmobile : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 105,
                            ),
                            Text(
                              " ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Guarantor Father Name',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorpfname : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Guarantor Mobile Number',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    selectloan ? lst.grantorpmobile : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 55,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            NavbarScreenMFS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
          ],
        ),
      ),
    );
  }
}
