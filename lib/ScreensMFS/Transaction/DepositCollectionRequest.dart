import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
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

class DepositCollectionRequest extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DepositCollectionRequest({required this.appbool, required this.navbool});

  @override
  State<DepositCollectionRequest> createState() =>
      _DepositCollectionRequestState();
}

class _DepositCollectionRequestState extends State<DepositCollectionRequest> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  List<TextEditingController> memberamount = [];
  List<Memberss> somiteemembers = [];
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
    Future<void> _getData() async {
      somiteemembers = [];
      memberamount = [];
      int s = 1;
      try {
        QuerySnapshot querySnapshot =
            await FirebaseFirestore.instance.collection('Member').get();
        for (var element in querySnapshot.docs) {
          if (selectedsomiti.id == element["Somitee ID"] && element["Status"]) {
            if (element["Deposits"].toString() != 'null') {
              var deposits = element["Deposits"];
              if (deposits.isNotEmpty) {
                var today = DateTime.now().toLocal();
                var todaysDeposit = deposits.firstWhere(
                  (entry) {
                    var entryDate = DateTime.parse(entry["date"]).toLocal();
                    return entryDate.year == today.year &&
                        entryDate.month == today.month &&
                        entryDate.day == today.day;
                  },
                  orElse: () => null,
                );
                if (todaysDeposit != null) {
                  memberamount.add(TextEditingController(
                      text: todaysDeposit["value"].toString()));
                } else {
                  memberamount.add(TextEditingController(text: '0'));
                }
              } else {
                memberamount.add(TextEditingController(text: '0'));
              }
              somiteemembers.add(Memberss.withDepo(
                  somiteename: element["Somitee Name"],
                  somiteeid: element["Somitee ID"],
                  membertype: element["Member Type"],
                  deposit: deposits,
                  withdraw: [],
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
                  nodepenndent: element["No of Dependent"],
                  education: element["Education"],
                  maritalstatus: element["Marital Status"],
                  mobilenotype: element["Mobile No Type"],
                  mobilenno: element["Mobile No"],
                  presentadd: element["Present Address"],
                  parmaadd: element["Parmanent Address"],
                  livingperiod: element["Living Period"],
                  nomaleearner: element["No Female Earner"],
                  nofemaleearner: element["No Male Earner"],
                  id: element.id,
                  headfamily: element["Head Family"],
                  ownhomestead: element["Own HomeStead"],
                  relationwithhead: element["Relation With Head"],
                  landdesc: element["Land Desc"],
                  housedesc: element["House Desc"],
                  remarks: element["Remarks"],
                  imageurl: element["ImageURL"],
                  img: element["Image"],
                  birthdate: element["Date Of Birth"].toDate(),
                  sl: s));
              s++;
              setState(() {});
            } else {
              memberamount.add(TextEditingController(text: '0'));
              somiteemembers.add(Memberss.withDepo(
                  somiteename: element["Somitee Name"],
                  somiteeid: element["Somitee ID"],
                  membertype: element["Member Type"],
                  deposit: [],
                  withdraw: [],
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
                  nodepenndent: element["No of Dependent"],
                  education: element["Education"],
                  maritalstatus: element["Marital Status"],
                  mobilenotype: element["Mobile No Type"],
                  mobilenno: element["Mobile No"],
                  presentadd: element["Present Address"],
                  parmaadd: element["Parmanent Address"],
                  livingperiod: element["Living Period"],
                  nomaleearner: element["No Female Earner"],
                  nofemaleearner: element["No Male Earner"],
                  id: element.id,
                  headfamily: element["Head Family"],
                  ownhomestead: element["Own HomeStead"],
                  relationwithhead: element["Relation With Head"],
                  landdesc: element["Land Desc"],
                  housedesc: element["House Desc"],
                  remarks: element["Remarks"],
                  imageurl: element["ImageURL"],
                  img: element["Image"],
                  birthdate: element["Date Of Birth"].toDate(),
                  sl: s));
              s++;
              setState(() {});
            }
          } else {
            setState(() {});
          }
        }
      } catch (e) {
        print("Error fetching data from Firestore: $e");
      }
    }

    void _save() async {
      for (int i = 0; i < somiteemembers.length; i++) {
        DateTime todayDateTime = DateTime.now().toLocal();

        var existingDeposit = somiteemembers[i].deposit.firstWhere(
              (entry) {
            DateTime entryDate = DateTime.parse(entry["date"]).toLocal();
            return entryDate.year == todayDateTime.year &&
                entryDate.month == todayDateTime.month &&
                entryDate.day == todayDateTime.day;
          },
          orElse: () => null,
        );

        if (existingDeposit != null) {
          FirebaseFirestore.instance
              .collection('Member')
              .doc(somiteemembers[i].id)
              .update({
            'Own deposit Amount': FieldValue.increment(
              -existingDeposit["value"],
            ),
            'Deposits': FieldValue.arrayRemove([existingDeposit]),
          });
        }

        FirebaseFirestore.instance
            .collection('Member')
            .doc(somiteemembers[i].id)
            .update({
          'Own deposit Amount': FieldValue.increment(
            double.parse(memberamount[i].text.toString()),
          ),
          'Deposits': FieldValue.arrayUnion([
            {
              'date': todayDateTime.toString().split(' ')[0],
              'value': double.parse(memberamount[i].text.toString()),
            }
          ]),
        }).then((value) async {
          _getData();
        }).catchError((error) => print("Failed to add user: $error"));

        if (i == somiteemembers.length - 1) {
          Get.snackbar(
            "Members Deposits Added Successfully.",
            "Page is updated.",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.green,
            margin: EdgeInsets.zero,
            duration: const Duration(milliseconds: 2000),
            boxShadows: [
              const BoxShadow(
                color: Colors.grey,
                offset: Offset(-100, 0),
                blurRadius: 20,
              ),
            ],
            borderRadius: 0,
          );
        }
      }
    }

    Future<void> _setupsomiti(int ins) async {
      selectedsomiti = somitee[ins];
      _getData();
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
              child: Column(
                children: [
                  SamiteeSelection(
                      submit: true,
                      selectmember: false,
                      clear: true,
                      ssomitee: ssomitee,
                      close: true,
                      setupsomiti: _setupsomiti,
                      active: true,
                      selectedsomiteeid: selectedsomiti,
                      onsubmit: _save,
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
                                  "Member List For Deposit Posting",
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
                                : MediaQuery.removePadding(
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
                                          label: Text('Ledger Name',
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
                                            'Current Balance',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                            label: Center(
                                          child: Text(
                                            'Amount',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                                        DataColumn(
                                          label: Text('Remarks',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              )),
                                        ),
                                        DataColumn(
                                          label: Text('Last Deposit Date',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              )),
                                        ),
                                        DataColumn(
                                          label: Text('Last Deposit Amount',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ],
                                      rows: List.generate(somiteemembers.length,
                                          (index) {
                                        return DataRow(
                                          cells: [
                                            DataCell(
                                                Text((index + 1).toString(),
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                    ))),
                                            DataCell(
                                              Text(somiteemembers[index].id,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(Text(
                                                somiteemembers[index]
                                                        .firstname +
                                                    " " +
                                                    somiteemembers[index]
                                                        .lastname,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ))),
                                            DataCell(
                                              Text(
                                                  somiteemembers[index]
                                                      .mobilenno,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(
                                              Text(
                                                  somiteemembers[index]
                                                      .owndepositamount
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 6, horizontal: 0),
                                                width: 100,
                                                child: TextField(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        if (val.isEmpty) {
                                                          memberamount[index]
                                                              .text = '0';
                                                        }
                                                      });
                                                    },
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .allow(
                                                              RegExp(r'[0-9]')),
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    controller:
                                                        memberamount[index],
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      isDense: true,
                                                      fillColor:
                                                          AppColor.withOpacity(
                                                              0.2),
                                                      border:
                                                          const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                AppColor_greyBorder),
                                                      ),
                                                    ),
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                    )),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                  somiteemembers[index]
                                                              .deposit
                                                              .length ==
                                                          0
                                                      ? ""
                                                      : "Deposit Collection",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            DataCell(
                                              Center(
                                                child: Text(
                                                somiteemembers[index]
                                                    .deposit
                                                .length ==
                                            0
                                            ? "N\\A"
                                                :
                                                    somiteemembers[index]
                                                        .getLastDepositInfo(
                                                            true),
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                    )),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                  somiteemembers[index]
                                                      .getLastDepositInfo(
                                                          false),
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ),
                                          ],
                                        );
                                      }),
                                    ),
                                  )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
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
