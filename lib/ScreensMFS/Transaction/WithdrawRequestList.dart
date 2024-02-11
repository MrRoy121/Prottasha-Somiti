import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/member.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../../Model/depositWithdraw.dart';
import '../../Model/loanRepayment.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

class WidthdrawList extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  WidthdrawList({required this.appbool, required this.navbool});

  @override
  State<WidthdrawList> createState() => _WidthdrawListState();
}

class _WidthdrawListState extends State<WidthdrawList> {
  @override
  Widget build(BuildContext context) {
    Future<List<depositWithdraw>> getCust() async {
      List<depositWithdraw> somitee = [];
      int s = 1;
      await FirebaseFirestore.instance
          .collection('DepositWithdraw')
          .orderBy('Approve Date', descending: true)
          .get()
          .then((querySnapshot) {
        for (var json in querySnapshot.docs) {
          somitee.add(depositWithdraw(
            somiteename: json['Somitee Name'],
            somiteeid: json['Somitee ID'],
            requestdate: json['Request Date'].toDate(),
            withdrawtyp: json['Withdraw Type'],
            membername: json['Member Name'],
            amount: json['Withdraw Amount'],
            approve: json['Approve'],
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
                            "All Deposit Withdraw List",
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
                            print(snapshot.error);
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
                                      'Request Date',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    numeric: true,
                                    label: Text('Withdraw Amount',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Withdraw Type',
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
                                            snapshot.data[index].withdrawtyp
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
                                                  onTap: () {
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            'DepositWithdraw')
                                                        .doc(snapshot
                                                            .data[index].id)
                                                        .update({
                                                      "Status": true,
                                                      "Approve": true,
                                                      'Approve Date':
                                                          DateTime.now(),
                                                    }).then((value) {
                                                      FirebaseFirestore.instance
                                                          .collection('Member')
                                                          .doc(snapshot
                                                              .data[index]
                                                              .memberid)
                                                          .update({
                                                        "Own deposit Amount":
                                                            FieldValue.increment(
                                                                -snapshot
                                                                    .data[index]
                                                                    .amount),
                                                        'Withdraws': FieldValue
                                                            .arrayUnion([
                                                          {
                                                            'date':
                                                                DateTime.now()
                                                                    .toLocal()
                                                                    .toString()
                                                                    .split(
                                                                        ' ')[0],
                                                            'remarks': snapshot
                                                                .data[index]
                                                                .remarks,
                                                            'value': double
                                                                .parse(snapshot
                                                                    .data[index]
                                                                    .amount
                                                                    .toString()),
                                                          }
                                                        ]),
                                                      });
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
                                                            'DepositWithdraw')
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
