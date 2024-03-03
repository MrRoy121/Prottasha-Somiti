import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:prottashasomit/route.dart';
import '../../../Constants/Constants.dart';
import '../../Screens/Widgets/NavItem.dart';
import '../../helpers/auth_service.dart';
import 'NavBoolCBS.dart';

class NavbarCBS extends AppBar {
  NavboolCBS navbool;
  Function(int) toglechnage;
  NavbarCBS({required this.navbool, required this.toglechnage, Key? key})
      : super(key: key);

  @override
  State<NavbarCBS> createState() => _NavbarCBSState();
}

class _NavbarCBSState extends State<NavbarCBS> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 60,
          color: navbarColor,
          // padding: EdgeInsets.symmetric(horizontal: 15),
          child: MediaQuery.of(context).size.width >= 1536
              ? Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.toglechnage(0);
                        });
                      },
                      child: NavbarItem(
                          flag: widget.navbool.customer,
                          text: 'Customer',
                          icon: Icons.arrow_drop_down),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.toglechnage(1);
                        });
                      },
                      child: NavbarItem(
                          flag: widget.navbool.acmanagement,
                          text: 'A/C Management',
                          icon: Icons.arrow_drop_down),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.toglechnage(2);
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
                          widget.toglechnage(3);
                        });
                      },
                      child: NavbarItem(
                          flag: widget.navbool.loanadvance,
                          text: 'Loan & Advances',
                          icon: Icons.arrow_drop_down),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(dailyopenclosePageRoute);
                      },
                      child: NavbarItem(
                          flag: widget.navbool.processing,
                          text: 'Processing',
                          icon: Icons.arrow_drop_down),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.toglechnage(4);
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
                            Dialog(
                              alignment: Alignment.topRight,
                              insetPadding: const EdgeInsets.only(
                                top: 100,
                              ),
                              child: Container(
                                color: navbarColor,
                                // height: 800,
                                width: 200,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.toglechnage(0);
                                        });
                                      },
                                      child: NavbarItem(
                                          flag: widget.navbool.customer,
                                          text: 'Customer',
                                          icon: Icons.arrow_drop_down),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.toglechnage(1);
                                        });
                                      },
                                      child: NavbarItem(
                                          flag: widget.navbool.acmanagement,
                                          text: 'A/C Management',
                                          icon: Icons.arrow_drop_down),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.toglechnage(2);
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
                                          widget.toglechnage(3);
                                        });
                                      },
                                      child: NavbarItem(
                                          flag: widget.navbool.loanadvance,
                                          text: 'Loan & Advances',
                                          icon: Icons.arrow_drop_down),
                                    ),
                                    AuthService.to.user!.type ==
                                        "Super Admin"?InkWell(
                                      onTap: () {
                                        Get.toNamed(dailyopenclosePageRoute);
                                      },
                                      child: NavbarItem(
                                          flag: widget.navbool.processing,
                                          text: 'Processing',
                                          icon: Icons.arrow_drop_down),
                                    ):SizedBox(),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.toglechnage(4);
                                        });
                                      },
                                      child: NavbarItem(
                                          flag: widget.navbool.reports,
                                          text: 'Reports',
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
                      )),
                ),
        ),
      ],
    );
  }
}
