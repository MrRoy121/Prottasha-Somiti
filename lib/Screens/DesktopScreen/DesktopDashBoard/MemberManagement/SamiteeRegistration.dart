import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../DashBoard.dart';


class SamiteeRegistration extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  SamiteeRegistration({required this.appbool, required this.navbool});

  @override
  State<SamiteeRegistration> createState() => _SamiteeRegistrationState();
}

class _SamiteeRegistrationState extends State<SamiteeRegistration> {


  @override
  Widget build(BuildContext context) {

    var ScreenWidth =MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight = MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    if(ResponsiveWidth > 1100){
      desktop = true;
      tablet = false;
      mobile = false;
    } else if (ResponsiveWidth > 500){
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
        
            desktop? Container( // for desktop
              width: 1400,
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
                    width: 1400,
                    height: 40,
                    color: navbarColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                              "Samitee Registration",
                            style: TextStyle(
                              color: AppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
        
                        Spacer(),
        
                        Container(
                          height: 40,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 15),
                            child: Text("✓ Save", style: TextStyle(color: Colors.white, fontSize: 14),),
                          ),
                          color: Colors.green,
                        ),
        
                        SizedBox(width: 10,),
        
                        Container(
                          height: 40,
                          width: 130,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3.0, left: 15),
                            child: Row(
                              children: [
                                Icon(Icons.list, color: Colors.white, size: 18,),
                                Text("Somitee List", style: TextStyle(color: Colors.white, fontSize: 14),),
                              ],
                            ),
                          ),
                          color: AppColor,
                        ),
        
                        SizedBox(width: 10,),
        
                        InkWell(
                          onTap: (){
                            Get.to(DesktopDashBoard(
                              appbool: widget.appbool,
                              navbool: widget.navbool,
                            ));
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
                        ),
        
                        SizedBox(width: 10,),
        
                      ],
                    ),
                  ),
        
                  Padding(
                    padding: EdgeInsets.only(top: ScreenWidth/30.72, left: ScreenWidth/15.26),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                    text: TextSpan(
                                      text: 'Somitee Name',
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
                                      border: OutlineInputBorder(),
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
                                RichText(
                                  text: TextSpan(
                                    text: 'Branch Name',
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

                                SizedBox(width: 15,),

                                SizedBox(
                                  width: 300,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ],
                        ),

                        SizedBox(
                          width: ScreenWidth/15.36,
                        ),

                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Phone',
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

                                SizedBox(width: 80,),

                                SizedBox(
                                  width: 300,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
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
                                RichText(
                                  text: TextSpan(
                                    text: 'Samitee Address',
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

                                SizedBox(width: 12,),

                                SizedBox(
                                  width: 300,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
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
                : tablet? Container( // for Tablet
              width: 1400,
              height: 450,
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
                            "Samitee Registration",
                            style: TextStyle(
                              color: AppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        Spacer(),

                        Container(
                          height: 40,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 15),
                            child: Text("✓ Save", style: TextStyle(color: Colors.white, fontSize: 14),),
                          ),
                          color: Colors.green,
                        ),

                        SizedBox(width: 10,),

                        Container(
                          height: 40,
                          width: 130,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3.0, left: 15),
                            child: Row(
                              children: [
                                Icon(Icons.list, color: Colors.white, size: 18,),
                                Text("Somitee List", style: TextStyle(color: Colors.white, fontSize: 14),),
                              ],
                            ),
                          ),
                          color: AppColor,
                        ),

                        SizedBox(width: 10,),

                        InkWell(
                          onTap: (){
                            Get.to(DesktopDashBoard(
                              appbool: widget.appbool,
                              navbool: widget.navbool,
                            ));
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
                        ),

                        SizedBox(width: 10,),

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: ScreenWidth/30.72, left: ScreenWidth/5.50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Somitee Name',
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

                                SizedBox(width: 30,),


                                SizedBox(
                                  width: 270,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
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
                                RichText(
                                  text: TextSpan(
                                    text: 'Branch Name',
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

                                SizedBox(width: 35,),

                                SizedBox(
                                  width: 270,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 40,
                        ),

                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Phone',
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

                                SizedBox(width: 80,),

                                SizedBox(
                                  width: 270,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
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
                                RichText(
                                  text: TextSpan(
                                    text: 'Samitee Address',
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

                                SizedBox(width: 12,),

                                SizedBox(
                                  width: 270,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
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
                : Container( // for Tablet
              width: 1400,
              height: 450,
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
                    // width: ScreenWidth/1.1,
                    width: 1400,
                    height: ScreenWidth/38.4,
                    color: navbarColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: ScreenWidth/38.4),
                          child: Text(
                            "Samitee Registration",
                            style: TextStyle(
                              color: AppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenWidth/128,
                            ),
                          ),
                        ),

                        Spacer(),

                        Container(
                          height: ScreenWidth/38.4,
                          width: ScreenWidth/19.2,
                          child: Padding(
                            padding: EdgeInsets.only(top: ScreenWidth/153.6, left: ScreenWidth/102.4),
                            child: Text("✓ Save", style: TextStyle(color: Colors.white, fontSize: ScreenWidth/153.6),),
                          ),
                          color: Colors.green,
                        ),

                        SizedBox(width: ScreenWidth/153.6,),

                        Container(
                          height: ScreenWidth/40,
                          width: ScreenWidth/11.82,
                          child: Padding(
                            padding: EdgeInsets.only(top: ScreenWidth/512, left: ScreenWidth/102.4),
                            child: Row(
                              children: [
                                Icon(Icons.list, color: Colors.white, size: ScreenWidth/102.4,),
                                Text("Somitee List", style: TextStyle(color: Colors.white, fontSize: ScreenWidth/153.6),),
                              ],
                            ),
                          ),
                          color: AppColor,
                        ),

                        SizedBox(width: ScreenWidth/153.6,),

                        InkWell(
                          onTap: (){
                            Get.to(DesktopDashBoard(
                              appbool: widget.appbool,
                              navbool: widget.navbool,
                            ));
                          },
                          child: Container(
                            height: ScreenWidth/38.4,
                            width: ScreenWidth/30.72,
                            child: Padding(
                              padding: EdgeInsets.only(top: ScreenWidth/153.6, left: ScreenWidth/76.8),
                              child: Text("X", style: TextStyle(color: Colors.white, fontSize: ScreenWidth/153.6),),
                            ),
                            color: Colors.red,
                          ),
                        ),

                        SizedBox(width: ScreenWidth/153.6,),

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: ScreenWidth/30.72, left: ScreenWidth/7.50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Somitee Name',
                                    style: TextStyle(color: Colors.black, fontSize: 10),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(color: Colors.black, fontSize: 14)),

                                    ],
                                  ),
                                ),

                                SizedBox(width: 20,),


                                SizedBox(
                                  width: 200,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
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
                                RichText(
                                  text: TextSpan(
                                    text: 'Branch Name',
                                    style: TextStyle(color: Colors.black, fontSize: 10),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 10)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(color: Colors.black, fontSize: 10)),

                                    ],
                                  ),
                                ),

                                SizedBox(width: 30,),

                                SizedBox(
                                  width: 200,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 40,
                        ),

                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Phone',
                                    style: TextStyle(color: Colors.black, fontSize: 10),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 10)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(color: Colors.black, fontSize: 10)),

                                    ],
                                  ),
                                ),

                                SizedBox(width: 60,),

                                SizedBox(
                                  width: 200,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
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
                                RichText(
                                  text: TextSpan(
                                    text: 'Samitee Address',
                                    style: TextStyle(color: Colors.black, fontSize: 10),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 10)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(color: Colors.black, fontSize: 10)),

                                    ],
                                  ),
                                ),

                                SizedBox(width: 12,),

                                SizedBox(
                                  width: 200,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
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
          ],
        ),
      ),

    );
  }
}
