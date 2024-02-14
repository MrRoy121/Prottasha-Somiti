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
import '../../ScreensMFS/Widget/ContactForm.dart';
import '../../ScreensMFS/Widget/OtherInfo.dart';
import '../../ScreensMFS/Widget/PersonalInfoForm.dart';
import '../../ScreensMFS/Widget/SingleRow.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
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
  DateTime _selectedDate = DateTime.now();
  var selectedmebertype;
  var selectedocupation;
  List<Memberss> memberss = [];
  bool mmems = false;
  var selectedmemberss;
  var sselectedmemberss;
  var selectedsamitee;
  var _firstname = TextEditingController();
  var _lastname = TextEditingController();
  var _fathername = TextEditingController();
  var _mothername = TextEditingController();
  var _nidnumber = TextEditingController();
  var _birthreginumber = TextEditingController();
  var _age = TextEditingController();
  var _dependablemember = TextEditingController();
  var _education = TextEditingController();
  var selectedGender;
  var selectedreligion;
  var maritalstatus;
  var mobiletype;
  var _mobileno = TextEditingController();
  var _preseentaddress = TextEditingController();
  var _parmaaddress = TextEditingController();
  var selectedfamilyhead = "";
  var selectedownhomestead = "";
  var _livingperiod = TextEditingController();
  var _annualincome = TextEditingController();
  var _nomaleearner = TextEditingController();
  var _nofemaleearner = TextEditingController();
  var _relationwithhead = TextEditingController();
  var _landdesc = TextEditingController();
  var _housedesc = TextEditingController();
  var _remarks = TextEditingController();
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
      selectedmebertype = ss;
      selectedocupation = ss;
      _firstname = TextEditingController(text: "");
      _lastname = TextEditingController(text: "");
      _fathername = TextEditingController(text: "");
      _mothername = TextEditingController(text: "");
      _nidnumber = TextEditingController(text: "");
      _birthreginumber = TextEditingController(text: "");
      _age = TextEditingController(text: "");
      _dependablemember = TextEditingController(text: "");
      _education = TextEditingController(text: "");
      selectedGender = ss;
      selectedreligion = ss;
      _selectedDate = DateTime.now();
      maritalstatus = ss;
      mobiletype = ss;
      _mobileno = TextEditingController(text: "");
      _preseentaddress = TextEditingController(text: "");
      _parmaaddress = TextEditingController(text: "");
      selectedfamilyhead = ss;
      selectedownhomestead = ss;
      _livingperiod = TextEditingController(text: "");
      _annualincome = TextEditingController(text: "");
      _nomaleearner = TextEditingController(text: "");
      _nofemaleearner = TextEditingController(text: "");
      _relationwithhead = TextEditingController(text: "");
      _landdesc = TextEditingController(text: "");
      _housedesc = TextEditingController(text: "");
      _remarks = TextEditingController(text: "");
      img = false;
    });
  }

  void _save() async {
    // const _chars = '1234567890';
    // Random _rnd = Random();
    // String getRandomString(int length) =>
    //     String.fromCharCodes(Iterable.generate(
    //         length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    // String memberid = getRandomString(8);
    // if (selectedsomiti == null ||
    //     selectedGender == null ||
    //     selectedmebertype == '' ||
    //     selectedocupation == '' ||
    //     _fathername.text.isEmpty ||
    //     _firstname.text.isEmpty ||
    //     _housedesc.text.isEmpty ||
    //     _lastname.text.isEmpty ||
    //     _preseentaddress.text.isEmpty ||
    //     _mothername.text.isEmpty ||
    //     _mobileno.text.isEmpty ||
    //     _annualincome.text.isEmpty ||
    //     _birthreginumber.text.isEmpty ||
    //     _landdesc.text.isEmpty ||
    //     _livingperiod.text.isEmpty ||
    //     _mobileno.text.isEmpty ||
    //     _nidnumber.text.isEmpty) {
    //   Get.snackbar(
    //       "Member Registration Failed.", "Some Required  Fields are Empty",
    //       snackPosition: SnackPosition.BOTTOM,
    //       colorText: Colors.white,
    //       backgroundColor: Colors.red,
    //       margin: EdgeInsets.zero,
    //       duration: const Duration(milliseconds: 2000),
    //       boxShadows: [
    //         BoxShadow(
    //             color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
    //       ],
    //       borderRadius: 0);
    // } else {
    //   FirebaseFirestore.instance
    //       .collection('Somitee')
    //       .doc(selectedsomiti.id)
    //       .get()
    //       .then((value) {
    //     FirebaseFirestore.instance
    //         .collection('Somitee')
    //         .doc(selectedsomiti.id)
    //         .update({'Active': value['Active'] + 1});
    //   });
    //   if (img) {
    //     final photoRef =
    //         FirebaseStorage.instance.ref("MembersImage/$memberid.jpeg");
    //     UploadTask uploadTask = photoRef.putData(
    //         pickedImage,
    //         SettableMetadata(
    //           contentType: "image/jpeg",
    //         ));
    //     String url = await (await uploadTask).ref.getDownloadURL();
    //     FirebaseFirestore.instance.collection('Member').doc(memberid).set({
    //       'Somitee Name': selectedsomiti.name,
    //       'Somitee ID': selectedsomiti.id,
    //       'Member Type': selectedmebertype,
    //       'Occupation': selectedocupation,
    //       'First Name': _firstname.text,
    //       'Last Name': _lastname.text,
    //       'Father Name': _fathername.text,
    //       'Loan Pending Amount': 0,
    //       'Own deposit Amount': 0,
    //       'Deposits':[],
    //       'Withdraws':[],
    //       'Mother Name': _mothername.text,
    //       'Gender': selectedGender,
    //       'Religion': selectedreligion,
    //       'National ID': _nidnumber.text,
    //       'Birth Registration': _birthreginumber.text,
    //       'Age': _age.text,
    //       'Date Of Birth': _selectedDate,
    //       'No of Dependent': _dependablemember.text,
    //       'Education': _education.text,
    //       'Marital Status': maritalstatus,
    //       'Mobile No Type': mobiletype,
    //       'Mobile No': _mobileno.text,
    //       'Present Address': _preseentaddress.text,
    //       'Permanent Address': _parmaaddress.text,
    //       'Living Period': _livingperiod.text,
    //       'No Female Earner': _nofemaleearner.text,
    //       'No Male Earner': _nomaleearner.text,
    //       'ID': memberid,
    //       'Status': true,
    //       'Dead': false,
    //       'Head Family': selectedfamilyhead,
    //       'Own HomeStead': selectedownhomestead,
    //       'Relation With Head': _relationwithhead.text,
    //       'Annual Income': _annualincome.text,
    //       'Land Desc': _landdesc.text,
    //       'House Desc': _housedesc.text,
    //       'Remarks': _remarks.text,
    //       'Image': true,
    //       'ImageURL': url,
    //     }).then((value) async {
    //       Get.offNamed(memberlistPageRoute);
    //       Get.snackbar(
    //           "Member Added Successfully.", "Redirecting to Member List Page.",
    //           snackPosition: SnackPosition.BOTTOM,
    //           colorText: Colors.white,
    //           backgroundColor: Colors.green,
    //           margin: EdgeInsets.zero,
    //           duration: const Duration(milliseconds: 2000),
    //           boxShadows: [
    //             const BoxShadow(
    //                 color: Colors.grey,
    //                 offset: Offset(-100, 0),
    //                 blurRadius: 20),
    //           ],
    //           borderRadius: 0);
    //     }).catchError((error) => print("Failed to add user: $error"));
    //   } else {
    //     FirebaseFirestore.instance.collection('Member').doc(memberid).set({
    //       'Somitee Name': selectedsomiti.name,
    //       'Somitee ID': selectedsomiti.id,
    //       'Member Type': selectedmebertype,
    //       'Occupation': selectedocupation,
    //       'First Name': _firstname.text,
    //       'Loan Pending Amount': 0,
    //       'Own deposit Amount': 0,
    //       'Last Name': _lastname.text,
    //       'Father Name': _fathername.text,
    //       'Mother Name': _mothername.text,
    //       'Gender': selectedGender,
    //       'Status': true,
    //       'Deposits':[],
    //       'Withdraws':[],
    //       'Religion': selectedreligion,
    //       'National ID': _nidnumber.text,
    //       'Birth Registration': _birthreginumber.text,
    //       'Age': _age.text,
    //       'Date Of Birth': _selectedDate,
    //       'No of Dependent': _dependablemember.text,
    //       'Education': _education.text,
    //       'Marital Status': maritalstatus,
    //       'Mobile No Type': mobiletype,
    //       'Mobile No': _mobileno.text,
    //       'Present Address': _preseentaddress.text,
    //       'Parmanent Address': _parmaaddress.text,
    //       'Living Period': _livingperiod.text,
    //       'Annual Income': _annualincome.text,
    //       'No Female Earner': _nofemaleearner.text,
    //       'No Male Earner': _nomaleearner.text,
    //       'ID': memberid,
    //       'Head Family': selectedfamilyhead,
    //       'Own HomeStead': selectedownhomestead,
    //       'Relation With Head': _relationwithhead.text,
    //       'Land Desc': _landdesc.text,
    //       'House Desc': _housedesc.text,
    //       'Remarks': _remarks.text,
    //       'Image': false,
    //       'ImageURL': '',
    //     }).then((value) async {
    //       Get.offNamed(memberlistPageRoute);
    //       Get.snackbar(
    //           "Member Added Successfully.", "Redirecting to Member List Page.",
    //           snackPosition: SnackPosition.BOTTOM,
    //           colorText: Colors.white,
    //           backgroundColor: Colors.green,
    //           margin: EdgeInsets.zero,
    //           duration: const Duration(milliseconds: 2000),
    //           boxShadows: [
    //             const BoxShadow(
    //                 color: Colors.grey,
    //                 offset: Offset(-100, 0),
    //                 blurRadius: 20),
    //           ],
    //           borderRadius: 0);
    //     }).catchError((error) => print("Failed to add user: $error"));
    //   }
    // }
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

    void _setupfamilyhead(int ins) {
      setState(() {
        if (ins == 1) {
          selectedfamilyhead = 'Yes';
        } else {
          selectedfamilyhead = 'No';
        }
      });
    }

    void _setupownhomestead(int ins) {
      setState(() {
        if (ins == 1) {
          selectedownhomestead = 'Yes';
        } else {
          selectedownhomestead = 'No';
        }
      });
    }

    void _setupmobileType(int ins) {
      setState(() {
        mobiletype = MobileTypeList[ins];
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
                        memberss: selectedmemberss,
                        selectedmember: mmems),
                  ),

                  // OTHER'S INFORMATION
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: OtherInfo(
                        selectedfamilyhead: selectedfamilyhead,
                        selectedownhomestead: selectedownhomestead,
                        livingperiod: _livingperiod,
                        annualincome: _annualincome,
                        setupownhomestead: _setupownhomestead,
                        nomaleearner: _nomaleearner,
                        setupfamilyhead: _setupfamilyhead,
                        nofemaleearner: _nofemaleearner,
                        relationwithhead: _relationwithhead,
                        landdesc: _landdesc,
                        housedesc: _housedesc,
                        remarks: _remarks),
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
