import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prottashasomit/Model/member.dart';

import '../../../Constants/Constants.dart';
import '../../Model/somitee.dart';

class SamiteeSelectionUpdate extends StatefulWidget {
  List<Somitee> somitee;
  List<String> ssomitee;
  var selectedsomitee;
  var selectedsomiteeid;
  Memberss mst;
  void Function(Memberss) onsubmit;
  void Function() onclear;
  void Function(int) setupsomiti;
  bool submit = true;
  bool clear = true;
  bool close = true;
  bool selectmember = false;
  bool active = true;
  SamiteeSelectionUpdate(
      {required this.submit,
      required this.onclear,
        required this.mst,
      required this.setupsomiti,
      required this.somitee,
      required this.ssomitee,
      required this.selectedsomitee,
      required this.selectedsomiteeid,
      required this.onsubmit,
      required this.selectmember,
      required this.clear,
      required this.close,
      required this.active});

  @override
  State<SamiteeSelectionUpdate> createState() => _SamiteeSelectionUpdateState();
}

class _SamiteeSelectionUpdateState extends State<SamiteeSelectionUpdate> {
  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight =
        MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    if (ResponsiveWidth > 1400) {
      desktop = true;
      tablet = false;
      mobile = false;
    } else if (ResponsiveWidth > 540) {
      tablet = true;
      desktop = false;
      mobile = false;
    } else {
      mobile = true;
      desktop = false;
      tablet = false;
    }

    return
        // desktop
        //   ?
        Container(
      width: 1400,
      //height: 350,
      height: widget.selectmember ? 450 : 350,
      // color: Colors.white,

      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        children: [
          Container(
            width: 1400,
            height: 40,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Samitee Selection",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Spacer(),
                widget.submit
                    ? InkWell(
                        onTap: () {
                          widget.onsubmit(widget.mst);
                        },
                        child: Container(
                          height: 40,
                          width: 90,
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 15),
                            child: Text(
                              "✓ Update",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(
                  width: 10,
                ),
                widget.clear
                    ? InkWell(
                        onTap: () {
                          widget.onclear();
                        },
                        child: Container(
                          height: 40,
                          width: 90,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3.0, left: 15),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.clear_all_sharp,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Clear",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          color: AppColor_yellow,
                        ),
                      )
                    : Container(),
                SizedBox(
                  width: 10,
                ),
                widget.close
                    ? InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 20),
                            child: Text(
                              "X",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          color: Colors.red,
                        ),
                      )
                    : Container(),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 150),
            child: Row(
              children: [
                Column(
                  children: [
                    // Row(
                    //   children: [
                    //     RichText(
                    //       text: const TextSpan(
                    //         text: 'Select Samitee',
                    //         style: TextStyle(color: Colors.black, fontSize: 14),
                    //         children: <TextSpan>[
                    //           TextSpan(
                    //               text: ' *',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.red,
                    //                   fontSize: 14)),
                    //           TextSpan(
                    //               text: ' :',
                    //               style: TextStyle(
                    //                   color: Colors.black, fontSize: 14)),
                    //         ],
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Container(
                    //         width: 300,
                    //         padding: EdgeInsets.symmetric(horizontal: 20),
                    //         decoration: BoxDecoration(
                    //           color: AppColor_greyBorder,
                    //           border: Border.all(color: AppColor_Black),
                    //         ),
                    //         child: DropdownSearch<String>(
                    //           popupProps: PopupProps.menu(
                    //             showSearchBox: true,
                    //             itemBuilder: (BuildContext context, String item,
                    //                 bool isSelected) {
                    //               return Container(
                    //                 padding: EdgeInsets.all(15),
                    //                 child: Text(
                    //                   item,
                    //                 ),
                    //               );
                    //             },
                    //             fit: FlexFit.loose,
                    //             showSelectedItems: false,
                    //             menuProps: const MenuProps(
                    //               backgroundColor: Colors.white,
                    //               elevation: 100,
                    //             ),
                    //             searchFieldProps: const TextFieldProps(
                    //               style: TextStyle(fontSize: 12),
                    //               decoration: InputDecoration(
                    //                 isDense: true,
                    //                 hintText: "Search...",
                    //               ),
                    //             ),
                    //           ),
                    //           dropdownDecoratorProps:
                    //               const DropDownDecoratorProps(
                    //             dropdownSearchDecoration: InputDecoration(
                    //               enabledBorder: UnderlineInputBorder(
                    //                 borderSide:
                    //                     BorderSide(color: Colors.transparent),
                    //               ),
                    //               focusedBorder: UnderlineInputBorder(
                    //                 borderSide:
                    //                     BorderSide(color: Colors.transparent),
                    //               ),
                    //             ),
                    //           ),
                    //           dropdownBuilder: (context, selectedItem) {
                    //             if (selectedItem == null) {
                    //               return const Text(
                    //                 "Enter Somitee/Code",
                    //               );
                    //             } else {
                    //               return Text(
                    //                 selectedItem,
                    //               );
                    //             }
                    //           },
                    //           onChanged: (newValue) {
                    //             setState(() {
                    //               widget.selectedsomitee = newValue;
                    //               widget.selectedsomiteeid = widget.somitee[
                    //                   widget.ssomitee.indexOf(newValue!)];
                    //               widget.setupsomiti(
                    //                   widget.ssomitee.indexOf(newValue));
                    //             });
                    //           },
                    //           items: widget.ssomitee,
                    //           selectedItem: widget.selectedsomitee,
                    //         )),
                    //   ],
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Samitee Name :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            widget.selectedsomiteeid !=null
                                ? widget.selectedsomiteeid.name
                                : "",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          "Formation Date :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            widget.selectedsomiteeid !=null
                                ? DateFormat.yMMMd().format(widget.selectedsomiteeid.formation)
                                : "",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // widget.selectmember
                    //     ? Row(
                    //         children: [
                    //           RichText(
                    //             text: TextSpan(
                    //               text: 'Select Samitee',
                    //               style: TextStyle(
                    //                   color: Colors.black, fontSize: 14),
                    //               children: <TextSpan>[
                    //                 TextSpan(
                    //                     text: ' *',
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.red,
                    //                         fontSize: 14)),
                    //                 TextSpan(
                    //                     text: ' :',
                    //                     style: TextStyle(
                    //                         color: Colors.black, fontSize: 14)),
                    //               ],
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             width: 10,
                    //           ),
                    //           Container(
                    //               width: 300,
                    //               padding: EdgeInsets.symmetric(horizontal: 20),
                    //               decoration: BoxDecoration(
                    //                 color: AppColor_greyBorder,
                    //                 border: Border.all(color: AppColor_Black),
                    //               ),
                    //               child: DropdownSearch<String>(
                    //                 popupProps: PopupProps.menu(
                    //                   showSearchBox: true,
                    //                   itemBuilder: (BuildContext context,
                    //                       String item, bool isSelected) {
                    //                     return Container(
                    //                       padding: EdgeInsets.all(15),
                    //                       child: Text(
                    //                         item,
                    //                       ),
                    //                     );
                    //                   },
                    //                   fit: FlexFit.loose,
                    //                   showSelectedItems: false,
                    //                   menuProps: const MenuProps(
                    //                     backgroundColor: Colors.white,
                    //                     elevation: 100,
                    //                   ),
                    //                   searchFieldProps: const TextFieldProps(
                    //                     style: TextStyle(fontSize: 12),
                    //                     decoration: InputDecoration(
                    //                       isDense: true,
                    //                       hintText: "Search...",
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 dropdownDecoratorProps:
                    //                     const DropDownDecoratorProps(
                    //                   dropdownSearchDecoration: InputDecoration(
                    //                     enabledBorder: UnderlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                     focusedBorder: UnderlineInputBorder(
                    //                       borderSide: BorderSide(
                    //                           color: Colors.transparent),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 dropdownBuilder: (context, selectedItem) {
                    //                   if (selectedItem == null) {
                    //                     return const Text(
                    //                       "Enter Somitee/Code",
                    //                     );
                    //                   } else {
                    //                     return Text(
                    //                       selectedItem,
                    //                     );
                    //                   }
                    //                 },
                    //                 onChanged: (newValue) {
                    //                   setState(() {
                    //                     widget.selectedsomitee = newValue;
                    //                     widget.setupsomiti(
                    //                         widget.ssomitee.indexOf(newValue!));
                    //                     widget.selectedsomiteeid = widget
                    //                             .somitee[
                    //                         widget.ssomitee.indexOf(newValue!)];
                    //                   });
                    //                 },
                    //                 items: widget.ssomitee,
                    //                 selectedItem: widget.selectedsomitee,
                    //               )),
                    //         ],
                    //       )
                    //     : SizedBox(),
                  ],
                ),
                SizedBox(
                  width: 250,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Text(
                            "Samitee Address :",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(
                              widget.selectedsomiteeid !=null
                                  ? widget.selectedsomiteeid.address
                                  : "",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    widget.active
                        ? Row(
                            children: [
                              const Text(
                                "Active Member :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.selectedsomiteeid !=null
                                      ? widget.selectedsomiteeid.active.toString()
                                      : "",
                                ),
                              ),
                            ],
                          )
                        : const Row(
                            children: [
                              Text(
                                "Closed Member :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
    // : tablet
    //     ? Container(
    //         width: 1400,
    //         //height: 350,
    //         height: widget.selectmember ? 650 : 550,
    //         // color: Colors.white,
    //
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.grey.withOpacity(0.3),
    //               spreadRadius: 2,
    //               blurRadius: 5,
    //               offset: Offset(0, 2),
    //             ),
    //           ],
    //         ),
    //
    //         child: Column(
    //           children: [
    //             Container(
    //               width: 1400,
    //               height: 40,
    //               color: navbarColor,
    //               child: Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(left: 40.0),
    //                     child: Text(
    //                       "Samitee Selection",
    //                       style: TextStyle(
    //                         color: AppColor,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 16,
    //                       ),
    //                     ),
    //                   ),
    //                   Spacer(),
    //                   widget.submit
    //                       ? InkWell(
    //                           onTap: () {
    //                             widget.onsubmit();
    //                           },
    //                           child: Container(
    //                             height: 40,
    //                             width: 90,
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(
    //                                   top: 10.0, left: 15),
    //                               child: Text(
    //                                 "✓ Submit",
    //                                 style: TextStyle(
    //                                     color: Colors.white, fontSize: 14),
    //                               ),
    //                             ),
    //                             color: Colors.green,
    //                           ),
    //                         )
    //                       : Container(),
    //                   SizedBox(
    //                     width: 10,
    //                   ),
    //                   widget.clear
    //                       ? InkWell(
    //                           onTap: () {
    //                             widget.onclear();
    //                           },
    //                           child: Container(
    //                             height: 40,
    //                             width: 90,
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(
    //                                   top: 3.0, left: 15),
    //                               child: Row(
    //                                 children: [
    //                                   Icon(
    //                                     Icons.clear_all_sharp,
    //                                     color: Colors.white,
    //                                     size: 18,
    //                                   ),
    //                                   SizedBox(
    //                                     width: 5,
    //                                   ),
    //                                   Text(
    //                                     "Clear",
    //                                     style: TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 14),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                             color: AppColor_yellow,
    //                           ),
    //                         )
    //                       : Container(),
    //                   SizedBox(
    //                     width: 10,
    //                   ),
    //                   widget.close
    //                       ? InkWell(
    //                           onTap: () {
    //                             Get.back();
    //                           },
    //                           child: Container(
    //                             height: 40,
    //                             width: 50,
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(
    //                                   top: 10.0, left: 20),
    //                               child: Text(
    //                                 "X",
    //                                 style: TextStyle(
    //                                     color: Colors.white, fontSize: 14),
    //                               ),
    //                             ),
    //                             color: Colors.red,
    //                           ),
    //                         )
    //                       : Container(),
    //                   SizedBox(
    //                     width: 10,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding:
    //                   EdgeInsets.only(top: 50, left: ScreenWidth / 10.24),
    //               child: Column(
    //                 children: [
    //                   Column(
    //                     children: [
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Select Samitee',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: 14),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: 14)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 14)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 10,
    //                           ),
    //                           Container(
    //                               width: 300,
    //                               padding:
    //                                   EdgeInsets.symmetric(horizontal: 20),
    //                               decoration: BoxDecoration(
    //                                 color: AppColor_greyBorder,
    //                                 border:
    //                                     Border.all(color: AppColor_Black),
    //                               ),
    //                               child: DropdownSearch<String>(
    //                                 popupProps: PopupProps.menu(
    //                                   showSearchBox: true,
    //                                   itemBuilder: (BuildContext context,
    //                                       String item, bool isSelected) {
    //                                     return Container(
    //                                       padding: EdgeInsets.all(15),
    //                                       child: Text(
    //                                         item,
    //                                       ),
    //                                     );
    //                                   },
    //                                   fit: FlexFit.loose,
    //                                   showSelectedItems: false,
    //                                   menuProps: const MenuProps(
    //                                     backgroundColor: Colors.white,
    //                                     elevation: 100,
    //                                   ),
    //                                   searchFieldProps:
    //                                       const TextFieldProps(
    //                                     style: TextStyle(fontSize: 12),
    //                                     decoration: InputDecoration(
    //                                       isDense: true,
    //                                       hintText: "Search...",
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 dropdownDecoratorProps:
    //                                     const DropDownDecoratorProps(
    //                                   dropdownSearchDecoration:
    //                                       InputDecoration(
    //                                     enabledBorder: UnderlineInputBorder(
    //                                       borderSide: BorderSide(
    //                                           color: Colors.transparent),
    //                                     ),
    //                                     focusedBorder: UnderlineInputBorder(
    //                                       borderSide: BorderSide(
    //                                           color: Colors.transparent),
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 dropdownBuilder:
    //                                     (context, selectedItem) {
    //                                   if (selectedItem == null) {
    //                                     return const Text(
    //                                       "Enter Somitee/Code",
    //                                     );
    //                                   } else {
    //                                     return Text(
    //                                       selectedItem,
    //                                     );
    //                                   }
    //                                 },
    //                                 onChanged: (newValue) {
    //                                   setState(() {
    //                                     widget.selectedsomitee = newValue;
    //                                     widget.setupsomiti( widget.ssomitee.indexOf(newValue!));
    //                                     widget.selectedsomiteeid =
    //                                         widget.somitee[widget.ssomitee
    //                                             .indexOf(newValue)];
    //                                     widget.somiteename =
    //                                         widget.selectedsomiteeid.name;
    //                                     widget.somiteeaddre =
    //                                         widget.selectedsomiteeid.address;
    //                                     widget.formationdate = DateFormat.yMMMd()
    //                                         .format(widget
    //                                             .selectedsomiteeid.formation);
    //                                     widget.activemember = widget
    //                                         .selectedsomiteeid.active
    //                                         .toString();
    //                                   });
    //                                 },
    //                                 items: widget.ssomitee,
    //                                 selectedItem: widget.selectedsomitee,
    //                               )),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 30,
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "Samitee Name :",
    //                             style: TextStyle(
    //                               fontSize: 14,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 10,
    //                           ),
    //                           SizedBox(
    //                             width: 300,
    //                             child: Text(
    //                               widget.somiteename,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 40,
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "Formation Date :",
    //                             style: TextStyle(
    //                               fontSize: 14,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 15,
    //                           ),
    //                           SizedBox(
    //                             width: 300,
    //                             child: Text(
    //                               widget.formationdate,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       widget.selectmember
    //                           ? Row(
    //                               children: [
    //                                 RichText(
    //                                   text: TextSpan(
    //                                     text: 'Select Samitee',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 14),
    //                                     children: <TextSpan>[
    //                                       TextSpan(
    //                                           text: ' *',
    //                                           style: TextStyle(
    //                                               fontWeight:
    //                                                   FontWeight.bold,
    //                                               color: Colors.red,
    //                                               fontSize: 14)),
    //                                       TextSpan(
    //                                           text: ' :',
    //                                           style: TextStyle(
    //                                               color: Colors.black,
    //                                               fontSize: 14)),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 SizedBox(
    //                                   width: 10,
    //                                 ),
    //                                 Container(
    //                                     width: 300,
    //                                     padding: EdgeInsets.symmetric(
    //                                         horizontal: 20),
    //                                     decoration: BoxDecoration(
    //                                       color: AppColor_greyBorder,
    //                                       border: Border.all(
    //                                           color: AppColor_Black),
    //                                     ),
    //                                     child: DropdownSearch<String>(
    //                                       popupProps: PopupProps.menu(
    //                                         showSearchBox: true,
    //                                         itemBuilder:
    //                                             (BuildContext context,
    //                                                 String item,
    //                                                 bool isSelected) {
    //                                           return Container(
    //                                             padding: EdgeInsets.all(15),
    //                                             child: Text(
    //                                               item,
    //                                             ),
    //                                           );
    //                                         },
    //                                         fit: FlexFit.loose,
    //                                         showSelectedItems: false,
    //                                         menuProps: const MenuProps(
    //                                           backgroundColor: Colors.white,
    //                                           elevation: 100,
    //                                         ),
    //                                         searchFieldProps:
    //                                             const TextFieldProps(
    //                                           style:
    //                                               TextStyle(fontSize: 12),
    //                                           decoration: InputDecoration(
    //                                             isDense: true,
    //                                             hintText: "Search...",
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       dropdownDecoratorProps:
    //                                           const DropDownDecoratorProps(
    //                                         dropdownSearchDecoration:
    //                                             InputDecoration(
    //                                           enabledBorder:
    //                                               UnderlineInputBorder(
    //                                             borderSide: BorderSide(
    //                                                 color:
    //                                                     Colors.transparent),
    //                                           ),
    //                                           focusedBorder:
    //                                               UnderlineInputBorder(
    //                                             borderSide: BorderSide(
    //                                                 color:
    //                                                     Colors.transparent),
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       dropdownBuilder:
    //                                           (context, selectedItem) {
    //                                         if (selectedItem == null) {
    //                                           return const Text(
    //                                             "Enter Somitee/Code",
    //                                           );
    //                                         } else {
    //                                           return Text(
    //                                             selectedItem,
    //                                           );
    //                                         }
    //                                       },
    //                                       onChanged: (newValue) {
    //                                         setState(() {
    //                                           widget.selectedsomitee =
    //                                               newValue;
    //                                           widget.setupsomiti( widget.ssomitee.indexOf(newValue!));
    //                                           widget.selectedsomiteeid =
    //                                               widget.somitee[widget
    //                                                   .ssomitee
    //                                                   .indexOf(newValue!)];
    //                                           widget.somiteename = widget
    //                                               .selectedsomiteeid.name;
    //                                           widget.somiteeaddre = widget
    //                                               .selectedsomiteeid.address;
    //                                           widget.formationdate =
    //                                               DateFormat.yMMMd().format(
    //                                                   widget.selectedsomiteeid
    //                                                       .formation);
    //                                           widget.activemember = widget
    //                                               .selectedsomiteeid.active
    //                                               .toString();
    //                                         });
    //                                       },
    //                                       items: widget.ssomitee,
    //                                       selectedItem:
    //                                           widget.selectedsomitee,
    //                                     )),
    //                               ],
    //                             )
    //                           : SizedBox(),
    //                     ],
    //                   ),
    //
    //                   // SizedBox(
    //                   //   width: 250,
    //                   // ),
    //
    //                   Column(
    //                     children: [
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "Samitee Address :",
    //                             style: TextStyle(
    //                               fontSize: 14,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 70,
    //                           ),
    //                           SizedBox(
    //                             width: 300,
    //                             child: Text(
    //                               widget.somiteeaddre,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 40,
    //                       ),
    //                       widget.active
    //                           ? Row(
    //                               children: [
    //                                 Text(
    //                                   "Active Member :",
    //                                   style: TextStyle(
    //                                     fontSize: 14,
    //                                   ),
    //                                 ),
    //                                 SizedBox(
    //                                   width: 12,
    //                                 ),
    //                                 SizedBox(
    //                                   width: 300,
    //                                   child: Text(
    //                                     widget.activemember,
    //                                   ),
    //                                 ),
    //                               ],
    //                             )
    //                           : Row(
    //                               children: [
    //                                 Text(
    //                                   "Closed Member :",
    //                                   style: TextStyle(
    //                                     fontSize: 14,
    //                                   ),
    //                                 ),
    //                                 SizedBox(
    //                                   width: 12,
    //                                 ),
    //                                 SizedBox(
    //                                   width: 300,
    //                                   child: TextField(
    //                                     readOnly: true,
    //                                     decoration: InputDecoration(
    //                                       border: OutlineInputBorder(
    //                                         borderSide: BorderSide.none,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       )
    //     : Container(
    //         width: 1400,
    //         //height: 350,
    //         height: widget.selectmember ? 650 : 550,
    //         // color: Colors.white,
    //
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.grey.withOpacity(0.3),
    //               spreadRadius: 2,
    //               blurRadius: 5,
    //               offset: Offset(0, 2),
    //             ),
    //           ],
    //         ),
    //
    //         child: Column(
    //           children: [
    //             Container(
    //               width: 1400,
    //               height: 30,
    //               color: navbarColor,
    //               child: Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Padding(
    //                     padding: EdgeInsets.only(left: 40.0),
    //                     child: Text(
    //                       "Samitee Selection",
    //                       style: TextStyle(
    //                         color: AppColor,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 10,
    //                       ),
    //                     ),
    //                   ),
    //                   Spacer(),
    //                   widget.submit
    //                       ? InkWell(
    //                           onTap: () {
    //                             widget.onsubmit();
    //                           },
    //                           child: Container(
    //                             height: 30,
    //                             width: 70,
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(
    //                                   top: 10.0, left: 15),
    //                               child: Text(
    //                                 "✓ Submit",
    //                                 style: TextStyle(
    //                                     color: Colors.white, fontSize: 8),
    //                               ),
    //                             ),
    //                             color: Colors.green,
    //                           ),
    //                         )
    //                       : Container(),
    //                   SizedBox(
    //                     width: 10,
    //                   ),
    //                   widget.clear
    //                       ? InkWell(
    //                           onTap: () {
    //                             widget.onclear();
    //                           },
    //                           child: Container(
    //                             height: 30,
    //                             width: 70,
    //                             color: AppColor_yellow,
    //                             child: const Padding(
    //                               padding:
    //                                   EdgeInsets.only(top: 3.0, left: 15),
    //                               child: Row(
    //                                 children: [
    //                                   Icon(
    //                                     Icons.clear_all_sharp,
    //                                     color: Colors.white,
    //                                     size: 10,
    //                                   ),
    //                                   SizedBox(
    //                                     width: 5,
    //                                   ),
    //                                   Text(
    //                                     "Clear",
    //                                     style: TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 8),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         )
    //                       : Container(),
    //                   SizedBox(
    //                     width: 10,
    //                   ),
    //                   widget.close
    //                       ? InkWell(
    //                           onTap: () {
    //                             Get.back();
    //                           },
    //                           child: Container(
    //                             height: 30,
    //                             width: 40,
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(
    //                                   top: 10.0, left: 20),
    //                               child: Text(
    //                                 "X",
    //                                 style: TextStyle(
    //                                     color: Colors.white, fontSize: 8),
    //                               ),
    //                             ),
    //                             color: Colors.red,
    //                           ),
    //                         )
    //                       : Container(),
    //                   SizedBox(
    //                     width: 10,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding:
    //                   EdgeInsets.only(top: 50, left: ScreenWidth / 10.24),
    //               child: Column(
    //                 children: [
    //                   Column(
    //                     children: [
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Select Samitee',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: 8),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: 8)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 8)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 10,
    //                           ),
    //                           Container(
    //                               width: 200,
    //                               padding:
    //                                   EdgeInsets.symmetric(horizontal: 20),
    //                               decoration: BoxDecoration(
    //                                 color: AppColor_greyBorder,
    //                                 border:
    //                                     Border.all(color: AppColor_Black),
    //                               ),
    //                               child: DropdownSearch<String>(
    //                                 popupProps: PopupProps.menu(
    //                                   showSearchBox: true,
    //                                   itemBuilder: (BuildContext context,
    //                                       String item, bool isSelected) {
    //                                     return Container(
    //                                       padding: EdgeInsets.all(15),
    //                                       child: Text(
    //                                         item,
    //                                       ),
    //                                     );
    //                                   },
    //                                   fit: FlexFit.loose,
    //                                   showSelectedItems: false,
    //                                   menuProps: const MenuProps(
    //                                     backgroundColor: Colors.white,
    //                                     elevation: 100,
    //                                   ),
    //                                   searchFieldProps:
    //                                       const TextFieldProps(
    //                                     style: TextStyle(fontSize: 12),
    //                                     decoration: InputDecoration(
    //                                       isDense: true,
    //                                       hintText: "Search...",
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 dropdownDecoratorProps:
    //                                     const DropDownDecoratorProps(
    //                                   dropdownSearchDecoration:
    //                                       InputDecoration(
    //                                     enabledBorder: UnderlineInputBorder(
    //                                       borderSide: BorderSide(
    //                                           color: Colors.transparent),
    //                                     ),
    //                                     focusedBorder: UnderlineInputBorder(
    //                                       borderSide: BorderSide(
    //                                           color: Colors.transparent),
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 dropdownBuilder:
    //                                     (context, selectedItem) {
    //                                   if (selectedItem == null) {
    //                                     return const Text(
    //                                       "Enter Somitee/Code",
    //                                     );
    //                                   } else {
    //                                     return Text(
    //                                       selectedItem,
    //                                     );
    //                                   }
    //                                 },
    //                                 onChanged: (newValue) {
    //                                   setState(() {
    //                                     widget.selectedsomitee = newValue;
    //                                     widget.setupsomiti( widget.ssomitee.indexOf(newValue!));
    //                                     widget.selectedsomiteeid =
    //                                         widget.somitee[widget.ssomitee
    //                                             .indexOf(newValue!)];
    //                                     widget.somiteename =
    //                                         widget.selectedsomiteeid.name;
    //                                     widget.somiteeaddre =
    //                                         widget.selectedsomiteeid.address;
    //                                     widget.formationdate = DateFormat.yMMMd()
    //                                         .format(widget
    //                                             .selectedsomiteeid.formation);
    //                                     widget.activemember = widget
    //                                         .selectedsomitee.active
    //                                         .toString();
    //                                   });
    //                                 },
    //                                 items: widget.ssomitee,
    //                                 selectedItem: widget.selectedsomitee,
    //                               )),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 30,
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "Samitee Name :",
    //                             style: TextStyle(
    //                               fontSize: 8,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 10,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: Text(
    //                               widget.somiteename,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 40,
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "Formation Date :",
    //                             style: TextStyle(
    //                               fontSize: 8,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 15,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: Text(
    //                               widget.formationdate,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       widget.selectmember
    //                           ? Row(
    //                               children: [
    //                                 RichText(
    //                                   text: TextSpan(
    //                                     text: 'Select Samitee',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 8),
    //                                     children: <TextSpan>[
    //                                       TextSpan(
    //                                           text: ' *',
    //                                           style: TextStyle(
    //                                               fontWeight:
    //                                                   FontWeight.bold,
    //                                               color: Colors.red,
    //                                               fontSize: 8)),
    //                                       TextSpan(
    //                                           text: ' :',
    //                                           style: TextStyle(
    //                                               color: Colors.black,
    //                                               fontSize: 8)),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 SizedBox(
    //                                   width: 10,
    //                                 ),
    //                                 Container(
    //                                     width: 200,
    //                                     padding: EdgeInsets.symmetric(
    //                                         horizontal: 20),
    //                                     decoration: BoxDecoration(
    //                                       color: AppColor_greyBorder,
    //                                       border: Border.all(
    //                                           color: AppColor_Black),
    //                                     ),
    //                                     child: DropdownSearch<String>(
    //                                       popupProps: PopupProps.menu(
    //                                         showSearchBox: true,
    //                                         itemBuilder:
    //                                             (BuildContext context,
    //                                                 String item,
    //                                                 bool isSelected) {
    //                                           return Container(
    //                                             padding: EdgeInsets.all(15),
    //                                             child: Text(
    //                                               item,
    //                                             ),
    //                                           );
    //                                         },
    //                                         fit: FlexFit.loose,
    //                                         showSelectedItems: false,
    //                                         menuProps: const MenuProps(
    //                                           backgroundColor: Colors.white,
    //                                           elevation: 100,
    //                                         ),
    //                                         searchFieldProps:
    //                                             const TextFieldProps(
    //                                           style:
    //                                               TextStyle(fontSize: 12),
    //                                           decoration: InputDecoration(
    //                                             isDense: true,
    //                                             hintText: "Search...",
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       dropdownDecoratorProps:
    //                                           const DropDownDecoratorProps(
    //                                         dropdownSearchDecoration:
    //                                             InputDecoration(
    //                                           enabledBorder:
    //                                               UnderlineInputBorder(
    //                                             borderSide: BorderSide(
    //                                                 color:
    //                                                     Colors.transparent),
    //                                           ),
    //                                           focusedBorder:
    //                                               UnderlineInputBorder(
    //                                             borderSide: BorderSide(
    //                                                 color:
    //                                                     Colors.transparent),
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       dropdownBuilder:
    //                                           (context, selectedItem) {
    //                                         if (selectedItem == null) {
    //                                           return const Text(
    //                                             "Enter Somitee/Code",
    //                                           );
    //                                         } else {
    //                                           return Text(
    //                                             selectedItem,
    //                                           );
    //                                         }
    //                                       },
    //                                       onChanged: (newValue) {
    //                                         setState(() {
    //                                           widget.selectedsomitee =
    //                                               newValue;
    //                                           widget.setupsomiti( widget.ssomitee.indexOf(newValue!));
    //                                           widget.selectedsomiteeid =
    //                                               widget.somitee[widget
    //                                                   .ssomitee
    //                                                   .indexOf(newValue!)];
    //                                           widget.somiteename = widget
    //                                               .selectedsomiteeid.name;
    //                                        widget.somiteeaddre = widget
    //                                               .selectedsomiteeid.address;
    //                                           widget.formationdate =
    //                                               DateFormat.yMMMd().format(
    //                                                   widget.selectedsomiteeid
    //                                                       .formation);
    //                                           widget.activemember = widget
    //                                               .selectedsomiteeid.active
    //                                               .toString();
    //                                         });
    //                                       },
    //                                       items: widget.ssomitee,
    //                                       selectedItem:
    //                                           widget.selectedsomitee,
    //                                     )),
    //                               ],
    //                             )
    //                           : SizedBox(),
    //                     ],
    //                   ),
    //
    //                   // SizedBox(
    //                   //   width: 250,
    //                   // ),
    //
    //                   Column(
    //                     children: [
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "Samitee Address :",
    //                             style: TextStyle(
    //                               fontSize: 8,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 55,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: Text(
    //                               widget.somiteeaddre,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 40,
    //                       ),
    //                       widget.active
    //                           ? Row(
    //                               children: [
    //                                 Text(
    //                                   "Active Member :",
    //                                   style: TextStyle(
    //                                     fontSize: 8,
    //                                   ),
    //                                 ),
    //                                 SizedBox(
    //                                   width: 12,
    //                                 ),
    //                                 SizedBox(
    //                                   width: 200,
    //                                   child: Text(
    //                                     widget.activemember,
    //                                   ),
    //                                 ),
    //                               ],
    //                             )
    //                           : Row(
    //                               children: [
    //                                 Text(
    //                                   "Closed Member :",
    //                                   style: TextStyle(
    //                                     fontSize: 8,
    //                                   ),
    //                                 ),
    //                                 SizedBox(
    //                                   width: 12,
    //                                 ),
    //                                 SizedBox(
    //                                   width: 200,
    //                                   child: TextField(
    //                                     readOnly: true,
    //                                     decoration: InputDecoration(
    //                                       border: OutlineInputBorder(
    //                                         borderSide: BorderSide.none,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
  }
}
