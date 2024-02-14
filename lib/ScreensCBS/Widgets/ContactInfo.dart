import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../../Constants/values.dart';

class ContactInfo extends StatefulWidget {
  bool selectedmember;
  var memberss;
  ContactInfo({
    required this.memberss,
    required this.selectedmember,
  });

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight =
        MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    // if (ResponsiveWidth > 1ScreenWidth/38.40) {
    //   desktop = true;
    //   tablet = false;
    //   mobile = false;
    // } else if (ResponsiveWidth > 5ScreenWidth/38.4) {
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
      width: ScreenWidth / 1.0971,
      height: 300,
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
            width: ScreenWidth / 1.0971,
            height: ScreenWidth / 38.4,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: ScreenWidth / 38.4),
                  child: Text(
                    "Contact Information",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenWidth / 96,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenWidth / 30.72, left: ScreenWidth / 10.24),
            child: Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Mobile No Type :",
                          style: TextStyle(
                            fontSize: ScreenWidth / 109.71,
                          ),
                        ),
                        SizedBox(
                          width: ScreenWidth / 76.8,
                        ),
                        SizedBox(
                          width: ScreenWidth / 5.12,
                          child: Text(
                            widget.selectedmember
                                ? widget.memberss.mobilenotype
                                : "",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenWidth / 38.4,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Present Address',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: ScreenWidth / 109.71)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenWidth / 109.71)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: ScreenWidth / 102.4,
                        ),
                        SizedBox(
                          width: ScreenWidth / 5.12,
                          child: Text(
                            widget.selectedmember
                                ? widget.memberss.presentadd
                                : "",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: ScreenWidth / 10.24,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Mobile No',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: ScreenWidth / 109.71)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenWidth / 109.71)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: ScreenWidth / 19.2,
                        ),
                        SizedBox(
                          width: ScreenWidth / 5.12,
                          child: Text(
                            widget.selectedmember
                                ? widget.memberss.mobilenno
                                : "",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenWidth / 38.4,
                    ),
                    Row(
                      children: [
                        Text(
                          "Permanent Address :",
                          style: TextStyle(fontSize: ScreenWidth / 109.71),
                        ),
                        SizedBox(
                          width: ScreenWidth / 61.44,
                        ),
                        SizedBox(
                          width: ScreenWidth / 5.12,
                          child: Text(
                            widget.selectedmember
                                ? widget.memberss.parmaadd
                                : "",
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
    //         width: 1ScreenWidth/38.40,
    //         height: 600,
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
    //               width: 1ScreenWidth/38.40,
    //               height: ScreenWidth/38.4,
    //               color: navbarColor,
    //               child: Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Padding(
    //                     padding: EdgeInsets.only(left: ScreenWidth/38.4.0),
    //                     child: Text(
    //                       "Contact Information",
    //                       style: TextStyle(
    //                         color: AppColor,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: ScreenWidth/96,
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
    //                             "Mobile No Type :",
    //                             style: TextStyle(
    //                               fontSize: ScreenWidth/109.71,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 45,
    //                           ),
    //                           SizedBox(
    //                             width: ScreenWidth/5.12,
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
    //                               value: widget.mobiletype,
    //                               onChanged: (newValue) {
    //                                 setState(() {
    //                                   widget.setupmobileType(MobileTypeList.indexOf(newValue!));
    //                                 });
    //                               },
    //                               items: MobileTypeList
    //                                   .map((item) {
    //                                 return DropdownMenuItem(
    //                                   value: item,
    //                                   child: Text(item),
    //                                 );
    //                               }).toList(),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: ScreenWidth/38.4,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Present Address',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: ScreenWidth/109.71),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: ScreenWidth/109.71)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: ScreenWidth/109.71)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: ScreenWidth/38.4,
    //                           ),
    //                           SizedBox(
    //                             width: ScreenWidth/5.12,
    //                             child: TextField(controller: widget.preseentaddress,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
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
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Mobile No',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: ScreenWidth/109.71),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: ScreenWidth/109.71)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: ScreenWidth/109.71)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 80,
    //                           ),
    //                           SizedBox(
    //                             width: ScreenWidth/5.12,
    //                             child: TextField(controller: widget.mobileno,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: ScreenWidth/38.4,
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "Permanent Address :",
    //                             style: TextStyle(fontSize: ScreenWidth/109.71),
    //                           ),
    //                           SizedBox(
    //                             width: 25,
    //                           ),
    //                           SizedBox(
    //                             width: ScreenWidth/5.12,
    //                             child: TextField(controller: widget.parmaaddress,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                               ),
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
    //         width: 1ScreenWidth/38.40,
    //         height: 600,
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
    //               width: 1ScreenWidth/38.40,
    //               height: 30,
    //               color: navbarColor,
    //               child: Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Padding(
    //                     padding: EdgeInsets.only(left: ScreenWidth/38.4.0),
    //                     child: Text(
    //                       "Contact Information",
    //                       style: TextStyle(
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
    //                           Text(
    //                             "Mobile No Type :",
    //                             style: TextStyle(
    //                               fontSize: 8,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 45,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
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
    //                               value: widget.mobiletype,
    //                               onChanged: (newValue) {
    //                                 setState(() {
    //                                   widget.setupmobileType(MobileTypeList.indexOf(newValue!));
    //                                 });
    //                               },
    //                               items: MobileTypeList
    //                                   .map((item) {
    //                                 return DropdownMenuItem(
    //                                   value: item,
    //                                   child: Text(item),
    //                                 );
    //                               }).toList(),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: ScreenWidth/38.4,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Present Address',
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
    //                             width: ScreenWidth/38.4,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: TextField(controller: widget.preseentaddress,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
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
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Mobile No',
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
    //                             width: 50,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: TextField(controller: widget.mobileno,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: ScreenWidth/38.4,
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "Permanent Address :",
    //                             style: TextStyle(
    //                               fontSize: 8,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 25,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: TextField(controller: widget.parmaaddress,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                               ),
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
