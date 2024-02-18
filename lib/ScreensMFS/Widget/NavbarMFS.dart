import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../../Constants/Constants.dart';
import 'NavBoolMFS.dart';
import '../../Screens/Widgets/NavItem.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 60,
          color: navbarColor,
          // padding: EdgeInsets.symmetric(horizontal: 15),
          child: MediaQuery.of(context).size.width >= 1536? Row(
            children: [
            InkWell(
              onTap: (){
                setState(() {
                  widget.toglechnage(0);
                });
              },
              child: NavbarItem(
                flag: widget.navbool.memberManagement,
                text: 'Member Management',
                icon: Icons.arrow_drop_down
              ),
            ),

              InkWell(
                onTap: () {
                  setState(() {
                    widget.toglechnage(1);
                  });

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

                },
                child: NavbarItem(
                    flag: widget.navbool.loan,
                    text: 'Loan',
                    icon: Icons.arrow_drop_down),
              ),

              InkWell(
                onTap: () {
                  setState(() {
                    widget.toglechnage(3);
                  });

                },
                child: NavbarItem(
                    flag: widget.navbool.reports,
                    text: 'Reports',
                    icon: Icons.arrow_drop_down),
              ),

            ],
          )
          : Align(
              alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Get.dialog(
                      barrierColor: Colors.transparent,
                      barrierDismissible: true,
                      Dialog(alignment: Alignment.topRight, insetPadding: const EdgeInsets.only(top: 100,),
                        child: Container(
                          color: navbarColor,
                          // height: 800,
                          width: 200,
                          child: Column(
                            children: [
                              InkWell(
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

                              InkWell(
                                onTap: () {
                                  setState(() {
                                    widget.toglechnage(1);
                                  });

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

                                },
                                child: NavbarItem(
                                    flag: widget.navbool.loan,
                                    text: 'Loan',
                                    icon: Icons.arrow_drop_down),
                              ),

                              InkWell(
                                onTap: () {
                                  setState(() {
                                    widget.toglechnage(3);
                                  });

                                },
                                child: NavbarItem(
                                    flag: widget.navbool.reports,
                                    text: 'Reports',
                                    icon: Icons.arrow_drop_down),
                              ),

                              InkWell(
                                onTap: () {

                                },
                                child: NavbarItem(
                                    flag: widget.navbool.accounts,
                                    text: 'Accounts',
                                    icon: Icons.arrow_drop_down),
                              ),

                              InkWell(
                                onTap: () {

                                },
                                child: NavbarItem(
                                    flag: widget.navbool.employee,
                                    text: 'Employee',
                                    icon: Icons.arrow_drop_down),
                              ),

                              InkWell(
                                onTap: () {

                                },
                                child: NavbarItem(
                                    flag: widget.navbool.samiteemanagement,
                                    text: 'Samitee Management',
                                    icon: Icons.arrow_drop_down),
                              ),

                              InkWell(
                                onTap: () {

                                },
                                child: NavbarItem(
                                    flag: widget.navbool.calculators,
                                    text: 'Calculators',
                                    icon: Icons.arrow_drop_down),
                              ),

                              InkWell(
                                onTap: () {

                                },
                                child: NavbarItem(
                                    flag: widget.navbool.specialConsideration,
                                    text: 'Special Consideration',
                                    icon: Icons.arrow_drop_down),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
                icon: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Colors.black,
                  ),
                )
            ),
          ),
        ),
      ],
    );

  }


}
