import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/member.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../../Model/depositRequest.dart';
import '../../Model/depositReverse.dart';
import '../../Model/loanRepayment.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

class DepositCollectionRequestList extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DepositCollectionRequestList({required this.appbool, required this.navbool});

  @override
  State<DepositCollectionRequestList> createState() =>
      _DepositCollectionRequestListState();
}

class _DepositCollectionRequestListState
    extends State<DepositCollectionRequestList> {
  @override
  Widget build(BuildContext context) {
    Future<List<DepositRequest>> getCust() async {
      List<DepositRequest> somitee = [];
      int s = 1;
      await FirebaseFirestore.instance
          .collection('DepositRequest')
          .orderBy('Date', descending: true)
          .get()
          .then((querySnapshot) {
        for (var json in querySnapshot.docs) {
          somitee.add(DepositRequest(
            date: json['Date'].toDate(),
            value: json['Value'],
            remarks: json['Remarks'],
            id: json.id,
            memberid: json['Member ID'],
            membername: json['Member Name'],
            user: json['User'],
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
                            "All Deposit Request List",
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
                              child:
                                  Text("No Deposit Request List Available.."),
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
                                    label: Text('Manager Name',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    numeric: true,
                                    label: Text('Amount',
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
                                                  .format(
                                                      snapshot.data[index].date)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                      ),
                                      DataCell(Text(
                                          snapshot.data[index].user.toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                          ))),
                                      DataCell(
                                        Text(
                                            snapshot.data[index].value
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
                                      DataCell(Row(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              FirebaseFirestore.instance
                                                  .collection('Member')
                                                  .doc(snapshot
                                                      .data[index].memberid)
                                                  .update({
                                                'Own deposit Amount':
                                                    FieldValue.increment(
                                                        snapshot
                                                            .data[index].value),
                                                'Deposits':
                                                    FieldValue.arrayUnion([
                                                  {
                                                    'date': snapshot
                                                        .data[index].date
                                                        .toString()
                                                        .split(' ')[0],
                                                    'remarks': snapshot
                                                        .data[index].remarks,
                                                    'value': snapshot
                                                        .data[index].value,
                                                  }
                                                ]),
                                              }).then((value) async {
                                                await  FirebaseFirestore.instance
                                                    .collection(
                                                    'BalanceAccount')
                                                    .doc('0')
                                                    .update({
                                                  'Balance': FieldValue.increment((snapshot.data[index].value)),
                                                });
                                                FirebaseFirestore.instance
                                                    .collection(
                                                        'DepositRequest')
                                                    .doc(
                                                        snapshot.data[index].id)
                                                    .delete()
                                                    .then((value) {
                                                  setState(() {});
                                                });
                                              });
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(4.0),
                                                decoration: BoxDecoration(
                                                    color: AppColor_Blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
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
                                                  .collection('DepositRequest')
                                                  .doc(snapshot.data[index].id)
                                                  .delete()
                                                  .then((value) {
                                                setState(() {});
                                              });
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(4.0),
                                                decoration: BoxDecoration(
                                                    color: AppColor_Blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
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
