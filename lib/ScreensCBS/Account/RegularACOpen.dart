import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prottashasomit/Constants/values.dart';
import '../../../../Constants/Constants.dart';
import '../../../../route.dart';
import '../../Model/member.dart';
import '../../Model/somitee.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../Widgets/CustomProgressBar.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import 'RegularDepositAccount.dart';
import 'RegularDepositFinalSubmission.dart';
import 'RegularDepositIntroducer.dart';
import 'RegularDepositKYCprofile.dart';
import 'RegularDepositNominee.dart';
import 'RegularDepositTransactionProfile.dart';

class RegularACOpen extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  RegularACOpen({required this.appbool, required this.navbool});

  @override
  State<RegularACOpen> createState() => _RegularACOpenState();
}

class _RegularACOpenState extends State<RegularACOpen> {
  int index = 0;
  int _selectedValue = 1;
  bool img = false;
  List<Memberss> memberss = [];
  bool mmems = false;
  var selectedmemberss;
  var sselectedmemberss;
  var selectedsamitee;
  var selectedintroducertype;
  var selectedaccountno;
  var selectedsector;
  var nomineename;
  var fathername;
  var mothername;
  var pickedImage;
  var pickeddfImage;
  var pickeddbImage;
  DateTime selectedDate = DateTime.now();
  var documentno;
  var nomineepercentage;
  var selectedrelation;
  var selecteddocumenttype;

  void _save(int indx) {
    index = indx;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {memberss =[];
  await FirebaseFirestore.instance
      .collection('Customer')
      .get()
      .then((querySnapshot) {
    for (var element in querySnapshot.docs) {
     memberss.add(Memberss(
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
          nodepenndent: element['Member']["No of Dependent"],
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
          housedesc: element['Member']["House Desc"],
          remarks: element['Member']["Remarks"],
          imageurl: element['Member']["ImageURL"],
          img: element['Member']["Image"],
          birthdate: element['Member']["Date Of Birth"].toDate(),
          sl: 0));
    }
  });
  }


  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;

    Future<void> _setupmemberss(int ins) async {
      print(memberss);
      print(ins);
      selectedmemberss = memberss[ins];
      print(selectedmemberss.id);
      await FirebaseFirestore.instance
          .collection('Somitee')
          .doc(selectedmemberss.somiteeid)
          .get()
          .then((element) {
        selectedsamitee = Somitee(
            address: element["Address"],
            id: element.id,
            lastupdated: element["Last Edited"].toDate(),
            name: element["Name"],
            active: element["Active"],
            closed: element["Closed"],
            formation: element["Formation Date"].toDate(),
            phone: element["Phone"],
            branch: element["Branch"],
            sl: 0);
        mmems = true;
        setState(() {});
      });
    }
   void _setupsector(int ins) {
     selectedsector = SectorList[ins];
    }
    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 125),
              child: CustomProgressBar(
                totalCheckpoints: 8,
                currentCheckpoint: index,
                customeregi: false,
              ),
            ),
            index == 0
                ? Container(
                    margin: EdgeInsets.only(top: 250, left: 50),
                    // margin: EdgeInsets.only(top: 100, left: 50),
                    width: ScreenWidth / 1.097,
                    height: 200,
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
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: ScreenWidth / 1.097,
                          height: ScreenWidth / 38.4,
                          color: navbarColor,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: ScreenWidth / 38.4),
                                child: Text(
                                  "Regular A/c Opening (Choose A/c Type)",
                                  style: TextStyle(
                                    color: AppColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenWidth / 96,
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  _save(1);
                                },
                                child: Container(
                                  height: ScreenWidth / 38.4,
                                  width: ScreenWidth / 19.2,
                                  color: Colors.green,
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.fast_forward,
                                        color: Colors.white,
                                        size: ScreenWidth / 109.71,
                                      ),
                                      SizedBox(
                                        width: ScreenWidth / 212,
                                      ),
                                      Text(
                                        "Next",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenWidth / 109.71),
                                      ),
                                      SizedBox(
                                        width: ScreenWidth / 768,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ScreenWidth / 153.6,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: ScreenWidth / 38.4,
                                  width: ScreenWidth / 19.2,
                                  color: AppColor_yellow,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: ScreenWidth / 512,
                                        left: ScreenWidth / 102.4),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.clear_all,
                                          color: Colors.white,
                                          size: ScreenWidth / 85.33,
                                        ),
                                        Text(
                                          "Clear",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenWidth / 109.71),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ScreenWidth / 153.6,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: ScreenWidth / 38.4,
                                  width: ScreenWidth / 30.72,
                                  color: Colors.red,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: ScreenWidth / 153.6,
                                        left: ScreenWidth / 76.8),
                                    child: Text(
                                      "X",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenWidth / 109.71),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ScreenWidth / 153.6,
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.5,
                                    child: Radio(
                                      value: 1,
                                      groupValue: _selectedValue,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedValue = newValue as int;
                                        });
                                      },
                                      activeColor: AppColor_greyText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Savings Account',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.5,
                                    child: Radio(
                                      value: 2,
                                      groupValue: _selectedValue,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedValue = newValue as int;
                                        });
                                      },
                                      activeColor: AppColor_greyText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Short Notice Deposits (CBS) (SND (CBS))',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  )
                : SizedBox(),
            index == 1
                ? RegularDepositAccount(
                    memberss: memberss,
                    mmems: mmems,
                    save: _save,setupmembers: _setupmemberss,
                    selectedmemberss: selectedmemberss,setupsector: _setupsector,
                    selectedsamitee: selectedsamitee,
                    selectedsector: selectedsector,
                  )
                : SizedBox(),
            index == 3
                ? RegularDepositNominee(
                    nomineepercentage: nomineepercentage,
                    save: _save,
                    selectedDate: selectedDate,
                    pickedImage: pickedImage,
                    documentno: documentno,
                    pickeddfImage: pickeddfImage,
                    fathername: fathername,
                    pickeddbImage: pickeddbImage,
                    nomineename: nomineename,
                    selectedrelation: selectedrelation,
                    selecteddocumenttype: selecteddocumenttype,
                    mothername: mothername)
                : SizedBox(),
            index == 4
                ? RegularDepositIntroducer(
                    save: _save,
                    selectedaccountno: selectedaccountno,
                    selectedintroducertype: selectedintroducertype,
                  )
                : SizedBox(),
            index == 5
                ? RegularDepositTransactionProfile(
                    save: _save,
                  )
                : SizedBox(),
            index == 6
                ? RegularDepositKycProfile(
                    save: _save,
                  )
                : SizedBox(),
            index == 7
                ? RegularDepositFinalSubmission(
                    accid: selectedmemberss.id,
                    acctitle: selectedmemberss.firstname +
                        ' ' +
                        selectedmemberss.lastname,
                    save: _save,
                    acctype: _selectedValue == 1
                        ? "Savings Account"
                        : 'Short Notice Deposits (CBS) (SND (CBS))',
                    sectorcode: selectedsector,
                  )
                : SizedBox(),
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
