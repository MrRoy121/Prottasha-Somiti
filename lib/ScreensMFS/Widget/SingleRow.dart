import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../../Constants/values.dart';

class SingleRow extends StatefulWidget {
  final String heading;
  final String field1;
  final String field2;
  var membertype;
  void Function(int) setupmembertype;
  void Function(int) setupoccupationtype;
  var ocupation;
  SingleRow(
      {required this.field1,
      required this.membertype,
      required this.setupmembertype,
      required this.setupoccupationtype,
      required this.ocupation,
      required this.field2,
      required this.heading});

  @override
  State<SingleRow> createState() => _SingleRowState();
}

class _SingleRowState extends State<SingleRow> {
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

    return //desktop
        //?
    Container(
      width: ScreenWidth/1.0971,
      height: ScreenWidth/8.53,
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
            width: ScreenWidth/1.097,
            height: ScreenWidth/38.4,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: ScreenWidth/38.4),
                  child: Text(
                    widget.heading,
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenWidth/96,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: ScreenWidth/50.72, left: ScreenWidth/10.24),
            child: Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: widget.field1,
                            style: TextStyle(
                                color: Colors.black, fontSize: ScreenWidth/109.71),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' *',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: ScreenWidth/109.71),
                              ),
                              TextSpan(
                                text: ' :',
                                style: TextStyle(
                                    color: Colors.black, fontSize: ScreenWidth/109.71),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: ScreenWidth/153.6),
                        Container(
                          width: ScreenWidth/5.12,
                          height: ScreenWidth/30.72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColor_greyBorder,
                            border:
                            Border.all(color: AppColor_greyBorder),
                          ),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColor_greyBorder),
                              ),
                              hintText: "Select",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                                fontSize: ScreenWidth/109.71,
                              ),
                            ),
                            value: widget.membertype,
                            onChanged: (newValue) {
                              setState(() {
                                widget.membertype = newValue!;
                                widget.setupmembertype(
                                    MemberTypeList.indexOf(
                                        newValue.toString()));
                              });
                            },
                            items: MemberTypeList.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item, style: TextStyle(fontSize: ScreenWidth/109.71),),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: ScreenWidth/30.72),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: widget.field2,
                              style: TextStyle(
                                  color: Colors.black, fontSize: ScreenWidth/109.71),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' *',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: ScreenWidth/109.71)),
                                TextSpan(
                                    text: ' :',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenWidth/109.71)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width:500,
                            height: ScreenWidth/30.72,
                            child: DropdownButtonFormField<String>(
                              decoration:  InputDecoration(
                                filled: true,isDense: true,
                                fillColor: AppColor_greyBorder,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor_greyBorder),
                                ),
                                hintText: "Select",
                                hintStyle: TextStyle(
                                  color: AppColor_greyText,
                                  fontSize: ScreenWidth/109.71,
                                ),
                              ),
                              value: widget.ocupation,
                              onChanged: (newValue) {
                                setState(() {
                                  widget.ocupation = newValue!;
                                  widget.setupoccupationtype(
                                      SectorList.indexOf(
                                          newValue.toString()));
                                });
                              },
                              items: SectorList.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item, style: TextStyle(fontSize: ScreenWidth/109.71),),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
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
        //         height: 260,
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
        //                       widget.heading,
        //                       style: TextStyle(
        //                         color: AppColor,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 16,
        //                       ),
        //                     ),
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
        //                               text: widget.field1,
        //                               style: TextStyle(
        //                                   color: Colors.black, fontSize: 14),
        //                               children: <TextSpan>[
        //                                 TextSpan(
        //                                   text: ' *',
        //                                   style: TextStyle(
        //                                       fontWeight: FontWeight.bold,
        //                                       color: Colors.red,
        //                                       fontSize: 14),
        //                                 ),
        //                                 TextSpan(
        //                                   text: ' :',
        //                                   style: TextStyle(
        //                                       color: Colors.black,
        //                                       fontSize: 14),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                           SizedBox(width: 30),
        //                           Container(
        //                             width: 300,
        //                             decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(8.0),
        //                               color: AppColor_greyBorder,
        //                               border: Border.all(
        //                                   color: AppColor_greyBorder),
        //                             ),
        //                             child: DropdownButtonFormField<String>(
        //                               decoration: InputDecoration(
        //                                 filled: true,
        //                                 fillColor: AppColor_greyBorder,
        //                                 border: OutlineInputBorder(
        //                                   borderSide: BorderSide(
        //                                       color: AppColor_greyBorder),
        //                                 ),
        //                                 hintText: "Select",
        //                                 hintStyle: TextStyle(
        //                                   color: AppColor_greyText,
        //                                 ),
        //                               ),
        //                               value: widget.membertype,
        //                               onChanged: (newValue) {
        //                                 setState(() {
        //                                   widget.membertype = newValue!;
        //                                   widget.setupmembertype(
        //                                       MemberTypeList.indexOf(
        //                                           newValue.toString()));
        //                                 });
        //                               },
        //                               items: MemberTypeList.map((item) {
        //                                 return DropdownMenuItem(
        //                                   value: item,
        //                                   child: Text(item),
        //                                 );
        //                               }).toList(),
        //                             ),
        //                           )
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                   SizedBox(
        //                     height: 50,
        //                   ),
        //                   Column(
        //                     children: [
        //                       Row(
        //                         children: [
        //                           RichText(
        //                             text: TextSpan(
        //                               text: widget.field2,
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
        //                           SizedBox(
        //                             width: 300,
        //                             child: DropdownButtonFormField<String>(
        //                               decoration: InputDecoration(
        //                                 filled: true,
        //                                 fillColor: AppColor_greyBorder,
        //                                 border: OutlineInputBorder(
        //                                   borderSide: BorderSide(
        //                                       color: AppColor_greyBorder),
        //                                 ),
        //                                 hintText: "Select",
        //                                 hintStyle: TextStyle(
        //                                   color: AppColor_greyText,
        //                                 ),
        //                               ),
        //                               value: widget.ocupation,
        //                               onChanged: (newValue) {
        //                                 setState(() {
        //                                   widget.ocupation = newValue!;
        //                                   widget.setupoccupationtype(
        //                                       OcupationList.indexOf(
        //                                           newValue.toString()));
        //                                 });
        //                               },
        //                               items: OcupationList.map((item) {
        //                                 return DropdownMenuItem(
        //                                   value: item,
        //                                   child: Text(item),
        //                                 );
        //                               }).toList(),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
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
        //         height: 260,
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
        //                     padding: const EdgeInsets.only(left: 40.0),
        //                     child: Text(
        //                       widget.heading,
        //                       style: const TextStyle(
        //                         color: AppColor,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 10,
        //                       ),
        //                     ),
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
        //                               text: widget.field1,
        //                               style: TextStyle(
        //                                   color: Colors.black, fontSize: 8),
        //                               children: <TextSpan>[
        //                                 TextSpan(
        //                                   text: ' *',
        //                                   style: TextStyle(
        //                                       fontWeight: FontWeight.bold,
        //                                       color: Colors.red,
        //                                       fontSize: 8),
        //                                 ),
        //                                 TextSpan(
        //                                   text: ' :',
        //                                   style: TextStyle(
        //                                       color: Colors.black, fontSize: 8),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                           SizedBox(width: 30),
        //                           Container(
        //                             width: 200,
        //                             decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(8.0),
        //                               color: AppColor_greyBorder,
        //                               border: Border.all(
        //                                   color: AppColor_greyBorder),
        //                             ),
        //                             child: DropdownButtonFormField<String>(
        //                               decoration: const InputDecoration(
        //                                 filled: true,
        //                                 fillColor: AppColor_greyBorder,
        //                                 border: OutlineInputBorder(
        //                                   borderSide: BorderSide(
        //                                       color: AppColor_greyBorder),
        //                                 ),
        //                                 hintText: "Select",
        //                                 hintStyle: TextStyle(
        //                                   color: AppColor_greyText,
        //                                 ),
        //                               ),
        //                               value: widget.membertype,
        //                               onChanged: (newValue) {
        //                                 setState(() {
        //                                   widget.membertype = newValue!;
        //                                   widget.setupmembertype(
        //                                       MemberTypeList.indexOf(
        //                                           newValue.toString()));
        //                                 });
        //                               },
        //                               items: MemberTypeList.map((item) {
        //                                 return DropdownMenuItem(
        //                                   value: item,
        //                                   child: Text(item),
        //                                 );
        //                               }).toList(),
        //                             ),
        //                           )
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                   SizedBox(
        //                     height: 50,
        //                   ),
        //                   Column(
        //                     children: [
        //                       Row(
        //                         children: [
        //                           RichText(
        //                             text: TextSpan(
        //                               text: widget.field2,
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
        //                           SizedBox(
        //                             width: 200,
        //                             child: DropdownButtonFormField<String>(
        //                               decoration: const InputDecoration(
        //                                 filled: true,
        //                                 fillColor: AppColor_greyBorder,
        //                                 border: OutlineInputBorder(
        //                                   borderSide: BorderSide(
        //                                       color: AppColor_greyBorder),
        //                                 ),
        //                                 hintText: "Select",
        //                                 hintStyle: TextStyle(
        //                                   color: AppColor_greyText,
        //                                 ),
        //                               ),
        //                               value: widget.ocupation,
        //                               onChanged: (newValue) {
        //                                 setState(() {
        //                                   widget.ocupation = newValue!;
        //                                   widget.setupoccupationtype(
        //                                       OcupationList.indexOf(
        //                                           newValue.toString()));
        //                                 });
        //                               },
        //                               items: OcupationList.map((item) {
        //                                 return DropdownMenuItem(
        //                                   value: item,
        //                                   child: Text(item),
        //                                 );
        //                               }).toList(),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
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
