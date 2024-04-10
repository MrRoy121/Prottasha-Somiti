import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Constants/Constants.dart';
import '../../Model/member.dart';
import '../../Model/somitee.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/NoDataFound.dart';
import '../Widget/SamiteeSelection.dart';

class DeadMemberInfo extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DeadMemberInfo({required this.appbool, required this.navbool});

  @override
  State<DeadMemberInfo> createState() => _DeadMemberInfoState();
}

class _DeadMemberInfoState extends State<DeadMemberInfo> {
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
          if (selectedsomiti.id == element["Somitee ID"] && element["Dead"]) {
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
                    width: 1400,
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
                          width: 1400,
                          height: 40,
                          color: navbarColor,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text(
                                  "Dead Member Report",
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              DataColumn(
                                                label: Text('Date Of Birth',
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
                                            ],
                                            rows: List.generate(
                                                snapshot.data.length, (index) {
                                              return DataRow(
                                                cells: [
                                                  DataCell(Text(
                                                      (index + 1).toString(),
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ))),
                                                  DataCell(
                                                    Text(
                                                        snapshot.data[index].id,
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
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                        )),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                        snapshot.data[index]
                                                            .fathername,
                                                        style: const TextStyle(
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
