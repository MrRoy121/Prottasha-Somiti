import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';

class OtherInfo2CBS extends StatefulWidget {
  var selecteddictatorship;
  var selectedRelatedParty;
  void Function(int) setupRelatedParty;
  void Function(int) setupdictatorship;

  OtherInfo2CBS(
      {required this.selecteddictatorship,
      required this.selectedRelatedParty,
        required this.setupdictatorship,
        required this.setupRelatedParty,
        });

  @override
  State<OtherInfo2CBS> createState() => OtherInfo2CBSState();
}

class OtherInfo2CBSState extends State<OtherInfo2CBS> {
  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight =
        MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    // if (ResponsiveWidth > 1200) {
    //   desktop = true;
    //   tablet = false;
    //   mobile = false;
    // } else if (ResponsiveWidth > 520) {
    //   tablet = true;
    //   desktop = false;
    //   mobile = false;
    // } else {
    //   mobile = true;
    //   desktop = false;
    //   tablet = false;
    // }

    return //desktop
        //?
    Container(
      width: ScreenWidth/1.0971,
      height: 160,
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
            width: ScreenWidth/1.0971,
            height: 50,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Other’s Information",
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
            padding: EdgeInsets.only(top: ScreenWidth/30.72, left: ScreenWidth/10.24),
            child: Row(
              children: [
                Column(children: [
                  Row(
                    children: [
                      Text(
                        "Dictatorship :",
                        style: TextStyle(fontSize: ScreenWidth/109.71),
                      ),
                      SizedBox(width: ScreenWidth/8.084),
                      Row(
                        children: [
                          Radio(
                            value: 'Yes',
                            groupValue: widget.selecteddictatorship,
                            onChanged: (value) {
                              setState(() {
                                widget.selecteddictatorship = value.toString();
                                widget.setupdictatorship(1);
                              });
                            },
                          ),
                          Text('Yes', style: TextStyle(fontSize: ScreenWidth/109.71),),
                          SizedBox(width: 10),
                          Radio(
                            value: 'No',
                            groupValue: widget.selecteddictatorship,
                            onChanged: (value) {
                              setState(() {
                                widget.selecteddictatorship = value.toString();
                                widget.setupdictatorship(2);
                              });
                            },
                          ),
                          Text('No',  style: TextStyle(fontSize: ScreenWidth/109.71),),
                        ],
                      ),
                    ],
                  ),],
                ),
                SizedBox(
                  width: ScreenWidth/15.36,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Related Party :",
                          style: TextStyle(fontSize: ScreenWidth/109.71),
                        ),
                        SizedBox(width: ScreenWidth/8.54),
                        Row(
                          children: [
                            Radio(
                              value: 'Yes',
                              groupValue: widget.selectedRelatedParty,
                              onChanged: (value) {
                                setState(() {
                                  widget.selectedRelatedParty = value.toString();
                                  widget.setupRelatedParty(1);
                                });
                              },
                            ),
                            Text('Yes', style: TextStyle(fontSize: ScreenWidth/109.71),),
                            SizedBox(width: 10),
                            Radio(
                              value: 'No',
                              groupValue: widget.selectedRelatedParty,
                              onChanged: (value) {
                                setState(() {
                                  widget.selectedRelatedParty = value.toString();
                                  widget.setupRelatedParty(2);
                                });
                              },
                            ),
                            Text('No', style: TextStyle(fontSize: ScreenWidth/109.71),),
                          ],
                        ),
                      ],
                    ),],
                ),
              ],
            ),
          ),
        ],
      ),
    );
        // : tablet
        //     ? Container(
        //         width: 1200,
        //         height: 1080,
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
        //               width: 1200,
        //               height: 20,
        //               color: navbarColor,
        //               child: Row(
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Padding(
        //                     padding: EdgeInsets.only(left: 20.0),
        //                     child: Text(
        //                       "Other’s Information",
        //                       style: TextStyle(
        //                         color: AppColor,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 12,
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
        //                           Text(
        //                             "Living Period (Pr. Address) :",
        //                             style: TextStyle(fontSize: 8),
        //                           ),
        //                           SizedBox(
        //                             width: 55,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.livingperiod,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "No of Male Earner :",
        //                             style: TextStyle(fontSize: 8),
        //                           ),
        //                           SizedBox(
        //                             width: 90,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.nomaleearner,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "Head of Family :",
        //                             style: TextStyle(fontSize: 8),
        //                           ),
        //                           SizedBox(width: 190),
        //                           Row(
        //                             children: [
        //                               Radio(
        //                                 value: 'Yes',
        //                                 groupValue: widget.selecteddictatorship,
        //                                 onChanged: (value) {
        //                                   setState(() {
        //                                     widget.selecteddictatorship = value.toString();
        //                                     widget.setupdictatorship(1);
        //                                   });
        //                                 },
        //                               ),
        //                               Text(
        //                                 'Yes',
        //                                 style: TextStyle(
        //                                   fontSize: 8,
        //                                 ),
        //                               ),
        //                               SizedBox(width: 10),
        //                               Radio(
        //                                 value: 'No',
        //                                 groupValue: widget.selecteddictatorship,
        //                                 onChanged: (value) {
        //                                   setState(() {
        //                                     widget.selecteddictatorship = value.toString();
        //                                     widget.setupdictatorship(2);
        //                                   });
        //                                 },
        //                               ),
        //                               Text(
        //                                 'No',
        //                                 style: TextStyle(
        //                                   fontSize: 8,
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "Own Homestead :",
        //                             style: TextStyle(fontSize: 8),
        //                           ),
        //                           SizedBox(width: 180),
        //                           Row(
        //                             children: [
        //                               Radio(
        //                                 value: 'Yes',
        //                                 groupValue: widget.selectedRelatedParty,
        //                                 onChanged: (value) {
        //                                   setState(() {
        //                                     widget.selectedRelatedParty = value.toString();
        //                                     widget.setupRelatedParty(1);
        //                                   });
        //                                 },
        //                               ),
        //                               Text(
        //                                 'Yes',
        //                                 style: TextStyle(
        //                                   fontSize: 8,
        //                                 ),
        //                               ),
        //                               SizedBox(width: 10),
        //                               Radio(
        //                                 value: 'No',
        //                                 groupValue: widget.selectedRelatedParty,
        //                                 onChanged: (value) {
        //                                   setState(() {
        //                                     widget.selectedRelatedParty = value.toString();
        //                                     widget.setupRelatedParty(2);
        //                                   });
        //                                 },
        //                               ),
        //                               Text(
        //                                 'No',
        //                                 style: TextStyle(
        //                                   fontSize: 8,
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           RichText(
        //                             text: TextSpan(
        //                               text: 'House Description :',
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
        //                             width: 80,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.housedesc,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
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
        //                           Text(
        //                             "Annual Income :",
        //                             style: TextStyle(
        //                               fontSize: 8,
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: 100,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.annualincome,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "No of female Earner :",
        //                             style: TextStyle(
        //                               fontSize: 8,
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: 80,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.nofemaleearner,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "Relation with Head of Family :",
        //                             style: TextStyle(
        //                               fontSize: 8,
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: 55,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.relationwithhead,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "Land Description :",
        //                             style: TextStyle(
        //                               fontSize: 8,
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: 110,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.landdesc,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "Remarks: ",
        //                             style: TextStyle(
        //                               fontSize: 8,
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: 135,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.remarks,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       )
        //     : Container(
        //         width: 1200,
        //         height: 1080,
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
        //               width: 1200,
        //               height: 20,
        //               color: navbarColor,
        //               child: Row(
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Padding(
        //                     padding: EdgeInsets.only(left: 20.0),
        //                     child: Text(
        //                       "Other’s Information",
        //                       style: TextStyle(
        //                         color: AppColor,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 12,
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
        //                           Text(
        //                             "Living Period (Pr. Address) :",
        //                             style: TextStyle(fontSize: 8),
        //                           ),
        //                           SizedBox(
        //                             width: 5,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.livingperiod,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "No of Male Earner :",
        //                             style: TextStyle(fontSize: 8),
        //                           ),
        //                           SizedBox(
        //                             width: 20,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.nomaleearner,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "Head of Family :",
        //                             style: TextStyle(fontSize: 8),
        //                           ),
        //                           SizedBox(width: 120),
        //                           Row(
        //                             children: [
        //                               Radio(
        //                                 value: 'Yes',
        //                                 groupValue: widget.selecteddictatorship,
        //                                 onChanged: (value) {
        //                                   setState(() {
        //                                     widget.selecteddictatorship = value.toString();
        //                                     widget.setupdictatorship(1);
        //                                   });
        //                                 },
        //                               ),
        //                               Text(
        //                                 'Yes',
        //                                 style: TextStyle(
        //                                   fontSize: 8,
        //                                 ),
        //                               ),
        //                               SizedBox(width: 10),
        //                               Radio(
        //                                 value: 'No',
        //                                 groupValue: widget.selecteddictatorship,
        //                                 onChanged: (value) {
        //                                   setState(() {
        //                                     widget.selecteddictatorship = value.toString();
        //                                     widget.setupdictatorship(2);
        //                                   });
        //                                 },
        //                               ),
        //                               Text(
        //                                 'No',
        //                                 style: TextStyle(
        //                                   fontSize: 8,
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "Own Homestead :",
        //                             style: TextStyle(fontSize: 8),
        //                           ),
        //                           SizedBox(width: 130),
        //                           Row(
        //                             children: [
        //                               Radio(
        //                                 value: 'Yes',
        //                                 groupValue: widget.selectedRelatedParty,
        //                                 onChanged: (value) {
        //                                   setState(() {
        //                                     widget.selectedRelatedParty = value.toString();
        //                                     widget.setupRelatedParty(1);
        //                                   });
        //                                 },
        //                               ),
        //                               Text(
        //                                 'Yes',
        //                                 style: TextStyle(
        //                                   fontSize: 8,
        //                                 ),
        //                               ),
        //                               SizedBox(width: 10),
        //                               Radio(
        //                                 value: 'No',
        //                                 groupValue: widget.selectedRelatedParty,
        //                                 onChanged: (value) {
        //                                   setState(() {
        //                                     widget.selectedRelatedParty = value.toString();
        //                                     widget.setupRelatedParty(2);
        //                                   });
        //                                 },
        //                               ),
        //                               Text(
        //                                 'No',
        //                                 style: TextStyle(
        //                                   fontSize: 8,
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           RichText(
        //                             text: TextSpan(
        //                               text: 'House Description :',
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
        //                             width: 30,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.housedesc,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
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
        //                           Text(
        //                             "Annual Income :",
        //                             style: TextStyle(
        //                               fontSize: 8,
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: 50,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.annualincome,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "No of female Earner :",
        //                             style: TextStyle(
        //                               fontSize: 8,
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: 30,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.nofemaleearner,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "Relation with Head of Family :",
        //                             style: TextStyle(
        //                               fontSize: 8,
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: 5,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.relationwithhead,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "Land Description :",
        //                             style: TextStyle(
        //                               fontSize: 8,
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: 55,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.landdesc,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text(
        //                             "Remarks: ",
        //                             style: TextStyle(
        //                               fontSize: 8,
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: 85,
        //                           ),
        //                           SizedBox(
        //                             width: 200,
        //                             child: TextField(controller: widget.remarks,
        //                               decoration: InputDecoration(
        //                                 border: OutlineInputBorder(),
        //                                 contentPadding:
        //                                     EdgeInsets.symmetric(vertical: 2),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       );
  }
}
