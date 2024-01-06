import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/somitee.dart';
import '../../../../Widget/ContactForm.dart';
import '../../../../Widget/MemberImage.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/OtherInfo.dart';
import '../../../../Widget/PersonalInfoForm.dart';
import '../../../../Widget/SamiteeSelection.dart';
import '../../../../Widget/SingleRow.dart';


class MemberRegistration extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  MemberRegistration({required this.appbool, required this.navbool});

  @override
  State<MemberRegistration> createState() => _MemberRegistrationState();
}

class _MemberRegistrationState extends State<MemberRegistration> {
  List<Somitee> somitee = [];
  var selectedsomiti;

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
            name: element["Name"],
            active: element["Active"],
            formation: element["Formation Date"].toDate(),
            phone: element["Phone"],
            branch: element["Branch"],
            sl: 0));
      }
    });
  }


  void _save(){
    // String name = _consomitiname.text;
    // String phone = _conphone.text;
    // String branch = _conbranchname.text;
    // String address = _conaddress.text;
    //
    // if(name.isEmpty || phone.isEmpty|| branch.isEmpty||address.isEmpty){
    //   Get.snackbar("Somitee Registration Failed.",
    //       "All Fields are Required",
    //       snackPosition: SnackPosition.BOTTOM,
    //       colorText: Colors.white,
    //       backgroundColor: Colors.red,
    //       margin: EdgeInsets.zero,
    //       duration: const Duration(milliseconds: 2000),
    //       boxShadows: [
    //         BoxShadow(color: Colors.grey,offset: Offset(-100,0),blurRadius: 20),
    //       ],
    //       borderRadius: 0);
    // }else{
    //   const _chars =
    //       '1234567890';
    //   Random _rnd = Random();
    //   String getRandomString(int length) =>
    //       String.fromCharCodes(Iterable.generate(
    //           length,
    //               (_) => _chars.codeUnitAt(
    //               _rnd.nextInt(_chars.length))));
    //   String ss = getRandomString(8);
    //   FirebaseFirestore.instance.collection('Somitee').doc(ss).set({
    //     'Name': name,
    //     'Phone': phone,
    //     'Branch': branch,
    //     'Address': address,
    //     'Active': 0,
    //     'Formation Date': DateTime.now(),
    //     'Last Edited': DateTime.now(),
    //   }).then((value) {
    //     Get.offNamed(somiteelistPageRoute);
    //     Get.snackbar("Somitee Added Successfully.",
    //         "Redirecting to Somitee List Page.",
    //         snackPosition: SnackPosition.BOTTOM,
    //         colorText: Colors.white,
    //         backgroundColor: Colors.green,
    //         margin: EdgeInsets.zero,
    //         duration: const Duration(milliseconds: 2000),
    //         boxShadows: [
    //           const BoxShadow(color: Colors.grey,offset: Offset(-100,0),blurRadius: 20),
    //         ],
    //         borderRadius: 0);
    //   }).catchError((error) => print("Failed to add user: $error"));
    // }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavbarScreen(appbool: widget.appbool, navbool: widget.navbool,),
        
            SizedBox(
              height: 50,
            ),
        
            SamiteeSelection(submit: true, selectmember: false, clear: true, close: true,active: true,onsubmit: _save, somitee: somitee,selectedsomitee: selectedsomiti),

            SizedBox(
              height: 50,
            ),
        
            // BASIC INFO SCREEN
            SingleRow(heading: 'Basic Information', field1: 'Member Type:', field2: 'Main Occuoation:',),

            SizedBox(
              height: 50,
            ),


            // PERSONAL INFORMATION SCREEN
            PersonalInfoForm(),

            SizedBox(
              height: 50,
            ),


            // CONTACT INFORMATION SCREEN
            ContactForm(),

            SizedBox(
              height: 50,
            ),


            // OTHER'S INFORMATION
            OtherInfo(),

            SizedBox(
              height: 50,
            ),


            // MEMBER IMAGE
            MemberImage(),

            SizedBox(
              height: 50,
            ),

          ],
        ),
      ),


    );
  }
}
