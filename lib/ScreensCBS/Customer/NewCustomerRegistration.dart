import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:prottashasomit/ScreensCBS/Widgets/OtherInfo2CBS.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Constants/values.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../../ScreensMFS/Loan/widgets/LoanDetailsWidget.dart';
import '../Widgets/BasicInfoWidget.dart';
import '../Widgets/CustomProgressBar.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../Widgets/OtherInfoCBS.dart';
import '../Widgets/PersonalInfoFormCBS.dart';

class NewCustomerRegistration extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;
  NewCustomerRegistration({required this.appbool, required this.navbool});

  @override
  State<NewCustomerRegistration> createState() =>
      _NewCustomerRegistrationState();
}

class _NewCustomerRegistrationState extends State<NewCustomerRegistration> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  bool img = false;
  DateTime _selectedDate = DateTime.now();
  var selectedsomiti;
  var sselectedsomiti;
  var selectedmebertype;
  var selectedocupation;
  var selectedcustomertype;
  var selectedispsb;
  var _firstname = TextEditingController();
  var _lastname = TextEditingController();
  var _fathername = TextEditingController();
  var _mothername = TextEditingController();
  var _nidnumber = TextEditingController();
  var _birthreginumber = TextEditingController();
  var _age = TextEditingController();
  var _sectorcode = TextEditingController();
  var _onbehalforrm = TextEditingController();
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
  var selecteddictatorship;
  var selectedRelatedParty;
  var _media = TextEditingController();
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
    ByteData data = await rootBundle.load('assets/person.jpg');
    pickedImage = data.buffer.asUint8List();
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
      selectedmebertype = ss;
      selectedocupation = ss;
      selectedcustomertype = ss;
      selectedispsb = ss;
      selecteddictatorship = ss;
      selectedRelatedParty = ss;
      _firstname = TextEditingController(text: "");
      _lastname = TextEditingController(text: "");
      _fathername = TextEditingController(text: "");
      _mothername = TextEditingController(text: "");
      _sectorcode = TextEditingController(text: "");
      _onbehalforrm = TextEditingController(text: "");
      _nidnumber = TextEditingController(text: "");
      _birthreginumber = TextEditingController(text: "");
      _age = TextEditingController(text: "");
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
      _media = TextEditingController(text: "");
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

    void _setupmaritalstatus(int ins) {
      setState(() {
        maritalstatus = MaritalstatusList[ins];
      });
    }

    void _setupgender(int ins) {
      setState(() {
        if (ins == 1) {
          selectedGender = 'Male';
        } else if (ins == 2) {
          selectedGender = 'Female';
        } else {
          selectedGender = 'Others';
        }
      });
    }

    void _setupispsb(int ins) {
      setState(() {
        if (ins == 1) {
          selectedispsb = 'Yes';
        } else if (ins == 2) {
          selectedispsb = 'No';
        }
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

    void _setupreligion(int ins) {
      setState(() {
        selectedreligion = ReligionList[ins];
      });
    }

    void _setupcustomertype(int ins) {
      setState(() {
        selectedcustomertype = CustomerTypeList[ins];
      });
    }

    void _setupdictatorship(int ins) {
      setState(() {
        if (ins == 1) {
          selecteddictatorship = 'Yes';
        } else {
          selecteddictatorship = 'No';
        }
      });
    }

    void _setupRelatedParty(int ins) {
      setState(() {
        if (ins == 1) {
          selectedRelatedParty = 'Yes';
        } else {
          selectedRelatedParty = 'No';
        }
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
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 125),
                    child: CustomProgressBar(
                      totalCheckpoints: 9,
                      currentCheckpoint: 1,customeregi: true,
                    ),
                  ),

                  BasicInfoWidget(
                    title: 'Basic Information',
                    onsubmit: _save,
                    onduplecate: () {},
                    onclear: _onclear,
                  ),

                  // PERSONAL INFORMATION SCREEN
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: PersonalInfoFormCBS(
                        firstname: _firstname,
                        selectedGender: selectedGender,
                        setupcustomertype: _setupcustomertype,
                        setupispsb: _setupispsb,
                        religion: selectedreligion,
                        selectedcustomertype: selectedcustomertype,
                        selectedispsb: selectedispsb,
                        selectedDate: _selectedDate,
                        maritalstatus: maritalstatus,
                        sectorcode: _sectorcode,
                        lastname: _lastname,
                        onbehalforrm: _onbehalforrm,
                        setupmaritalstatus: _setupmaritalstatus,
                        fathername: _fathername,
                        setupreligion: _setupreligion,
                        mothername: _mothername,
                        setupgender: _setupgender,
                        nidnumber: _nidnumber,
                        birthreginumber: _birthreginumber,
                        age: _age,
                        education: _education),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: OtherInfoCBS(
                        selectedfamilyhead: selectedfamilyhead,
                        selectedownhomestead: selectedownhomestead,
                        livingperiod: _livingperiod,
                        media: _media,
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
                  Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: OtherInfo2CBS(
                          selecteddictatorship: selecteddictatorship,
                          selectedRelatedParty: selectedRelatedParty,
                          setupdictatorship: _setupdictatorship,
                          setupRelatedParty: _setupRelatedParty)),
                  SizedBox(height: 50,),
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
