import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/AppBarItem.dart';

import '../Constants/Constants.dart';

class Appbar extends AppBar {
  Appbool navbool;
  Appbar({required this.navbool, Key? key}) : super(key: key);

  @override
  State<Appbar> createState() => _NavbarState();
}


class _NavbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: AppColor,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Image.asset('assets/logo.png', width: 60, height: 60),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Prottasha Samitee Ltd.',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          buildAction('10-Oct-2023', Icons.calendar_month_sharp, () {
            // Date function's code
          }),

          InkWell(
            onTap: () {
              setState(() {
                widget.navbool.makeallfalse();
                widget.navbool.home = true;
              });
              Navigator.of(context).pushNamed('Home');
            },
            child: AppbarItem(
                flag: widget.navbool.dashboard,
                text: 'Home',
                icon: Icons.home),
          ),

          InkWell(
              onTap: () {
                setState(() {
                  widget.navbool.makeallfalse();
                  widget.navbool.dashboard = true;
                });
                Navigator.of(context).pushNamed('Dashboard');
              },
              child: AppbarItem(
                  flag: widget.navbool.dashboard,
                  text: 'Dashboard',
                  icon: Icons.bar_chart)),

          buildAction('Branch Code - 98765', null, () {
            // Branch Code function's Code
          }),

          InkWell(
              onTap: () {
                setState(() {
                  widget.navbool.makeallfalse();
                  widget.navbool.admin = true;
                });
                Navigator.of(context).pushNamed('admin_titas');
              },
              child: AppbarItem(
                  flag: widget.navbool.admin,
                  text: 'admin_titas',
                  icon: Icons.person_2_rounded)),


        ],
      ),
    );

  }

  Widget buildAction(String text, IconData? icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white,),
            SizedBox(width: 4),
            Text(text, style: TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
      ),
    );
  }

}
