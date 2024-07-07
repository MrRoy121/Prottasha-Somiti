import 'package:flutter/material.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import 'Widgets/SlipReprintWidget.dart';


class SlipReprint extends StatefulWidget {
  NavboolCBS navbool;
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
            NavbarScreenCBS(appbool: widget.appbool, navbool: widget.navbool,),

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
