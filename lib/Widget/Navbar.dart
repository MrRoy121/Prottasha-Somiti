import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopDashBoard/MemberManagement/MemberManagement.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/AppBarItem.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NavItem.dart';

import '../Constants/Constants.dart';

class Navbar extends AppBar {
  Navbool navbool;
  Function(int) toglechnage;
  Navbar({ required this.navbool,  required this.toglechnage,Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}


class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: navbarColor,
      // padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
        Container(

          // color: widget.toglechnage(0)=='false'? Colors.red : Colors.transparent,
          child: InkWell(
            onTap: (){
              setState(() {
                widget.toglechnage(0);

              });
            },
            child: NavbarItem(
              flag: widget.navbool.transaction,
              text: 'Member Management',
              icon: Icons.arrow_drop_down
            ),
          ),
        ),

          InkWell(
            onTap: () {
              setState(() {
                widget.toglechnage(1);
              });
              // setState(() {
              //   widget.navbool.makeallfalse();
              //   widget.navbool.transaction = true;
              // });
              // Get.offNamed(page)
              // Navigator.of(context).pushNamed('Transaction');
            },
            child: NavbarItem(
                flag: widget.navbool.transaction,
                text: 'Transaction',
                icon: Icons.arrow_drop_down),
          ),

          InkWell(
            onTap: () {
              setState(() {
                widget.toglechnage(2);
              });
              // setState(() {
              //   widget.navbool.makeallfalse();
              //   widget.navbool.loan = true;
              // });
              // Navigator.of(context).pushNamed('Loan');
            },
            child: NavbarItem(
                flag: widget.navbool.loan,
                text: 'Loan',
                icon: Icons.arrow_drop_down),
          ),

          InkWell(
            onTap: () {
              // setState(() {
              //   widget.navbool.makeallfalse();
              //   widget.navbool.reports = true;
              // });
              // Navigator.of(context).pushNamed('Reports');
            },
            child: NavbarItem(
                flag: widget.navbool.reports,
                text: 'Reports',
                icon: Icons.arrow_drop_down),
          ),

          InkWell(
            onTap: () {
              // setState(() {
              //   widget.navbool.makeallfalse();
              //   widget.navbool.accounts = true;
              // });
              // Navigator.of(context).pushNamed('Accounts');
            },
            child: NavbarItem(
                flag: widget.navbool.accounts,
                text: 'Accounts',
                icon: Icons.arrow_drop_down),
          ),

          InkWell(
            onTap: () {
              // setState(() {
              //   widget.navbool.makeallfalse();
              //   widget.navbool.employee = true;
              // });
              // Navigator.of(context).pushNamed('Employee');
            },
            child: NavbarItem(
                flag: widget.navbool.employee,
                text: 'Employee',
                icon: Icons.arrow_drop_down),
          ),

          InkWell(
            onTap: () {
              // setState(() {
              //   widget.navbool.makeallfalse();
              //   widget.navbool.samiteemanagement = true;
              // });
              // Navigator.of(context).pushNamed('Samitee Management');
            },
            child: NavbarItem(
                flag: widget.navbool.samiteemanagement,
                text: 'Samitee Management',
                icon: Icons.arrow_drop_down),
          ),

          InkWell(
            onTap: () {
              // setState(() {
              //   widget.navbool.makeallfalse();
              //   widget.navbool.calculators = true;
              // });
              // Navigator.of(context).pushNamed('Calculators');
            },
            child: NavbarItem(
                flag: widget.navbool.calculators,
                text: 'Calculators',
                icon: Icons.arrow_drop_down),
          ),

          InkWell(
            onTap: () {
              // setState(() {
              //   widget.navbool.makeallfalse();
              //   widget.navbool.specialConsideration = true;
              // });
              // Navigator.of(context).pushNamed('Special Consideration');
            },
            child: NavbarItem(
                flag: widget.navbool.specialConsideration,
                text: 'Special Consideration',
                icon: Icons.arrow_drop_down),
          ),



        ],
      ),
    );

  }


}
