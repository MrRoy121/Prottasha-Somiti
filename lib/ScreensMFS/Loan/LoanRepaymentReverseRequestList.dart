import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/member.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../../Model/loanRepayment.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

class LoanRepaymentReverseRequestList extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  LoanRepaymentReverseRequestList(
      {required this.appbool, required this.navbool});

  @override
  State<LoanRepaymentReverseRequestList> createState() =>
      _LoanRepaymentReverseRequestListState();
}

class _LoanRepaymentReverseRequestListState
    extends State<LoanRepaymentReverseRequestList> {
  @override
  Widget build(BuildContext context) {
    Future<List<loanRepayment>> getCust() async {
      List<loanRepayment> somitee = [];
      int s = 1;
      await FirebaseFirestore.instance
          .collection('LoanRepaymentReverse')
          .orderBy('Approve Date', descending: true)
          .get()
          .then((querySnapshot) {
        for (var json in querySnapshot.docs) {
          somitee.add(loanRepayment(
              somiteename: json['Somitee Name'],
              somiteeid: json['Somitee ID'],
              membername: json['Member Name'],
              id: json['ID'],
              approve: json['Approve'],
              memberid: json['Member ID'],
              disbursedamount: json["Disbursed Amount"],
              requestdate: json['Repayment Date'].toDate(),
              payamount: json['Pay Amount'],
              sanctionid: json['Sanction Id'],
              narration: '',
              amountclose: json['Amount Close'],
              amount: json['Amount'],
              sl: s,
              status: json['Status'],
              approvedate: json["Approve Date"].toDate()));
          s++;
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
                            "All Reversed Requested Repayment List",
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
                                      'Transaction ID',
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
                                    label: Text(
                                      'Transaction Date',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text('Disbursed Amount',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Pay Amount',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
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
                                        Text(snapshot.data[index].id,
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                        Text(snapshot.data[index].sanctionid,
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
                                        Text(
                                            snapshot.data[index].memberid +
                                                " " +
                                                snapshot.data[index].membername,
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                        Center(
                                          child: Text(
                                              DateFormat.yMMMd()
                                                  .format(snapshot
                                                      .data[index].requestdate)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                      ),
                                      DataCell(Text(
                                          snapshot.data[index].disbursedamount
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                          ))),
                                      DataCell(
                                        Text(
                                            snapshot.data[index].payamount
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
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
                                          ? SizedBox()
                                          : Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            'LoanRepaymentReverse')
                                                        .doc(snapshot
                                                            .data[index].id)
                                                        .update({
                                                      "Status": true,
                                                      "Approve": true,
                                                      'Approve Date':
                                                          DateTime.now(),
                                                    }).then((value) {
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              'LoanRepayment')
                                                          .doc(snapshot
                                                              .data[index].id)
                                                          .delete();
                                                      setState(() {});
                                                    });
                                                  },
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(4.0),
                                                      decoration: BoxDecoration(
                                                          color: AppColor_Blue,
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
                                                            'LoanRepaymentReverse')
                                                        .doc(snapshot
                                                            .data[index].id)
                                                        .update({
                                                      "Status": true,
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
                                                          color: AppColor_Blue,
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
