import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/Constants.dart';

class BasicInfoWidget extends StatefulWidget {
  String title;
  void Function() onsubmit;
  void Function() onclear;
  void Function() onduplecate;

  BasicInfoWidget({required this.title,required this.onclear,required this.onduplecate,required this.onsubmit,});

  @override
  State<BasicInfoWidget> createState() => _BasicInfoWidgetState();
}

class _BasicInfoWidgetState extends State<BasicInfoWidget> {


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


    return Column(
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
                  widget.title,
                  style: TextStyle(
                    color: AppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),


              Spacer(),


              InkWell(
                onTap: (){
                  Get.back();
                  },
                child: Container(
                  height: 40,
                  width: 110,
                  color: Colors.blueAccent,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15),
                    child: Row(
                      children: [
                        Icon(Icons.fast_rewind, color: Colors.white, size: 18,),
                        SizedBox(width: 5,),
                        Text("Previous", style: TextStyle(color: Colors.white, fontSize: 14),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),


              InkWell(
                onTap: (){
                  widget.onduplecate();},
                child: Container(
                  height: 40,
                  width: 180,
                  color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 3.0, left: 15),
                    child: Row(
                      children: [
                        Icon(Icons.content_paste_search, color: Colors.white, size: 18,),
                        SizedBox(width: 5,),
                        Text("Duplicate Checking", style: TextStyle(color: Colors.white, fontSize: 14),),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10,),

              InkWell(onTap: (){
                widget.onclear();},
                child: Container(
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
                ),
              ),

              SizedBox(width: 10,),
              InkWell(onTap: (){
                widget.onsubmit();},
                child: Container(
                  height: 40,
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15),
                    child: Row(
                      children: [
                        Icon(Icons.fast_forward, color: Colors.white, size: 18,),
                        SizedBox(width: 5,),
                        Text("Next", style: TextStyle(color: Colors.white, fontSize: 14),),
                      ],
                    ),
                  ),
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 10,),

            ],
          ),
        ),
      ],
    );
  }
}
