import 'dart:math';

import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/DepositWithDwar.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/Image.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/LinkACinfo.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/MemberDepositWithdearRequest.dart';
import '../../Constants/values.dart';
import '../../Model/account.dart';
import '../../Model/loanSanction.dart';
import '../../Model/member.dart';
import '../../Model/somitee.dart';
import '../../route.dart';
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
  var selectedtype = 0;
  var selectedsomiti;
  var sselectedsomiti;
  List<Accountss> accounts = [];
  var selectedaccount;
  bool memberselection = false;
  var selectedmemberss;
  var sselectedmemberss;
  bool bsanction = false;
  bool mmems = false;
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
    int s = 0;
    await FirebaseFirestore.instance
        .collection('Account')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        accounts.add(Accountss(
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
        s++;
      }
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
            setState(() {});
          }
        }
      }
    }

    void _save() async {
      const _chars = '1234567890';
      Random _rnd = Random();
      String getRandomString(int length) =>
          String.fromCharCodes(Iterable.generate(
              length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
      String widthdrawid = getRandomString(8);
      if (selectedsomiti == null ||
          selectedmemberss == null ||
          conwithdrawamount.text == "") {
        Get.snackbar(
            "Withdraw Request Failed.", "Some Required Fields are Empty",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red,
            margin: EdgeInsets.zero,
            duration: const Duration(milliseconds: 2000),
            boxShadows: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
            ],
            borderRadius: 0);
      } else {
        FirebaseFirestore.instance
            .collection('DepositWithdraw')
            .doc(widthdrawid)
            .set({
          'Somitee Name': selectedsomiti.name,
          'Somitee ID': selectedsomiti.id,
          'Member Name':
              selectedmemberss.firstname + " " + selectedmemberss.lastname,
          'Member ID': selectedmemberss.id,
          'Member Phone': selectedmemberss.mobilenno,
          "Withdraw Amount": double.parse(conwithdrawamount.text),
          "Withdraw Type":
              selectedtype == 0 ? "Full Withdraw" : "Partial Withdraw",
          "Remarks": conremarks.text,
          'Approve Date': DateTime.now(),
          'Request Date': DateTime.now(),
          "Status": false,
          'Approve': false,
          'ID': widthdrawid,
        }).then((value) async {
          Get.offNamed(withdrawlistPageRoute);
          Get.snackbar("Withdraw Request Added Successfully.",
              "Redirecting to Withdraw List Page.",
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              backgroundColor: Colors.green,
              margin: EdgeInsets.zero,
              duration: const Duration(milliseconds: 2000),
              boxShadows: [
                const BoxShadow(
                    color: Colors.grey,
                    offset: Offset(-100, 0),
                    blurRadius: 20),
              ],
              borderRadius: 0);
        }).catchError((error) => print("Failed to add user: $error"));
      }
    }

    Future<void> _setupsomiti(int ins) async {
      selectedsomiti = somitee[ins];
      memberselection = true;
      _getData();
    }

    void changetype(int val) {
      setState(() {
        selectedtype = val;
      });
    }
    Future<void> _setupaccount(int ins) async {
      setState(() {
        selectedaccount = accounts[ins];
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
              margin:
                  EdgeInsets.only(top: 100, left: selectedtype == 1 ? 68 : 0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),

                  // Member Deposit Withdraw Request
                  MemberDepositWithdwar(
                    submit: true,
                    changetype: changetype,
                    onsubmit: _save,
                    selectmember: false,
                    selectedtype: selectedtype,
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
                      onsubmit: (){},
                      onclear: (){},
                      somitee: somitee,
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
                  selectedtype == 0
                      ? Padding(
                          padding: EdgeInsets.only(left: ScreenWidth / 21.94),
                          child: desktop
                              ? Row(
                                  children: [
                                    LinkACinfo(
                                        memberss: selectedmemberss,
                                        accounts: accounts,
                                        selectedaccount: selectedaccount,setupaccount: _setupaccount,
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
                                        accounts: accounts,setupaccount: _setupaccount,
                                        selectedaccount: selectedaccount,
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
                        )
                      : SizedBox(),

                  selectedtype == 0
                      ? SizedBox(
                          height: 50,
                        )
                      : SizedBox(),
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
