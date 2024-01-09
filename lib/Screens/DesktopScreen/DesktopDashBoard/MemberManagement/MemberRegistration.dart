import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Constants/values.dart';
import '../../../../Model/somitee.dart';
import '../../../../Widget/ContactForm.dart';
import '../../../../Widget/MemberImage.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/OtherInfo.dart';
import '../../../../Widget/PersonalInfoForm.dart';
import '../../../../Widget/SamiteeSelection.dart';
import '../../../../Widget/SingleRow.dart';
import '../../../../route.dart';

class MemberRegistration extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  MemberRegistration({required this.appbool, required this.navbool});

  @override
  State<MemberRegistration> createState() => _MemberRegistrationState();
}

class _MemberRegistrationState extends State<MemberRegistration> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  bool img = false;
  DateTime _selectedDate = DateTime.now();
  var selectedsomiti;
  var sselectedsomiti;
  var selectedmebertype;
  var selectedocupation;
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
  var selectedfamilyhead ="";
  var selectedownhomestead ="";
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
        .collection('Somitee')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        somitee.add(Somitee(
            address: element["Address"],
            id: element.id,
            lastupdated: element["Last Edited"].toDate(),
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
    const _chars =
        '1234567890';
    Random _rnd = Random();
    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    String memberid = getRandomString(8);
    if (selectedsomiti == null ||
        selectedGender == null ||
        selectedmebertype == '' ||
        selectedocupation == '' ||
        _fathername.text.isEmpty ||
        _firstname.text.isEmpty ||
        _housedesc.text.isEmpty ||
        _lastname.text.isEmpty ||
        _preseentaddress.text.isEmpty ||
        _mothername.text.isEmpty ||
        _mobileno.text.isEmpty ||
        _annualincome.text.isEmpty ||
        _birthreginumber.text.isEmpty ||
        _landdesc.text.isEmpty ||
        _livingperiod.text.isEmpty ||
        _mobileno.text.isEmpty ||
        _nidnumber.text.isEmpty) {
      Get.snackbar(
          "Member Registration Failed.", "Some Required  Fields are Empty",
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
      FirebaseFirestore.instance.collection('Somitee').doc(selectedsomiti.id).get().then((value) {
        FirebaseFirestore.instance.collection('Somitee').doc(selectedsomiti.id).update(
            {'Active':value['Active']+1});
      });
      if (img) {
        final photoRef = FirebaseStorage.instance.ref(
            "MembersImage/$memberid.jpeg");
        UploadTask uploadTask = photoRef.putData(
            pickedImage,
            SettableMetadata(
              contentType: "image/jpeg",
            ));
        String url = await(await uploadTask).ref.getDownloadURL();
        FirebaseFirestore.instance.collection('Member').doc(memberid).set({
        'Somitee Name': selectedsomiti.name,
        'Somitee ID': selectedsomiti.id,
        'Member Type': selectedmebertype,
        'Occupation': selectedocupation,
        'First Name': _firstname.text,
        'Last Name': _lastname.text,
        'Father Name': _fathername.text,
        'Mother Name': _mothername.text,
        'Gender': selectedGender,
        'Religion': selectedreligion,
        'National ID': _nidnumber.text,
        'Birth Registration': _birthreginumber.text,
        'Age': _age.text,
        'Date Of Birth': _selectedDate,
        'No of Dependent': _dependablemember.text,
        'Education': _education.text,
        'Marital Status': maritalstatus,
        'Mobile No Type': mobiletype,
        'Mobile No': _mobileno.text,
        'Present Address': _preseentaddress.text,
        'Parmanent Address': _parmaaddress.text,
        'Living Period': _livingperiod.text,
        'No Female Earner': _nofemaleearner.text,
        'No Male Earner': _nomaleearner.text,
        'ID': memberid,
        'Head Family': selectedfamilyhead,
        'Own HomeStead': selectedownhomestead,
        'Relation With Head': _relationwithhead.text,
        'Land Desc': _landdesc.text,
        'House Desc': _housedesc.text,
        'Remarks': _remarks.text,
          'Image': true,
          'ImageURL': url,
        }).then((value) async {
          Get.offNamed(memberlistPageRoute);
          Get.snackbar("Member Added Successfully.",
              "Redirecting to Member List Page.",
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
      } else {
        FirebaseFirestore.instance.collection('Member').doc(memberid).set({
          'Somitee Name': selectedsomiti.name,
          'Somitee ID': selectedsomiti.id,
          'Member Type': selectedmebertype,
          'Occupation': selectedocupation,
          'First Name': _firstname.text,
          'Last Name': _lastname.text,
          'Father Name': _fathername.text,
          'Mother Name': _mothername.text,
          'Gender': selectedGender,
          'Religion': selectedreligion,
          'National ID': _nidnumber.text,
          'Birth Registration': _birthreginumber.text,
          'Age': _age.text,
          'Date Of Birth': _selectedDate,
          'No of Dependent': _dependablemember.text,
          'Education': _education.text,
          'Marital Status': maritalstatus,
          'Mobile No Type': mobiletype,
          'Mobile No': _mobileno.text,
          'Present Address': _preseentaddress.text,
          'Parmanent Address': _parmaaddress.text,
          'Living Period': _livingperiod.text,
          'No Female Earner': _nofemaleearner.text,
          'No Male Earner': _nomaleearner.text,
          'ID': memberid,
          'Head Family': selectedfamilyhead,
          'Own HomeStead': selectedownhomestead,
          'Relation With Head': _relationwithhead.text,
          'Land Desc': _landdesc.text,
          'House Desc': _housedesc.text,
          'Remarks': _remarks.text,
          'Image': false,
          'ImageURL': '',
        }).then((value) async {
          Get.offNamed(memberlistPageRoute);
          Get.snackbar("Member Added Successfully.",
              "Redirecting to Member List Page.",
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

    void _setupsomiti(int ins){
      setState(() {
        selectedsomiti = somitee[ins];
      });
    }
    void _setupmembertype(int ins){
      setState(() {
        selectedmebertype = MemberTypeList[ins];
      });
    }
    void _setupoccupationtype(int ins){
      setState(() {
        selectedocupation = OcupationList[ins];
      });
    }
    void _setupmaritalstatus(int ins){
      setState(() {
        maritalstatus = MaritalstatusList[ins];
      });
    }
    void _setupgender(int ins){
      setState(() {
        if(ins == 1){
          selectedGender = 'Male';
        }else if(ins == 2){
          selectedGender = 'Female';
        }else{
          selectedGender = 'Others';
        }
      });
    }
    void _setupfamilyhead(int ins){
      setState(() {
        if(ins == 1){
         selectedfamilyhead  = 'Yes';
        }else{
          selectedfamilyhead  = 'No';
        }
      });
    }


    void _setupownhomestead(int ins){
      setState(() {
        if(ins == 1){
          selectedownhomestead  = 'Yes';
        }else{
          selectedownhomestead  = 'No';
        }
      });
    }

    void _setupreligion(int ins){
      setState(() {
        selectedreligion = ReligionList[ins];
      });
    }
    void _setupmobileType(int ins){
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
        child: Column(
          children: [
            NavbarScreen(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),

            SizedBox(
              height: 50,
            ),

            SamiteeSelection(
                submit: true,
                selectmember: false,
                clear: true,
                ssomitee: ssomitee,
                close: true,setupsomiti: _setupsomiti,
                active: true,
                selectedsomiteeid: selectedsomiti,
                onsubmit: _save,
                somitee: somitee,
                onclear: _onclear,
                selectedsomitee: sselectedsomiti),

            SizedBox(
              height: 50,
            ),

            // BASIC INFO SCREEN
            SingleRow(
              heading: 'Basic Information',
              field1: 'Member Type:',setupoccupationtype: _setupoccupationtype,
              field2: 'Main Occupation:',setupmembertype: _setupmembertype,
              membertype: selectedmebertype,
              ocupation: selectedocupation,
            ),

            SizedBox(
              height: 50,
            ),

            // PERSONAL INFORMATION SCREEN
            PersonalInfoForm(
                firstname: _firstname,
                selectedGender: selectedGender,
                religion: selectedreligion,
                selectedDate: _selectedDate,
                maritalstatus: maritalstatus,
                lastname: _lastname,setupmaritalstatus: _setupmaritalstatus,
                fathername: _fathername,setupreligion: _setupreligion,
                mothername: _mothername,setupgender: _setupgender,
                nidnumber: _nidnumber,
                birthreginumber: _birthreginumber,
                age: _age,
                dependablemember: _dependablemember,
                education: _education),

            SizedBox(
              height: 50,
            ),

            // CONTACT INFORMATION SCREEN
            ContactForm(
                mobiletype: mobiletype,
                mobileno: _mobileno,setupmobileType: _setupmobileType,
                preseentaddress: _preseentaddress,
                parmaaddress: _parmaaddress),

            SizedBox(
              height: 50,
            ),

            // OTHER'S INFORMATION
            OtherInfo(
                selectedfamilyhead: selectedfamilyhead,
                selectedownhomestead: selectedownhomestead,
                livingperiod: _livingperiod,
                annualincome: _annualincome,setupownhomestead: _setupownhomestead,
                nomaleearner: _nomaleearner,setupfamilyhead: _setupfamilyhead,
                nofemaleearner: _nofemaleearner,
                relationwithhead: _relationwithhead,
                landdesc: _landdesc,
                housedesc: _housedesc,
                remarks: _remarks),

            SizedBox(
              height: 50,
            ),

            // MEMBER IMAGE
            desktop
                ? Container(
                    width: 1400,
                    height: 350,
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Text(
                                  "Member’s Image",
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
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 50, left: 250),
                              child: Container(
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
                                      width: 295,
                                      height: 30,
                                      color: navbarColor,
                                      child: Center(
                                        child: Text(
                                          "Choose Image",
                                          style: TextStyle(
                                            color: AppColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 15),
                                      height: 120,
                                      width: 295,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 265,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 20,
                                                    left: 10,
                                                    right: 10,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Select an Image File",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      SizedBox(
                                                        height: 30,
                                                        width: 96,
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Colors.white,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .blue),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                          ),
                                                          onPressed:
                                                              _selectImage,
                                                          child: Text(
                                                            "Select",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 250,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(top: 50, right: 250),
                              height: 200,
                              width: 200,
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
                                    width: 200,
                                    height: 30,
                                    color: navbarColor,
                                    child: Center(
                                      child: Text(
                                        "Preview Image",
                                        style: TextStyle(
                                          color: AppColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 25),
                                    padding: EdgeInsets.only(top: 25),
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: img
                                        ? Image.memory(
                                            pickedImage,
                                            fit: BoxFit.cover,
                                          )
                                        : Center(
                                            child: Icon(Icons.person_2_outlined,
                                                size: 58),
                                          ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : tablet
                    ? Container(
                        width: 1400,
                        height: 650,
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40.0),
                                    child: Text(
                                      "Member’s Image",
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
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 50, left: ScreenWidth / 6.144),
                                  child: Container(
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
                                          width: 295,
                                          height: 30,
                                          color: navbarColor,
                                          child: Center(
                                            child: Text(
                                              "Choose Image",
                                              style: TextStyle(
                                                color: AppColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 15),
                                          height: 120,
                                          width: 295,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 265,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 20,
                                                        left: 10,
                                                        right: 10,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Select an Image File",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          SizedBox(
                                                            height: 30,
                                                            width: 96,
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .blue),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                ),
                                                              ),
                                                              onPressed:
                                                                  _selectImage,
                                                              child: Text(
                                                                "Select",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 250,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 50, left: ScreenWidth / 11.82),
                                  child: Container(
                                    // margin: EdgeInsets.only(top: 50, right: 250),
                                    height: 200,
                                    width: 200,
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
                                          width: 200,
                                          height: 30,
                                          color: navbarColor,
                                          child: Center(
                                            child: Text(
                                              "Preview Image",
                                              style: TextStyle(
                                                color: AppColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 25),
                                          padding: EdgeInsets.only(top: 25),
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: img
                                              ? Image.memory(
                                                  pickedImage,
                                                  fit: BoxFit.cover,
                                                )
                                              : Center(
                                                  child: Icon(
                                                      Icons.person_2_outlined,
                                                      size: 58),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(
                        width: 1400,
                        height: 650,
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40.0),
                                    child: Text(
                                      "Member’s Image",
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
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 50, left: ScreenWidth / 6.144),
                                  child: Container(
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
                                          width: 295,
                                          height: 30,
                                          color: navbarColor,
                                          child: Center(
                                            child: Text(
                                              "Choose Image",
                                              style: TextStyle(
                                                color: AppColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 15),
                                          height: 120,
                                          width: 295,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 265,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 20,
                                                        left: 10,
                                                        right: 10,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Select an Image File",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          SizedBox(
                                                            height: 30,
                                                            width: 96,
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .blue),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                ),
                                                              ),
                                                              onPressed:
                                                                  _selectImage,
                                                              child: Text(
                                                                "Select",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 250,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 50, left: ScreenWidth / 11.82),
                                  child: Container(
                                    // margin: EdgeInsets.only(top: 50, right: 250),
                                    height: 200,
                                    width: 200,
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
                                          width: 200,
                                          height: 30,
                                          color: navbarColor,
                                          child: Center(
                                            child: Text(
                                              "Preview Image",
                                              style: TextStyle(
                                                color: AppColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 25),
                                          padding: EdgeInsets.only(top: 25),
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: img
                                              ? Image.memory(
                                                  pickedImage,
                                                  fit: BoxFit.cover,
                                                )
                                              : Center(
                                                  child: Icon(
                                                      Icons.person_2_outlined,
                                                      size: 58),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
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
    );
  }
}
