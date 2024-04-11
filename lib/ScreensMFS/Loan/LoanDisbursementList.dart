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
import '../../Model/loanDisbursement.dart';
import '../../helpers/auth_service.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

class LoanDisbursementList extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  LoanDisbursementList({required this.appbool, required this.navbool});

  @override
  State<LoanDisbursementList> createState() => _loanDisbursementListState();
}

class _loanDisbursementListState extends State<LoanDisbursementList> {
  @override
  Widget build(BuildContext context) {
    Future<List<loanDisbursement>> getCust() async {
      List<loanDisbursement> somitee = [];
      await FirebaseFirestore.instance
          .collection('LoanDisbursed')
          .get()
          .then((querySnapshot) {
        for (var json in querySnapshot.docs) {
          somitee.add(loanDisbursement(
            somiteename: json['Somitee Name'],
            somiteeid: json['Somitee ID'],
            deathriskamount: json["Death Risk Amount"],
            lst: loanSanction.fromJson(json['Sanction']),
            membername: json['Member Name'],
            approvedby: json["Approved By"],
            requestedby: json["Requested By"],
            disbursedate: json["Disbursed Date"].toDate(),
            memberid: json['Member ID'],
            disburseamount: json["Disbursed Amount"],
            narration: json["Narration"],
            approvedate: json["Approve Date"].toDate(),
            pincode: json["Pin Code"],
            status: json["Status"],
            approve: json["Approve"],
            id: json.id,
            sl: json['SL'],
          ));
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
                                      'Disburse ID',
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
                                    label: Text(
                                      'Action',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                                rows: List.generate(snapshot.data.length,
                                    (index) {
                                  if ((AuthService.to.user?.type ==
                                          "Super Admin") ||
                                      (AuthService.to.user?.type ==
                                          "Branch Manager")) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Text((index + 1).toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ))),
                                        DataCell(
                                          Text(snapshot.data[index].id,
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                        DataCell(
                                          Text(
                                              snapshot.data[index].somiteename +
                                                  " " +
                                                  snapshot
                                                      .data[index].somiteeid,
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
                                        DataCell(Text(
                                            snapshot.data[index].membername,
                                            style: TextStyle(
                                              fontSize: 12,
                                            ))),
                                        DataCell(
                                          Text(
                                              snapshot
                                                  .data[index].disburseamount
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(
                                                DateFormat.yMMMd()
                                                    .format(snapshot.data[index]
                                                        .disbursedate)
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                )),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                              snapshot.data[index].status
                                                  ? snapshot.data[index].approve
                                                      ? "Approved"
                                                      : "Rejected"
                                                  : "Requested",
                                              style: const TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                        DataCell(snapshot.data[index].status
                                            ? InkWell(
                                                onTap: () {},
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    decoration: BoxDecoration(
                                                        color: AppColor_Blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100)),
                                                    child: const Icon(
                                                      Icons.edit,
                                                      size: 16,
                                                      color: AppColor_White,
                                                    )),
                                              )
                                            : Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('Member')
                                                          .doc(snapshot
                                                              .data[index]
                                                              .memberid)
                                                          .update({
                                                        'Loan Pending Amount': FieldValue
                                                            .increment((snapshot
                                                                    .data[index]
                                                                    .disburseamount -
                                                                snapshot
                                                                    .data[index]
                                                                    .deathriskamount)),
                                                      });
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              'LoanDisbursed')
                                                          .doc(snapshot
                                                              .data[index].id)
                                                          .update({
                                                        "Status": true,
                                                        "Approved By":
                                                            "${AuthService.to.user!.id}-(*)-${AuthService.to.user!.name}",
                                                        "Approve": true,
                                                        'Approve Date':
                                                            DateTime.now(),
                                                      }).then((value) {
                                                        setState(() {});
                                                      });
                                                    },
                                                    child: Container(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        decoration: BoxDecoration(
                                                            color:
                                                                AppColor_Blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100)),
                                                        child: const Icon(
                                                          Icons.check,
                                                          size: 16,
                                                          color: AppColor_White,
                                                        )),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              'LoanDisbursed')
                                                          .doc(snapshot
                                                              .data[index].id)
                                                          .update({
                                                        "Status": true,
                                                        "Approved By":
                                                            "${AuthService.to.user!.id}-(*)-${AuthService.to.user!.name}",
                                                        "Approve": false,
                                                        'Approve Date':
                                                            DateTime.now(),
                                                      }).then((value) {
                                                        setState(() {});
                                                      });
                                                    },
                                                    child: Container(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        decoration: BoxDecoration(
                                                            color:
                                                                AppColor_Blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100)),
                                                        child: const Icon(
                                                          Icons.close,
                                                          size: 16,
                                                          color: AppColor_White,
                                                        )),
                                                  ),
                                                ],
                                              )),
                                      ],
                                    );
                                  } else {
                                    if (snapshot.data[index].sts) {
                                      return DataRow(
                                        cells: [
                                          DataCell(Text((index + 1).toString(),
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ))),
                                          DataCell(
                                            Text(snapshot.data[index].id,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                )),
                                          ),
                                          DataCell(
                                            Text(
                                                snapshot.data[index]
                                                        .somiteename +
                                                    " " +
                                                    snapshot
                                                        .data[index].somiteeid,
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
                                          DataCell(Text(
                                              snapshot.data[index].membername,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ))),
                                          DataCell(
                                            Text(
                                                snapshot
                                                    .data[index].disburseamount
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
                                                          .data[index]
                                                          .disbursedate)
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                                snapshot.data[index].status
                                                    ? snapshot
                                                            .data[index].approve
                                                        ? "Approved"
                                                        : "Rejected"
                                                    : "Requested",
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                )),
                                          ),
                                          DataCell(SizedBox()),
                                        ],
                                      );
                                    } else {
                                      return null;
                                    }
                                  }
                                }).whereType<DataRow>().toList(),
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
