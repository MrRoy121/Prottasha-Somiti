import 'package:flutter/material.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBool.dart';
import '../Widget/NavbarScreen.dart';
import '../Widget/ReportsWidgets/SlipReprintWidget.dart';


class SlipReprint extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  SlipReprint({required this.appbool, required this.navbool});

  @override
  State<SlipReprint> createState() => _SlipReprintState();
}

class _SlipReprintState extends State<SlipReprint> {


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


            // SLIP RE-PRINT
            SlipReprintWidget(),


          ],
        ),
      ),

    );
  }
}
