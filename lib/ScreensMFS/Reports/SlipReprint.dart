import 'package:flutter/material.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/SlipReprintWidget.dart';


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
            NavbarScreenMFS(appbool: widget.appbool, navbool: widget.navbool,),

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
