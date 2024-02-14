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
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../Widgets/OtherInformation.dart';
import '../Widgets/PersonalExistinginfo.dart';
import '../Widgets/memberSelection.dart';

class ExistingSamiteeMember extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  ExistingSamiteeMember({required this.appbool, required this.navbool});

  @override
  State<ExistingSamiteeMember> createState() => _ExistingSamiteeMemberState();
}

class _ExistingSamiteeMemberState extends State<ExistingSamiteeMember> {
  bool img = false;
  List<Memberss> memberss = [];
  bool mmems = false;
  var selectedmemberss;
  var sselectedmemberss;
  var selectedsamitee;
  late Uint8List pickedImage;

  @override
  void initState() {
    _loadImage();
    // TODO: implement initState
    super.initState();
    fetch();
  }

  Future<void> _loadImage() async {
    ByteData data = await rootBundle.load('Assets/person.jpg');
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
              occupation: element["Occupation"],
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

  void _save() async {

  }

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
                    child: MemberSelection(
                      memberss: memberss,
                      onclear: _onclear,
                      onsubmit: _save,
                      mmems: mmems,
                      setupmemberss: _setupmemberss,
                      selectedsamitee: selectedsamitee,
                      selectedmemberssid: sselectedmemberss,
                      selectedmemberss: selectedmemberss,
                    ),
                  ),

                  Padding(
                    padding:
                        EdgeInsets.only(left: ScreenWidth / 21.94, top: 40),
                    child: desktop
                        ? Row(
                            children: [
                              PersonalExistinginfo(
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
                              PersonalExistinginfo(
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

                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: ContactInfo(
                        memberss: selectedmemberss, selectedmember: mmems),
                  ),

                  // OTHER'S INFORMATION
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: OtherInformation(
                        memberss: selectedmemberss, selectedmember: mmems),
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
