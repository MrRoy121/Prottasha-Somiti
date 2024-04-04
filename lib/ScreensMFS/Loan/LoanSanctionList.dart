import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/loanSanction.dart';
import '../../../../Model/member.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

class LoanSanctionList extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  LoanSanctionList({required this.appbool, required this.navbool});

  @override
  State<LoanSanctionList> createState() => _LoanSanctionListState();
}

class _LoanSanctionListState extends State<LoanSanctionList> {
  @override
  Widget build(BuildContext context) {
    Future<List<loanSanction>> getCust() async {
      List<loanSanction> somitee = [];
      int s = 1;
      await FirebaseFirestore.instance
          .collection('LoanSanction')
          .get()
          .then((querySnapshot) {
        for (var json in querySnapshot.docs) {
          if (json["Status"] == "Requested") {
            somitee.add(loanSanction(
                somiteename: json['Somitee Name'],
                somiteeid: json['Somitee ID'],
                membername: json['Member Name'],
                memberid: json['Member ID'],
                approvedby: json["Approved By"],
                requestedby: json["Requested By"],
                scheme: json["Loan Scheme"],
                category: json['Loan Category'],
                loanpurpose: json["Loan Purpose"],
                approvedate: json["Approve Date"].toDate(),
                memberphone: json['Member Phone'],
                sanctionlimit: json["Sanction Limit"],
                installmentfrequency: json["Installment Frequency"],
                sanctiondate: json["Sanction Date"].toDate(),
                servicecharge: json["Service Charge"],
                installmentno: json["Installment No"],
                installmentamount: json["Installment Amount"],
                remarks: json["Remarks"],
                serviceamount: json["Service Amount"],
                grantorfname: json["Grantor F Name"],
                grantorffname: json["Grantor F FatherName"],
                grantorfrelation: json["Grantor F Relation"],
                grantorfmobile: json["Grantor F Mobile"],
                grantorfocupasion: json["Grantor F Occupation"],
                grantorsname: json["Grantor S Name"],
                grantorsfname: json["Grantor S FatherName"],
                grantorsrelation: json["Grantor S Relation"],
                grantorsmobile: json["Grantor S Mobile"],
                grantorsocupasion: json["Grantor S Occupation"],
                grantorpname: json["Grantor P Name"],
                grantorpfname: json["Grantor P FatherName"],
                grantorprelation: json["Grantor P Relation"],
                grantorpmobile: json["Grantor P Mobile"],
                grantorpocupasion: json["Grantor P Occupation"],
                status: json["Status"],
                id: json['ID'],
                sl: s));
            s++;
          }
        }
      });
      return somitee;
    }

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
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text(
                            "All Requested Sanction List",
                            style: TextStyle(
                              color: AppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: FutureBuilder(
                      builder: (ctx, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text("No Loan Data Available.."),
                            );
                          } else if (snapshot.hasData) {
                            return MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: DataTable(
                                showCheckboxColumn: false,
                                border: TableBorder.all(
                                    color: Colors.black26, width: 1),
                                headingRowColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColor_Blue),
                                columns: const [
                                  DataColumn(
                                    label: Text(
                                      'SL',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Sanction ID',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Somitee Code',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Member Code',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text('Member Name',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Mobile No',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Sanction Limit',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Sanction Date',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Status',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text('ACTION',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                                rows: List.generate(snapshot.data.length,
                                    (index) {
                                  return DataRow(
                                    cells: [
                                      DataCell(Text((index + 1).toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ))),
                                      DataCell(
                                        Text("S" + snapshot.data[index].id,
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                        Text(
                                            snapshot.data[index].somiteename +
                                                " " +
                                                snapshot.data[index].somiteeid,
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                        Text(snapshot.data[index].memberid,
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                          Text(snapshot.data[index].membername,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ))),
                                      DataCell(
                                        Text(snapshot.data[index].memberphone,
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                        Text(
                                            snapshot.data[index].sanctionlimit
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                        Center(
                                          child: Text(
                                              DateFormat.yMMMd()
                                                  .format(snapshot
                                                      .data[index].sanctiondate)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                      ),
                                      DataCell(
                                        Text(snapshot.data[index].status,
                                            style: const TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              loanSanction sss =
                                                  snapshot.data[index];
                                              Get.toNamed(
                                                sanctionloanapprovePageRoute,
                                                arguments: {
                                                  'LoanSanction': sss.toJson(),
                                                },
                                              );
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(4.0),
                                                decoration: BoxDecoration(
                                                    color: AppColor_Blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                child: const Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  size: 16,
                                                  color: AppColor_White,
                                                )),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              loanSanction sss =
                                                  snapshot.data[index];
                                              Get.toNamed(
                                                sanctionloaneditPageRoute,
                                                arguments: {
                                                  'LoanSanction': sss.toJson(),
                                                },
                                              );
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(4.0),
                                                decoration: BoxDecoration(
                                                    color: AppColor_Blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                child: const Icon(
                                                  Icons.edit_outlined,
                                                  size: 16,
                                                  color: AppColor_White,
                                                )),
                                          ),
                                        ],
                                      )),
                                    ],
                                  );
                                }),
                              ),
                            );
                          }
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      future: getCust(),
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
