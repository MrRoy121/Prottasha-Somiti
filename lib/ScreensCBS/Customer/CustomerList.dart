import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/member.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';

class CustomerList extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  CustomerList({required this.appbool, required this.navbool});

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  List<String> ccode = [];
  @override
  Widget build(BuildContext context) {
    List<bool> status = [];
    List<bool> approve = [];
    Future<List<Memberss>> getCust() async {
      List<Memberss> somitee = [];
      status = [];
      approve = [];
      ccode = [];
      int s = 1;
      await FirebaseFirestore.instance
          .collection('Customer')
          .get()
          .then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          somitee.add(Memberss(
              somiteename: element['Member']["Somitee Name"],
              somiteeid: element['Member']["Somitee ID"],
              membertype: element['Member']["Member Type"],
              occupation: element['Member']["Occupation"],
              firstname: element['Member']["First Name"],
              lastname: element['Member']["Last Name"],
              dead: element['Member']['Dead'],
              fathername: element['Member']["Father Name"],
              mothername: element['Member']["Mother Name"],
              loanpendingamount: element['Member']["Loan Pending Amount"],
              owndepositamount: element['Member']["Own deposit Amount"],
              gender: element['Member']["Gender"],
              religion: element['Member']["Religion"],
              sts: element['Member']["Status"],
              nationalid: element['Member']["National ID"],
              birthregi: element['Member']["Birth Registration"],
              annualincome: element['Member']["Annual Income"],
              age: element['Member']["Age"],
              education: element['Member']["Education"],
              maritalstatus: element['Member']["Marital Status"],
              mobilenotype: element['Member']["Mobile No Type"],
              mobilenno: element['Member']["Mobile No"],
              presentadd: element['Member']["Present Address"],
              parmaadd: element['Member']["Permanent Address"],
              livingperiod: element['Member']["Living Period"],
              nomaleearner: element['Member']["No Female Earner"],
              nofemaleearner: element['Member']["No Male Earner"],
              id: element.id,
              headfamily: element['Member']["Head Family"],
              ownhomestead: element['Member']["Own HomeStead"],
              relationwithhead: element['Member']["Relation With Head"],
              landdesc: element['Member']["Land Desc"],
              remarks: element['Member']["Remarks"],
              imageurl: element['Member']["ImageURL"],
              img: element['Member']["Image"],
              birthdate: element['Member']["Date Of Birth"].toDate(),
              sl: s));
          status.add(element['Status']);
          approve.add(element['Approve']);
          s++;
          ccode.add(element.id);
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
                                  "Customers Report",
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
                                    child: Text("No Customer Data Available.."),
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
                                            'Customer Code',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text('Member Code',
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
                                            'Member Type',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                            label: Text(
                                          'National ID',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        )),
                                        DataColumn(
                                          label: Text('Father Name',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              )),
                                        ),
                                        DataColumn(
                                          label: Text('Present Address',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              )),
                                        ),
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
                                              Text(ccode[index],
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(Text(snapshot.data[index].id+" "+
                                                snapshot.data[index].firstname +
                                                    " " +
                                                    snapshot
                                                        .data[index].lastname,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ))),
                                            DataCell(
                                              Text(
                                                  snapshot
                                                      .data[index].mobilenno,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(
                                              Text(
                                                  snapshot
                                                      .data[index].membertype,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(
                                              Text(
                                                  snapshot
                                                      .data[index].nationalid,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(
                                              Text(
                                                  snapshot
                                                      .data[index].fathername,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(
                                              Text(
                                                  snapshot
                                                      .data[index].presentadd,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(
                                              Text(
                                                  status[index]
                                                      ? approve[index]
                                                          ? "Approved"
                                                          : "Rejected"
                                                      : "Requested",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(status[index]
                                                ? SizedBox()
                                                : Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'Customer')
                                                              .doc(snapshot
                                                                  .data[index]
                                                                  .id)
                                                              .update({
                                                            "Status": true,
                                                            "Approve": true,
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
                                                                  'Customer')
                                                              .doc(snapshot
                                                                  .data[index]
                                                                  .id)
                                                              .update({
                                                            "Status": true,
                                                            "Approve": false,
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
