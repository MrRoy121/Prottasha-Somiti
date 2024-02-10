import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/member.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../../Model/depositReverse.dart';
import '../../Model/loanRepayment.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

class DepositCorrectionRequestList extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DepositCorrectionRequestList({required this.appbool, required this.navbool});

  @override
  State<DepositCorrectionRequestList> createState() =>
      _DepositCorrectionRequestListState();
}

class _DepositCorrectionRequestListState
    extends State<DepositCorrectionRequestList> {
  @override
  Widget build(BuildContext context) {
    Future<List<depositReverse>> getCust() async {
      List<depositReverse> somitee = [];
      int s = 1;
      await FirebaseFirestore.instance
          .collection('DepositReverse')
          .orderBy('Approve Date', descending: true)
          .get()
          .then((querySnapshot) {
        for (var json in querySnapshot.docs) {
          somitee.add(depositReverse(
            somiteename: json['Somitee Name'],
            somiteeid: json['Somitee ID'],
            mainamount: json['Main Amount'],
            requestdate: json['Request Date'].toDate(),
            reveersetype: json['Reverse Type'],
            membername: json['Member Name'],
            amount: json['Amount'],
            approve: json['Approve'],
            date: json['Date'].toDate(),
            memberid: json['Member ID'],
            approvedate: json["Approve Date"].toDate(),
            remarks: json["Remarks"],
            status: json["Status"],
            id: json['ID'],
            sl: s,
          ));
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
                            "All Deposit Reverse List",
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
                                    numeric: true,
                                    label: Text('Paid Amount',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    numeric: true,
                                    label: Text('Reversed Amount',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Reverse Type',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Remarks',
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
                                          snapshot.data[index].mainamount
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                          ))),
                                      DataCell(
                                        Text(
                                            snapshot.data[index].amount
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                        Text(
                                            snapshot.data[index].reveersetype
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                        Text(
                                            snapshot.data[index].remarks
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
                                          ? InkWell(
                                              onTap: () {},
                                              child: Container(
                                                  padding: EdgeInsets.all(4.0),
                                                  decoration: BoxDecoration(
                                                      color: AppColor_Blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
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
                                                    if (snapshot.data[index]
                                                            .reveersetype ==
                                                        'Full Reverse') {
                                                      await FirebaseFirestore.instance
                                                          .collection(
                                                              'DepositReverse')
                                                          .doc(snapshot
                                                              .data[index].id)
                                                          .update({
                                                        "Status": true,
                                                        "Approve": true,
                                                        'Approve Date':
                                                            DateTime.now(),
                                                      }).then((value) async {
                                                       await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'Member')
                                                            .doc(snapshot
                                                                .data[index]
                                                                .memberid)
                                                            .update({
                                                          'Own deposit Amount':
                                                              FieldValue.increment(
                                                                  -snapshot
                                                                      .data[
                                                                          index]
                                                                      .mainamount),
                                                          'Deposits': FieldValue
                                                              .arrayRemove([
                                                            {
                                                              'date': snapshot.data[index].date.toLocal().toString().split(' ')[0],
                                                              'value': snapshot
                                                                  .data[index]
                                                                  .mainamount,
                                                            }
                                                          ]),
                                                        }).then((value) {
                                                          setState(() {});
                                                        });
                                                      });
                                                    } else {
                                                      DocumentSnapshot memberSnapshot = await FirebaseFirestore.instance
                                                          .collection('Member')
                                                          .doc(snapshot
                                                          .data[index]
                                                          .memberid)
                                                          .get();

                                                      List<Map<String, dynamic>> deposits = memberSnapshot['Deposits'];
                                                      int depositIndex = deposits.indexWhere(
                                                            (entry) => entry['date'] == snapshot.data[index].date.toLocal().toString().split(' ')[0],
                                                      );

                                                      if (depositIndex != -1) {
                                                        deposits[depositIndex]['value'] = snapshot.data[index].amount;
                                                        await FirebaseFirestore.instance
                                                            .collection('Member')
                                                            .doc(snapshot
                                                            .data[index]
                                                            .memberid)
                                                            .update({
                                                          'Own deposit Amount': FieldValue.increment(snapshot.data[index].amount),
                                                          'Deposits': deposits,
                                                        }).then((value){
                                                          setState(() {});
                                                        });
                                                      }
                                                    }
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
                                                            'LoanRepayment')
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
