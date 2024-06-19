import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:prottashasomit/ScreensCBS/Widgets/ContactInfo.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Constants/values.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../../Model/member.dart';
import '../../ScreensMFS/Transaction/widget/Image.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../../ScreensMFS/Widget/OtherInfo.dart';
import '../../ScreensMFS/Widget/PersonalInfoForm.dart';
import '../../ScreensMFS/Widget/SingleRow.dart';
import '../Widgets/AccountCashDeposit.dart';
import '../Widgets/CustomProgressBar.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../Widgets/OtherInformation.dart';
import '../Widgets/PersonalExistinginfo.dart';
import '../Widgets/memberSelection.dart';

class CashDeposit extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  CashDeposit({required this.appbool, required this.navbool});

  @override
  State<CashDeposit> createState() => _CashDepositState();
}

class _CashDepositState extends State<CashDeposit> {
  bool img = false;
  List<Memberss> memberss = [];
  bool mmems = false;
  var selectedmemberss;
  var sselectedmemberss;
  var selectedsamitee;
  var selectedcustomertype;
  late Uint8List pickedImage;

  @override
  void initState() {
    _loadImage();
    // TODO: implement initState
    super.initState();
    fetch();
  }

  Future<void> _loadImage() async {
    ByteData data = await rootBundle.load('assets/person.jpg');
    pickedImage = data.buffer.asUint8List();
  }

  Future<void> fetch() async {
    await FirebaseFirestore.instance
        .collection('Member')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        if (element["Status"]) {
          memberss.add(Memberss(
              somiteename: element["Somitee Name"],
              somiteeid: element["Somitee ID"],
              membertype: element["Member Type"],
              occupation: element["Occupation"], fee: element["Fee"],
              firstname: element["First Name"],
              dead: element['Dead'],
              lastname: element["Last Name"],
              fathername: element["Father Name"],
              mothername: element["Mother Name"],
              gender: element["Gender"],
              religion: element["Religion"],
              nationalid: element["National ID"],
              loanpendingamount: element["Loan Pending Amount"],
              owndepositamount: element["Own deposit Amount"],
              birthregi: element["Birth Registration"],
              annualincome: element["Annual Income"],
              sts: element["Status"],
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
              sl: 0));
        }
      }
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      img = false;
      selectedmemberss = ss;
      sselectedmemberss = ss;
      mmems = false;
      selectedsamitee = ss;
    });
  }

  void _save() async {}

  Future<void> _selectImage() async {
    final fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker != null) {
      setState(() {
        pickedImage = fromPicker;
        img = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int _selectedValue = 1;
    var ScreenWidth = MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight =
        MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    Future<void> _setupmemberss(int ins) async {
      selectedmemberss = memberss[ins];
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

    void _setupcustomertype(int ins) {
      setState(() {
        selectedcustomertype = CustomerTypeList[ins];
      });
    }

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
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
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
                                  "Cash Deposit",
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
                                  _save();
                                },
                                child: Container(
                                  height: ScreenWidth / 38.4,
                                  width: ScreenWidth / 17.07,
                                  color: Colors.green,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: ScreenWidth / 153.6,
                                        left: ScreenWidth / 102.4),
                                    child: Text(
                                      "✓ Submit",
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
                              InkWell(
                                onTap: () {
                                  _onclear();
                                },
                                child: Container(
                                  height: ScreenWidth / 38.4,
                                  width: ScreenWidth / 17.07,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: ScreenWidth / 512,
                                        left: ScreenWidth / 102.4),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.clear_all_sharp,
                                          color: Colors.white,
                                          size: ScreenWidth / 85.33,
                                        ),
                                        SizedBox(
                                          width: ScreenWidth / 307.2,
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
                                  color: AppColor_yellow,
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
                                  color: Colors.red,
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
                            children: [
                              SizedBox(
                                width: 250,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Customer Type',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenWidth / 109.71),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize: ScreenWidth / 109.71)),
                                    TextSpan(
                                        text: ' :',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: ScreenWidth / 109.71)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 65,
                              ),
                              SizedBox(
                                height: ScreenWidth / 30.72,
                                width: ScreenWidth / 5.12,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColor_greyBorder,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor_greyBorder),
                                    ),
                                    hintText: "Select",
                                    hintStyle: TextStyle(
                                      fontSize: ScreenWidth / 109.71,
                                      color: AppColor_greyText,
                                    ),
                                  ),
                                  value: selectedcustomertype,
                                  onChanged: (newValue) {
                                    _setupcustomertype(
                                        CustomerTypeList.indexOf(newValue!));
                                  },
                                  items: CustomerTypeList.map((item) {
                                    return DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                            fontSize: ScreenWidth / 109.71),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: ScreenWidth / 21.94, top: 40),
                    child: desktop
                        ? Row(
                            children: [
                              AccountCashDeposit(
                                  memberss: selectedmemberss,
                                  selectedmember: mmems),
                              Spacer(),
                              selectedmemberss == null
                                  ? ImageMember(imgurl: '')
                                  : ImageMember(
                                      imgurl: selectedmemberss.imageurl),
                            ],
                          )
                        : Column(
                            children: [
                              AccountCashDeposit(
                                  memberss: selectedmemberss,
                                  selectedmember: mmems),

                              // Spacer(),
                              SizedBox(
                                height: 50,
                              ),

                              selectedmemberss == null
                                  ? ImageMember(imgurl: '')
                                  : ImageMember(
                                      imgurl: selectedmemberss.imageurl,
                                    ),
                            ],
                          ),
                  ),
                  SizedBox(
                    height: 50,
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
