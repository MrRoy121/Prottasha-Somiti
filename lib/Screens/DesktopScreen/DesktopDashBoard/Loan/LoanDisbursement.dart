import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import '../../../../Widget/LoanWidgets/LoanDetailsWidget.dart';
import '../../../../Widget/LoanWidgets/LoanInformation.dart';
import '../../../../Widget/LoanWidgets/LoanOtherInfo.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/TransactionWidget/Image.dart';
import '../../../../Widget/TransactionWidget/LinkACinfo.dart';


class LoanDisbursement extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  LoanDisbursement({required this.appbool, required this.navbool});

  @override
  State<LoanDisbursement> createState() => _LoanDisbursementState();
}

class _LoanDisbursementState extends State<LoanDisbursement> {


  @override
  Widget build(BuildContext context) {

    var ScreenWidth =MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight = MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    if(ResponsiveWidth > 1400){
      desktop = true;
      tablet = false;
      mobile = false;
    } else if (ResponsiveWidth > 540){
      tablet = true;
      desktop = false;
      mobile = false;
    }else{
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
            NavbarScreen(appbool: widget.appbool, navbool: widget.navbool,),

            SizedBox(
              height: 50,
            ),

            // Loan Disbursement Details
            LoanDetailsWidget(title: 'Loan Disbursement Details',),

            SizedBox(
              height: 20,
            ),

            // Loan information
            LoanInformation(),

            SizedBox(
              height: 30,
            ),

            // Loan Other imformation
            LoanOtherInfo(),


            SizedBox(
              height: 30,
            ),


            // Link A/c Information
            Padding(
              padding:  EdgeInsets.only(left: ScreenWidth/21.94),
              child: desktop? Row(
                children: [
                  LinkACinfo(),

                  Spacer(),

                  ImageMember(),
                ],
              ) :
              Column(
                children: [
                  LinkACinfo(),

                  // Spacer(),
                  SizedBox(height: 50,),

                  ImageMember(),
                ],
              )
              ,
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
