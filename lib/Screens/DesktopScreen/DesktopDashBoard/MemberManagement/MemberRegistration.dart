import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import '../../../../Constants/Constants.dart';
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
        
            SamiteeSelection(submit: true, selectmember: false, clear: true, close: true,active: true,),

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
