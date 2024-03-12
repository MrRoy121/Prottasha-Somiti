import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/loanSanction.dart';
import '../../Model/loanDisbursement.dart';
import '../../helpers/auth_service.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';

class BOTransactionList extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;
  BOTransactionList({required this.appbool, required this.navbool});

  @override
  State<BOTransactionList> createState() => _BOTransactionListState();
}

class _BOTransactionListState extends State<BOTransactionList> {
  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> getCust() async {
      List<Map<String, dynamic>> boTransactions = [];
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('BO Transaction').get();
      int s = 0;
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;
          data['id'] = documentSnapshot.id;
          boTransactions.add(data);
          s++;
        }
      }
      return boTransactions;
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
                            "All BO Transaction List",
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
                                      'Transaction Type',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Transaction Nature',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Debit Account No',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text('Credit Account No',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Amount',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Date',
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
                                  return DataRow(
                                    cells: [
                                      DataCell(Text((index + 1).toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ))),
                                      DataCell(
                                        Text(snapshot.data[index]['Type'],
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                        Text(snapshot.data[index]['Nature'],
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(Text(
                                          snapshot.data[index]
                                                  ['Debit Account ID'] +
                                              ' ' +
                                              snapshot.data[index]
                                                  ['Debit Account'],
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ))),
                                      DataCell(
                                        Text(
                                            snapshot.data[index]
                                                    ['Credit Account ID'] +
                                                ' ' +
                                                snapshot.data[index]
                                                    ['Credit Account'],
                                            style: const TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                        Text(
                                            snapshot.data[index]['Amount']
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
                                                      .data[index]['Request Date'].toDate())
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                            snapshot.data[index]['Status']
                                                ? snapshot.data[index]['Approve']
                                                    ? "Approved"
                                                    : "Rejected"
                                                : "Requested",
                                            style: const TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(snapshot.data[index]['Status']
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
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            'BO Transaction')
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
                                                            'BO Transaction')
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
            NavbarScreenCBS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
          ],
        ),
      ),
    );
  }
}
