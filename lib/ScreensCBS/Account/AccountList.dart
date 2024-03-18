import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/member.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../../Model/account.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../../helpers/auth_service.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';

class AccountList extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  AccountList({required this.appbool, required this.navbool});

  @override
  State<AccountList> createState() => _AccountListState();
}

class _AccountListState extends State<AccountList> {
  @override
  Widget build(BuildContext context) {
    List<bool> status = [];
    List<bool> approve = [];
    Future<List<Accountss>> getCust() async {
      List<Accountss> somitee = [];
      status = [];
      approve = [];
      int s = 1;
      await FirebaseFirestore.instance
          .collection('Account')
          .get()
          .then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          somitee.add(Accountss(
              introducertype: element["Introducer Type"],
              member: element["Member"],
              introducerno: element["Introducer No"],
              nomineename: element["Nominee Name"],
              nomineepercentage: element["Nominee Percentage"],
              accounttype: element["Account Type"],
              nomineeimage: element["Nominee Image"],
              relation: element["Relation"],
              introducername: element["Introducer Name"],
              requestdate: element["Request Date"].toDate(),
              requestedby: element["Requested By"],
              approvedby: element["Approve By"],
              sector: element["Sector"],
              documenttype: element["Document Type"],
              fathername: element["Father Name"],
              documentno: element["Document No"],
              docmentfront: element["Document Front"],
              documentback: element["Document Back"],
              dateofbirth: element["Date Of Birth"].toDate(),
              mothername: element["Mother Name"],
              id: element.id,
              approvedate: element["Approve Date"].toDate(),
              status: element["Status"],
              approve: element["Approve"],
              sl: s));
          status.add(element['Status']);
          approve.add(element['Approve']);
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
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: 1450,
                    // color: Colors.white,

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
                          width: 1450,
                          height: 40,
                          color: navbarColor,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text(
                                  "Accounts Report",
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
                          padding: const EdgeInsets.all(5),
                          child: FutureBuilder(
                            builder: (ctx, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasError) {
                                  print(snapshot.error);
                                  return const Center(
                                    child: Text("No Accounts Data Available.."),
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
                                            'Account Number',
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
                                          label: Text('Account Type',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              )),
                                        ),
                                        DataColumn(
                                          label: Text('Nominee Name',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              )),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Nominee Percentage',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                            label: Text(
                                          'Introducer Name',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        )),
                                        DataColumn(
                                          label: Text('Status',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              )),
                                        ),
                                        DataColumn(
                                          label: Text('Action',
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
                                            DataCell(
                                                Text((index + 1).toString(),
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                    ))),
                                            DataCell(
                                              Text(
                                                  snapshot.data[index]
                                                      .id,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(
                                              Text(snapshot.data[index].member['ID']+ " - "+snapshot.data[index].member['First Name'] +' '+snapshot.data[index].member['Last Name'],
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(
                                              Text(
                                                  snapshot.data[index]
                                                          .accounttype,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(
                                              Text(
                                                  snapshot.data[index].nomineename,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(Text(
                                                snapshot.data[index].nomineepercentage,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ))),
                                            DataCell(
                                              Text(
                                                  snapshot
                                                      .data[index].introducername,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(
                                              Text(
                                                  snapshot.data[index].status
                                                      ? snapshot.data[index]
                                                              .approve
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
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'Account')
                                                              .doc(snapshot
                                                                  .data[index]
                                                                  .id)
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
                                                                EdgeInsets.all(
                                                                    4.0),
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
                                                              color:
                                                                  AppColor_White,
                                                            )),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'Account')
                                                              .doc(snapshot
                                                                  .data[index]
                                                                  .id)
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
                                                                EdgeInsets.all(
                                                                    4.0),
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
                                                              color:
                                                                  AppColor_White,
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
                  SizedBox(
                    height: 30,
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
