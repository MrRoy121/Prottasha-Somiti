import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/member.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../../helpers/auth_service.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/SamiteeSelection.dart';

class EditMembers extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  EditMembers({required this.appbool, required this.navbool});

  @override
  State<EditMembers> createState() => _EditMembersState();
}

class _EditMembersState extends State<EditMembers> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  var selectedsomiti;
  var sselectedsomiti;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    await FirebaseFirestore.instance
        .collection('Somitee')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        somitee.add(Somitee(
            address: element["Address"],
            id: element.id,
            lastupdated: element["Last Edited"].toDate(),
            closed: element["Closed"],
            name: element["Name"],
            active: element["Active"],
            formation: element["Formation Date"].toDate(),
            phone: element["Phone"],
            branch: element["Branch"],
            sl: 0));
        ssomitee.add(element["Name"]);
      }
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      selectedsomiti = ss;
      sselectedsomiti = ss;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _setupsomiti(int ins) {
      setState(() {
        selectedsomiti = somitee[ins];
      });
    }

    Future<List<Memberss>> getCust() async {
      List<Memberss> somitee = [];
      int s = 1;
      await FirebaseFirestore.instance
          .collection('Member')
          .get()
          .then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          if (selectedsomiti.id == element["Somitee ID"]) {
            somitee.add(Memberss(
                somiteename: element["Somitee Name"] ?? '',
                somiteeid: element["Somitee ID"] ?? '',
                membertype: element["Member Type"] ?? '',
                occupation: element["Occupation"] ?? '',
                firstname: element["First Name"] ?? '',
                lastname: element["Last Name"] ?? '',
                dead: element['Dead'] ?? '',
                fathername: element["Father Name"] ?? '',
                mothername: element["Mother Name"] ?? '',
                loanpendingamount: element["Loan Pending Amount"] ?? '',
                owndepositamount: element["Own deposit Amount"] ?? '',
                gender: element["Gender"] ?? '',
                religion: element["Religion"] ?? '',
                sts: element["Status"] ?? '',
                nationalid: element["National ID"] ?? '',
                birthregi: element["Birth Registration"] ?? '',
                annualincome: element["Annual Income"] ?? '',
                age: element["Age"] ?? '',
                education: element["Education"] ?? '',
                maritalstatus: element["Marital Status"] ?? '',
                mobilenotype: element["Mobile No Type"] ?? '',
                mobilenno: element["Mobile No"] ?? '',
                presentadd: element["Present Address"] ?? '',
                parmaadd: element["Permanent Address"] ?? '',
                livingperiod: element["Living Period"] ?? '',
                nomaleearner: element["No Female Earner"] ?? '',
                nofemaleearner: element["No Male Earner"] ?? '',
                id: element.id,
                headfamily: element["Head Family"] ?? '',
                ownhomestead: element["Own HomeStead"] ?? '',
                relationwithhead: element["Relation With Head"] ?? '',
                landdesc: element["Land Desc"] ?? '',
                remarks: element["Remarks"] ?? '',
                imageurl: element["ImageURL"] ?? '',
                img: element["Image"] ?? '',
                birthdate: element["Date Of Birth"].toDate(),
                sl: s));
            s++;
          }
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
                  SamiteeSelection(
                      submit: false,
                      selectmember: false,
                      clear: true,
                      ssomitee: ssomitee,
                      close: true,
                      setupsomiti: _setupsomiti,
                      active: true,
                      selectedsomiteeid: selectedsomiti,
                      onsubmit: () {},
                      somitee: somitee,
                      onclear: _onclear,
                      selectedsomitee: sselectedsomiti),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 1500,
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
                          width: 1500,
                          height: 40,
                          color: navbarColor,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text(
                                  "Member General Report",
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
                          child: selectedsomiti == null
                              ? Center(
                                  child: Text("No Somitee Is Selected.."),
                                )
                              : FutureBuilder(
                                  builder: (ctx, AsyncSnapshot snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      if (snapshot.hasError) {
                                        print(snapshot.error);
                                        return const Center(
                                          child: Text(
                                              "No Member Data Available.."),
                                        );
                                      } else if (snapshot.hasData) {
                                        return MediaQuery.removePadding(
                                          context: context,
                                          removeTop: true,
                                          child: DataTable(
                                            showCheckboxColumn: false,
                                            border: TableBorder.all(
                                                color: Colors.black26,
                                                width: 1),
                                            headingRowColor:
                                                MaterialStateProperty.all<
                                                    Color>(AppColor_Blue),
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              DataColumn(
                                                label: Text('Mobile No',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Type',
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              DataColumn(
                                                label: Text('DOB',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              DataColumn(
                                                label: Text('Present Address',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              DataColumn(
                                                label: Text('ACTION',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ],
                                            rows: List.generate(
                                                snapshot.data.length, (index) {
                                              if ((AuthService.to.user?.type ==
                                                      "Super Admin") ||
                                                  (AuthService.to.user?.type ==
                                                      "Branch Manager")) {
                                                return DataRow(
                                                  cells: [
                                                    DataCell(Text(
                                                        (index + 1).toString(),
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                        ))),
                                                    DataCell(
                                                      Text(
                                                          snapshot
                                                              .data[index].id,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          )),
                                                    ),
                                                    DataCell(Text(
                                                        snapshot.data[index]
                                                                .firstname +
                                                            " " +
                                                            snapshot.data[index]
                                                                .lastname,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ))),
                                                    DataCell(
                                                      Text(
                                                          snapshot.data[index]
                                                              .mobilenno,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          )),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                          snapshot.data[index]
                                                              .membertype,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          )),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                          snapshot.data[index]
                                                              .nationalid,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 12,
                                                          )),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                          snapshot.data[index]
                                                              .fathername,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 12,
                                                          )),
                                                    ),
                                                    DataCell(
                                                      Center(
                                                        child: Text(
                                                            DateFormat.yMMMd()
                                                                .format(snapshot
                                                                    .data[index]
                                                                    .birthdate)
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                            )),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                          snapshot.data[index]
                                                              .presentadd,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          )),
                                                    ),
                                                    DataCell(
                                                        snapshot.data[index]
                                                                .sts
                                                            ? Row(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Memberss
                                                                            sss =
                                                                            snapshot.data[index];
                                                                        Get.toNamed(
                                                                          memberEditPageRoute,
                                                                          arguments: {
                                                                            'Members':
                                                                                sss.toJson(),
                                                                          },
                                                                        );
                                                                      },
                                                                      child: Container(
                                                                          padding: EdgeInsets.all(4.0),
                                                                          decoration: BoxDecoration(color: AppColor_Blue, borderRadius: BorderRadius.circular(100)),
                                                                          child: const Icon(
                                                                            Icons.edit_outlined,
                                                                            size:
                                                                                16,
                                                                            color:
                                                                                AppColor_White,
                                                                          )),
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Memberss
                                                                            sss =
                                                                            snapshot.data[index];
                                                                        Get.dialog(
                                                                            barrierDismissible: false,
                                                                            Dialog(
                                                                              backgroundColor: Colors.transparent,
                                                                              child: Container(
                                                                                width: 350,
                                                                                padding: EdgeInsets.all(30),
                                                                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Center(
                                                                                      child: Text(
                                                                                        "Confirm ${sss.firstname + " " + sss.lastname}\n as Dead Member ",
                                                                                        textAlign: TextAlign.center,
                                                                                        style: TextStyle(color: Colors.black, fontSize: 18),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 20,
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        InkWell(
                                                                                          onTap: () {
                                                                                            Get.back();
                                                                                          },
                                                                                          child: Center(
                                                                                            child: Container(
                                                                                              height: 40,
                                                                                              width: 80,
                                                                                              alignment: Alignment.center,
                                                                                              decoration: const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                              child: const Text(
                                                                                                "No",
                                                                                                style: TextStyle(color: Colors.white),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        InkWell(
                                                                                          onTap: () async {
                                                                                            await FirebaseFirestore.instance.collection('Member').doc(sss.id).update({'Dead': true}).then((value) {
                                                                                              Get.toNamed(
                                                                                                deadmemberPageRoute,
                                                                                              );
                                                                                            });
                                                                                          },
                                                                                          child: Center(
                                                                                            child: Container(
                                                                                              height: 40,
                                                                                              width: 80,
                                                                                              alignment: Alignment.center,
                                                                                              decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                              child: Text(
                                                                                                "Yes",
                                                                                                style: TextStyle(color: Colors.white),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ));
                                                                      },
                                                                      child: Container(
                                                                          padding: const EdgeInsets.all(4.0),
                                                                          decoration: BoxDecoration(color: AppColor_Blue, borderRadius: BorderRadius.circular(100)),
                                                                          child: const Icon(
                                                                            Icons.warning_amber_outlined,
                                                                            size:
                                                                                16,
                                                                            color:
                                                                                AppColor_White,
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            : Row(
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              'Member')
                                                                          .doc(snapshot
                                                                              .data[index]
                                                                              .id)
                                                                          .update({
                                                                        "Status":
                                                                            true,
                                                                      }).then((value) {
                                                                        setState(
                                                                            () {});
                                                                      });
                                                                    },
                                                                    child: Container(
                                                                        padding: EdgeInsets.all(4.0),
                                                                        decoration: BoxDecoration(color: AppColor_Blue, borderRadius: BorderRadius.circular(100)),
                                                                        child: const Icon(
                                                                          Icons
                                                                              .check,
                                                                          size:
                                                                              16,
                                                                          color:
                                                                              AppColor_White,
                                                                        )),
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              'Member')
                                                                          .doc(snapshot
                                                                              .data[index]
                                                                              .id)
                                                                          .delete()
                                                                          .then((value) {
                                                                        setState(
                                                                            () {});
                                                                      });
                                                                    },
                                                                    child: Container(
                                                                        padding: EdgeInsets.all(4.0),
                                                                        decoration: BoxDecoration(color: AppColor_Blue, borderRadius: BorderRadius.circular(100)),
                                                                        child: const Icon(
                                                                          Icons
                                                                              .close,
                                                                          size:
                                                                              16,
                                                                          color:
                                                                              AppColor_White,
                                                                        )),
                                                                  ),
                                                                ],
                                                              )),
                                                  ],
                                                );
                                              } else {
                                                if (snapshot
                                                    .data[index].sts) {
                                                  return DataRow(
                                                    cells: [
                                                      DataCell(Text(
                                                          (index + 1)
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 12,
                                                          ))),
                                                      DataCell(
                                                        Text(
                                                            snapshot
                                                                .data[index].id,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                            )),
                                                      ),
                                                      DataCell(Text(
                                                          snapshot.data[index]
                                                                  .firstname +
                                                              " " +
                                                              snapshot
                                                                  .data[index]
                                                                  .lastname,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ))),
                                                      DataCell(
                                                        Text(
                                                            snapshot.data[index]
                                                                .mobilenno,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                            )),
                                                      ),
                                                      DataCell(
                                                        Text(
                                                            snapshot.data[index]
                                                                .membertype,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                            )),
                                                      ),
                                                      DataCell(
                                                        Text(
                                                            snapshot.data[index]
                                                                .nationalid,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                            )),
                                                      ),
                                                      DataCell(
                                                        Text(
                                                            snapshot.data[index]
                                                                .fathername,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                            )),
                                                      ),
                                                      DataCell(
                                                        Center(
                                                          child: Text(
                                                              DateFormat.yMMMd()
                                                                  .format(snapshot
                                                                      .data[
                                                                          index]
                                                                      .birthdate)
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              )),
                                                        ),
                                                      ),
                                                      DataCell(
                                                        Text(
                                                            snapshot.data[index]
                                                                .presentadd,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                            )),
                                                      ),
                                                      DataCell(Row(
                                                        children: [
                                                          Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Memberss sss =
                                                                    snapshot.data[
                                                                        index];
                                                                Get.toNamed(
                                                                  memberEditPageRoute,
                                                                  arguments: {
                                                                    'Members': sss
                                                                        .toJson(),
                                                                  },
                                                                );
                                                              },
                                                              child: Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          AppColor_Blue,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100)),
                                                                  child:
                                                                      const Icon(
                                                                    Icons
                                                                        .edit_outlined,
                                                                    size: 16,
                                                                    color:
                                                                        AppColor_White,
                                                                  )),
                                                            ),
                                                          ),
                                                          Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Memberss sss =
                                                                    snapshot.data[
                                                                        index];
                                                                Get.dialog(
                                                                    barrierDismissible:
                                                                        false,
                                                                    Dialog(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            350,
                                                                        padding:
                                                                            EdgeInsets.all(30),
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Center(
                                                                              child: Text(
                                                                                "Confirm ${sss.firstname + " " + sss.lastname}\n as Dead Member ",
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(color: Colors.black, fontSize: 18),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    Get.back();
                                                                                  },
                                                                                  child: Center(
                                                                                    child: Container(
                                                                                      height: 40,
                                                                                      width: 80,
                                                                                      alignment: Alignment.center,
                                                                                      decoration: const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                      child: const Text(
                                                                                        "No",
                                                                                        style: TextStyle(color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    await FirebaseFirestore.instance.collection('Member').doc(sss.id).update({
                                                                                      'Dead': true
                                                                                    }).then((value) {
                                                                                      Get.toNamed(
                                                                                        deadmemberPageRoute,
                                                                                      );
                                                                                    });
                                                                                  },
                                                                                  child: Center(
                                                                                    child: Container(
                                                                                      height: 40,
                                                                                      width: 80,
                                                                                      alignment: Alignment.center,
                                                                                      decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                      child: Text(
                                                                                        "Yes",
                                                                                        style: TextStyle(color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ));
                                                              },
                                                              child: Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          4.0),
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          AppColor_Blue,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100)),
                                                                  child:
                                                                      const Icon(
                                                                    Icons
                                                                        .warning_amber_outlined,
                                                                    size: 16,
                                                                    color:
                                                                        AppColor_White,
                                                                  )),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
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
                                    return const Center(
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
