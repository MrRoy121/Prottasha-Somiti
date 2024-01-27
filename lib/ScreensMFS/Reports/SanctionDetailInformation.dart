import 'package:flutter/material.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBool.dart';
import '../Widget/NavbarScreen.dart';
import '../Widget/ReportsWidgets/SanctionDetail.dart';


class SanctionDetailInformation extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  SanctionDetailInformation({required this.appbool, required this.navbool});

  @override
  State<SanctionDetailInformation> createState() => _SanctionDetailInformationState();
}

class _SanctionDetailInformationState extends State<SanctionDetailInformation> {


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


            // SANCTION DETAILS INFORMATION
            SanctionDetail(),


          ],
        ),
      ),

    );
  }
}
