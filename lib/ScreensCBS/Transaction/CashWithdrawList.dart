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
import '../../Model/cashWithdrawModel.dart';
import '../../Model/loanDisbursement.dart';
import '../../helpers/auth_service.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../../helpers/auth_service.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';

class CashWithdrawList extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  CashWithdrawList({required this.appbool, required this.navbool});

  @override
  State<CashWithdrawList> createState() => _CashWithdrawListState();
}

class _CashWithdrawListState extends State<CashWithdrawList> {
  @override
  Widget build(BuildContext context) {
    Future<List<CashWithdrawModel>> getCust() async {
      List<CashWithdrawModel> somitee = [];
      int s = 0;
      await FirebaseFirestore.instance
          .collection('Cash Withdraw')
          .get()
          .then((querySnapshot) {
        for (var json in querySnapshot.docs) {
          somitee.add(CashWithdrawModel(
            amountinword: json['Amount In Words'],
            accountno: json['Account No'],
            chequedate: json['Cheque Date'].toDate(),
            chequeno: json['Cheque No'],
            chequeseries: json['Cheque Series'],
            withdrawamount: json["Withdraw Amount"],
            disburse: json['Disbursed Amount'],
            membername: json['Member Name'],
            approvedby: json["Approved By"],
            requestedby: json["Requested By"],
            requestdate: json["Requested Date"].toDate(),
            memberid: json['Member ID'],
            remarks: json["Remarks"],
            approvedate: json["Approve Date"].toDate(),
            status: json["Status"],
            approve: json["Approve"],
            id: json.id,
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
                            "All Cash Withdraw List",
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
                                      'Account No',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Customer Code',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text('Cheque No',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Cheque Series',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Cheque Date',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Disbursed Amount',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Withdraw Amount',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
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
                                      'Remarks',
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
                                        Text(snapshot.data[index].accountno,
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                        Text(
                                            snapshot.data[index].memberid+'-'+snapshot.data[index].membername,
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                          Text(snapshot.data[index].chequeno,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ))),
                                      DataCell(
                                          Text(snapshot.data[index].chequeseries,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ))),
                                      DataCell(
                                          Text(DateFormat.yMMMd()
                                              .format(snapshot
                                              .data[index].chequedate)
                                              .toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                              ))),
                                      DataCell(
                                        Text(snapshot.data[index].disburse.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                        Text(
                                            snapshot.data[index].withdrawamount
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
                                                      .data[index].requestdate)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                            snapshot.data[index].remarks
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
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
