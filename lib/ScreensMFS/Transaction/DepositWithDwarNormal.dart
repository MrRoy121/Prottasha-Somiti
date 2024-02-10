import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/DepositWithDwar.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/Image.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/LinkACinfo.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/MemberDepositWithdearRequest.dart';
import '../../Constants/values.dart';
import '../../Model/loanSanction.dart';
import '../../Model/member.dart';
import '../../Model/somitee.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/SamiteeSelection.dart';

class DepositWithDwarNormal extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DepositWithDwarNormal({required this.appbool, required this.navbool});

  @override
  State<DepositWithDwarNormal> createState() => _DepositWithDwarNormalState();
}

class _DepositWithDwarNormalState extends State<DepositWithDwarNormal> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  List<Memberss> somiteemembers = [];
  var selectedtype=0;
  var selectedsomiti;
  var sselectedsomiti;
  bool memberselection = false;
  var selectedmemberss;
  var sselectedmemberss;
  bool bsanction = false;
  var selectedsanction;
  var ssscheme;
  var conwithdrawamount = TextEditingController();
  var conremarks = TextEditingController(text: 'Member Deposit Withdraw');

  @override
  void initState() {
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
    Future<void> _setupmemberss(int ins) async {
      selectedmemberss = somiteemembers[ins];
      await FirebaseFirestore.instance
          .collection('LoanDisbursed')
          .get()
          .then((querySnapshot) {
        for (var json in querySnapshot.docs) {
          if (json["Member ID"] == selectedmemberss.id) {
            selectedsanction = loanSanction.fromJson(json['Sanction']);
            bsanction = true;
            ssscheme = LoanSchemes.firstWhere(
                (element) => element.name == json['Sanction']["Loan Scheme"]);
            setState(() {});
          }
        }
      });
    }

    Future<void> _getData() async {
      somiteemembers = [];
      int s = 1;
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Member').get();
      for (var element in querySnapshot.docs) {
        if (selectedsomiti.id == element["Somitee ID"] && element["Status"]) {
          if (element["Deposits"].toString() != 'null') {
            var deposits = element["Deposits"];
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
        }
      }
    }

    void _save() async {
      // for (int i = 0; i < somiteemembers.length; i++) {
      //   DateTime todayDateTime = DateTime.now().toLocal();
      //
      //   var existingDeposit = somiteemembers[i].deposit.firstWhere(
      //         (entry) {
      //       DateTime entryDate = DateTime.parse(entry["date"]).toLocal();
      //       return entryDate.year == todayDateTime.year &&
      //           entryDate.month == todayDateTime.month &&
      //           entryDate.day == todayDateTime.day;
      //     },
      //     orElse: () => null,
      //   );
      //
      //   if (existingDeposit != null) {
      //     FirebaseFirestore.instance
      //         .collection('Member')
      //         .doc(somiteemembers[i].id)
      //         .update({
      //       'Own deposit Amount': FieldValue.increment(
      //         -existingDeposit["value"],
      //       ),
      //       'Deposits': FieldValue.arrayRemove([existingDeposit]),
      //     });
      //   }
      //
      //   FirebaseFirestore.instance
      //       .collection('Member')
      //       .doc(somiteemembers[i].id)
      //       .update({
      //     'Own deposit Amount': FieldValue.increment(
      //       double.parse(memberamount[i].text.toString()),
      //     ),
      //     'Deposits': FieldValue.arrayUnion([
      //       {
      //         'date': todayDateTime.toString().split(' ')[0],
      //         'value': double.parse(memberamount[i].text.toString()),
      //       }
      //     ]),
      //   }).then((value) async {
      //     _getData();
      //   }).catchError((error) => print("Failed to add user: $error"));
      //
      //   if (i == somiteemembers.length - 1) {
      //     Get.snackbar(
      //       "Members Deposits Added Successfully.",
      //       "Page is updated.",
      //       snackPosition: SnackPosition.BOTTOM,
      //       colorText: Colors.white,
      //       backgroundColor: Colors.green,
      //       margin: EdgeInsets.zero,
      //       duration: const Duration(milliseconds: 2000),
      //       boxShadows: [
      //         const BoxShadow(
      //           color: Colors.grey,
      //           offset: Offset(-100, 0),
      //           blurRadius: 20,
      //         ),
      //       ],
      //       borderRadius: 0,
      //     );
      //   }
      // }
    }

    Future<void> _setupsomiti(int ins) async {
      selectedsomiti = somitee[ins];
      memberselection = true;
      _getData();
    }

    void changetype(int val){
      setState(() {
        selectedtype = val;
      });
    }

    var ScreenWidth = MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight =
        MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    if (ResponsiveWidth > 1400) {
      desktop = true;
      tablet = false;
      mobile = false;
    } else if (ResponsiveWidth > 540) {
      tablet = true;
      desktop = false;
      mobile = false;
    } else {
      mobile = true;
      desktop = false;
      tablet = false;
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, left:  selectedtype==1?68:0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),

                  // Member Deposit Withdraw Request
                  MemberDepositWithdwar(
                    submit: true,changetype: changetype,
                    selectmember: false,selectedtype: selectedtype,
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  SamiteeSelection(
                      submit: false,
                      selectmember: false,
                      clear: false,
                      ssomitee: ssomitee,
                      close: false,
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

                  // Deposit Withdraw
                  DepositWithDwar(
                    memberss: somiteemembers,
                    conremarks: conremarks,
                    conwithdrawamount: conwithdrawamount,
                    setupmemberss: _setupmemberss,
                    memberssselected: memberselection,
                    selectedmemberssid: sselectedmemberss,
                    selectedmemberss: selectedmemberss,
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  // Link A/c Information
                  selectedtype==0?Padding(
                    padding: EdgeInsets.only(left: ScreenWidth / 21.94),
                    child: desktop
                        ? Row(
                            children: [
                              LinkACinfo(
                                  memberss: selectedmemberss,
                                  selectedsanction: selectedsanction,
                                  bsanction: bsanction,
                                  scheme: ssscheme),
                              Spacer(),
                              selectedmemberss == null
                                  ? ImageMember(imgurl: '')
                                  : ImageMember(
                                      imgurl: selectedmemberss.imageurl),
                            ],
                          )
                        : Column(
                            children: [
                              LinkACinfo(
                                  memberss: selectedmemberss,
                                  selectedsanction: selectedsanction,
                                  bsanction: bsanction,
                                  scheme: ssscheme),

                              // Spacer(),
                              SizedBox(
                                height: 50,
                              ),

                              selectedmemberss == null
                                  ? ImageMember(imgurl: '')
                                  : ImageMember(
                                      imgurl: selectedmemberss.imageurl),
                            ],
                          ),
                  ):SizedBox(),

                  selectedtype==0?SizedBox(
                    height: 50,
                  ):SizedBox(),
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
