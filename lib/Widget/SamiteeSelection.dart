import 'package:flutter/material.dart';

import '../Constants/Constants.dart';

class SamiteeSelection extends StatefulWidget {

  bool submit = true;
  bool clear = true;
  bool close = true;
  bool selectmember = false;
  bool active = true;
  SamiteeSelection({required this.submit, required this.selectmember, required this.clear, required this.close, required this.active});

  @override
  State<SamiteeSelection> createState() => _SamiteeSelectionState();
}

class _SamiteeSelectionState extends State<SamiteeSelection> {


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

    return desktop? Container(
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
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
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

                widget.submit? Container(
                  height: 40,
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 15),
                    child: Text("✓ Submit", style: TextStyle(color: Colors.white, fontSize: 14),),
                  ),
                  color: Colors.green,
                ): Container(),

                SizedBox(width: 10,),

                widget.clear? Container(
                  height: 40,
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15),
                    child: Row(
                      children: [
                        Icon(Icons.clear_all_sharp, color: Colors.white, size: 18,),
                        SizedBox(width: 5,),
                        Text("Clear", style: TextStyle(color: Colors.white, fontSize: 14),),
                      ],
                    ),
                  ),
                  color: AppColor_yellow,
                ): Container(),

                SizedBox(width: 10,),

                widget.close? InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: 40,
                    width: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20),
                      child: Text("X", style: TextStyle(color: Colors.white, fontSize: 14),),
                    ),
                    color: Colors.red,
                  ),
                ): Container(),

                SizedBox(width: 10,),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50, left: 150),
            child: Row(

              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Select Samitee',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 14)),

                            ],
                          ),
                        ),

                        SizedBox(width: 10,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Somitee/ Code",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
                            ),
                          ),

                        ),

                      ],
                    ),

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Samitee Name :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 10,),


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

                        SizedBox(width: 15,),

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

                    SizedBox(height: 20,),

                    widget.selectmember ? Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Select Samitee',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 14)),

                            ],
                          ),
                        ),

                        SizedBox(width: 10,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Somitee/ Code",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
                            ),
                          ),

                        ),

                      ],
                    ): SizedBox(),
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

                          SizedBox(width: 80,),

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
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    widget.active? Row(
                      children: [
                        Text(
                          "Active Member :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 12,),

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
                    )
                    : Row(
                      children: [
                        Text(
                          "Closed Member :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 12,),

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
    )
    : tablet? Container(
      width: 1400,
      //height: 350,
      height: widget.selectmember ? 650 : 550,
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
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
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

                widget.submit? Container(
                  height: 40,
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 15),
                    child: Text("✓ Submit", style: TextStyle(color: Colors.white, fontSize: 14),),
                  ),
                  color: Colors.green,
                ): Container(),

                SizedBox(width: 10,),

                widget.clear? Container(
                  height: 40,
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15),
                    child: Row(
                      children: [
                        Icon(Icons.clear_all_sharp, color: Colors.white, size: 18,),
                        SizedBox(width: 5,),
                        Text("Clear", style: TextStyle(color: Colors.white, fontSize: 14),),
                      ],
                    ),
                  ),
                  color: AppColor_yellow,
                ): Container(),

                SizedBox(width: 10,),

                widget.close? InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: 40,
                    width: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20),
                      child: Text("X", style: TextStyle(color: Colors.white, fontSize: 14),),
                    ),
                    color: Colors.red,
                  ),
                ): Container(),

                SizedBox(width: 10,),

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 50, left: ScreenWidth/10.24),
            child: Column(

              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Select Samitee',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 14)),

                            ],
                          ),
                        ),

                        SizedBox(width: 10,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Somitee/ Code",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
                            ),
                          ),

                        ),

                      ],
                    ),

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Samitee Name :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 10,),


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

                        SizedBox(width: 15,),

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

                    SizedBox(height: 20,),

                    widget.selectmember ? Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Select Samitee',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 14)),

                            ],
                          ),
                        ),

                        SizedBox(width: 10,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Somitee/ Code",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
                            ),
                          ),

                        ),

                      ],
                    ): SizedBox(),
                  ],
                ),

                // SizedBox(
                //   width: 250,
                // ),

                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Samitee Address :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 70,),

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

                    SizedBox(
                      height: 40,
                    ),

                    widget.active? Row(
                      children: [
                        Text(
                          "Active Member :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 12,),

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
                    )
                        : Row(
                      children: [
                        Text(
                          "Closed Member :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 12,),

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
    )
    : Container(
      width: 1400,
      //height: 350,
      height: widget.selectmember ? 650 : 550,
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
            height: 30,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Samitee Selection",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),

                Spacer(),

                widget.submit? Container(
                  height: 30,
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 15),
                    child: Text("✓ Submit", style: TextStyle(color: Colors.white, fontSize: 8),),
                  ),
                  color: Colors.green,
                ): Container(),

                SizedBox(width: 10,),

                widget.clear? Container(
                  height: 30,
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15),
                    child: Row(
                      children: [
                        Icon(Icons.clear_all_sharp, color: Colors.white, size: 10,),
                        SizedBox(width: 5,),
                        Text("Clear", style: TextStyle(color: Colors.white, fontSize: 8),),
                      ],
                    ),
                  ),
                  color: AppColor_yellow,
                ): Container(),

                SizedBox(width: 10,),

                widget.close? InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: 30,
                    width: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20),
                      child: Text("X", style: TextStyle(color: Colors.white, fontSize: 8),),
                    ),
                    color: Colors.red,
                  ),
                ): Container(),

                SizedBox(width: 10,),

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 50, left: ScreenWidth/10.24),
            child: Column(

              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Select Samitee',
                            style: TextStyle(color: Colors.black, fontSize: 8),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 8)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 8)),

                            ],
                          ),
                        ),

                        SizedBox(width: 10,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Somitee/ Code",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                                fontSize: 8,
                              ),
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
                            ),
                          ),

                        ),

                      ],
                    ),

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Samitee Name :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 10,),


                        SizedBox(
                          width: 200,
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


                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        Text(
                          "Formation Date :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 15,),

                        SizedBox(
                          width: 200,
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

                    SizedBox(height: 20,),

                    widget.selectmember ? Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Select Samitee',
                            style: TextStyle(color: Colors.black, fontSize: 8),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 8)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 8)),

                            ],
                          ),
                        ),

                        SizedBox(width: 10,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Somitee/ Code",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                                fontSize: 8,
                              ),
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
                            ),
                          ),

                        ),

                      ],
                    ): SizedBox(),
                  ],
                ),

                // SizedBox(
                //   width: 250,
                // ),

                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Samitee Address :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 55,),

                        SizedBox(
                          width: 200,
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

                    SizedBox(
                      height: 40,
                    ),

                    widget.active? Row(
                      children: [
                        Text(
                          "Active Member :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 12,),

                        SizedBox(
                          width: 200,
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
                    )
                        : Row(
                      children: [
                        Text(
                          "Closed Member :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 12,),

                        SizedBox(
                          width: 200,
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
  }
}
