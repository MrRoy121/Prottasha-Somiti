import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/TransactionInformation.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';


class SamiteeTransaction extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  SamiteeTransaction({required this.appbool, required this.navbool});

  @override
  State<SamiteeTransaction> createState() => _SamiteeTransactionState();
}

class _SamiteeTransactionState extends State<SamiteeTransaction> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child:Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: [

                  SizedBox(
                    height: 50,
                  ),

               //   SamiteeSelection(submit: true, selectmember: true, clear: true, close: true,active: true,onsubmit: (){}),


                  SizedBox(
                    height: 50,
                  ),

                  // TRANSACTION INFORMATION
                  TransactionInformation(),


                ],
              ),
            ),
            NavbarScreenMFS(appbool: widget.appbool, navbool: widget.navbool,),
          ],
        ),
      ),

    );
  }
}
