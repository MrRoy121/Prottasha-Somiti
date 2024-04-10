import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/member.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

class ClosedMembersList extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  ClosedMembersList({required this.appbool, required this.navbool});

  @override
  State<ClosedMembersList> createState() => _ClosedMembersListState();
}

class _ClosedMembersListState extends State<ClosedMembersList> {
  List<String> sss = [];

  @override
  Widget build(BuildContext context) {
    Future<List<Memberss>> getCust() async {
      List<Memberss> somitee = [];
      int s = 0;
      await FirebaseFirestore.instance
          .collection('ClosedMemberRequest')
          .get()
          .then((qs) async {
        for (var ele in qs.docs) {
          await FirebaseFirestore.instance
              .collection('Member')
              .doc(ele.id)
              .get()
              .then((element) {
            somitee.add(Memberss(
                somiteename: element["Somitee Name"],
                somiteeid: element["Somitee ID"],
                membertype: element["Member Type"],
                occupation: element["Occupation"],
                firstname: element["First Name"],
                lastname: element["Last Name"],
                dead: element['Dead'],
                fathername: element["Father Name"],
                mothername: element["Mother Name"],
                loanpendingamount: element["Loan Pending Amount"],
                owndepositamount: element["Own deposit Amount"],
                gender: element["Gender"],
                religion: element["Religion"],
                sts: element["Status"],
                nationalid: element["National ID"],
                birthregi: element["Birth Registration"],
                annualincome: element["Annual Income"],
                age: element["Age"],
                education: element["Education"],
                maritalstatus: element["Marital Status"],
                mobilenotype: element["Mobile No Type"],
                mobilenno: element["Mobile No"],
                presentadd: element["Present Address"],
                parmaadd: element["Permanent Address"],
                livingperiod: element["Living Period"],
                nomaleearner: element["No Female Earner"],
                nofemaleearner: element["No Male Earner"],
                id: element.id,
                headfamily: element["Head Family"],
                ownhomestead: element["Own HomeStead"],
                relationwithhead: element["Relation With Head"],
                landdesc: element["Land Desc"],
                
                remarks: element["Remarks"],
                imageurl: element["ImageURL"],
                img: element["Image"],
                birthdate: element["Date Of Birth"].toDate(),
                sl: s));
            s++;
          });
          sss.add(ele['Type']);
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
              margin: EdgeInsets.only(top: 100, left: 50),
              child: Container(
                // color: Colors.white,

                margin: EdgeInsets.symmetric(horizontal: 20),
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
                      height: 40,
                      color: navbarColor,
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Closing Member Request",
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
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text("No Member Data Available.."),
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
                                      label: Text('Member Name',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Somitee Code',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Somitee Name',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Member Type',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text('Father Name',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Loan Pending Amount',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Own Deposit',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Type',
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
                                          Text(snapshot.data[index].id,
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                        DataCell(Text(
                                            snapshot.data[index].firstname +
                                                " " +
                                                snapshot.data[index].lastname,
                                            style: TextStyle(
                                              fontSize: 12,
                                            ))),
                                        DataCell(
                                          Text(snapshot.data[index].somiteeid,
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                        DataCell(
                                          Text(snapshot.data[index].somiteename,
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                        DataCell(
                                          Text(snapshot.data[index].membertype,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                        DataCell(
                                          Text(snapshot.data[index].fathername,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                        DataCell(
                                          Text(
                                              snapshot
                                                  .data[index].loanpendingamount
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                        DataCell(
                                          Text(
                                              snapshot
                                                  .data[index].owndepositamount
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                        DataCell(
                                          Text(sss[index],
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                        ),
                                        DataCell(Row(
                                          children: [
                                            Center(
                                              child: InkWell(
                                                onTap: () {
                                                  FirebaseFirestore.instance
                                                      .collection('Member')
                                                      .doc(snapshot
                                                          .data[index].id)
                                                      .update(
                                                          {'Status': false});
                                                  FirebaseFirestore.instance
                                                      .collection('Somitee')
                                                      .doc(snapshot.data[index]
                                                          .somiteeid)
                                                      .get()
                                                      .then((value) {
                                                    FirebaseFirestore.instance
                                                        .collection('Somitee')
                                                        .doc(snapshot
                                                            .data[index]
                                                            .somiteeid)
                                                        .update({
                                                      'Closed':
                                                          value['Closed'] + 1,
                                                    });
                                                  });
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                          'ClosedMemberRequest')
                                                      .doc(snapshot
                                                          .data[index].id)
                                                      .delete();
                                                  Get.snackbar(
                                                      "Member Closed Successfully.",
                                                      "Redirecting to Member Closing List Page.",
                                                      snackPosition:
                                                          SnackPosition.BOTTOM,
                                                      colorText: Colors.white,
                                                      backgroundColor:
                                                          Colors.green,
                                                      margin: EdgeInsets.zero,
                                                      duration: const Duration(
                                                          milliseconds: 2000),
                                                      boxShadows: [
                                                        const BoxShadow(
                                                            color: Colors.grey,
                                                            offset:
                                                                Offset(-100, 0),
                                                            blurRadius: 20),
                                                      ],
                                                      borderRadius: 0);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    decoration: BoxDecoration(
                                                        color: AppColor_Blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100)),
                                                    child: const Icon(
                                                      Icons.check,
                                                      size: 16,
                                                      color: AppColor_White,
                                                    )),
                                              ),
                                            ),
                                            Center(
                                              child: InkWell(
                                                onTap: () {
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                          'ClosedMemberRequest')
                                                      .doc(snapshot
                                                          .data[index].id)
                                                      .delete();
                                                  setState(() {});
                                                },
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    decoration: BoxDecoration(
                                                        color: AppColor_Blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100)),
                                                    child: const Icon(
                                                      Icons.close,
                                                      size: 16,
                                                      color: AppColor_White,
                                                    )),
                                              ),
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
