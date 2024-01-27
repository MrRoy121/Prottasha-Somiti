import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';

class NoticeWidget extends StatefulWidget {
  final String noticeTitle;
  final String description;
  final String data;
  final String time;
  const NoticeWidget({required this.noticeTitle, required this.description, required this.data, required this.time});

  @override
  State<NoticeWidget> createState() => _NoticeWidgetState();
}

class _NoticeWidgetState extends State<NoticeWidget> {


  @override
  Widget build(BuildContext context) {

    var ScreenWidth =MediaQuery.of(context).size.width;
    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight = MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;
    // bool srink = false;

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

    // if(tablet && ResponsiveWidth<520){
    //   srink = true;
    // }



    return SingleChildScrollView(
      child: desktop? Container( // For Desktop
        decoration: BoxDecoration(
          color: AppColor_second,
          borderRadius: BorderRadius.circular(10.0),

        ),
        padding: EdgeInsets.only(top: ScreenWidth/51.2, left: ScreenWidth/76.8, right: ScreenWidth/76.8, bottom: ScreenWidth/51.2),
        margin: EdgeInsets.only(top: ScreenWidth/51.2),
        // color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.noticeTitle,
              style: TextStyle(
                color: AppColor_green,
                fontSize: ScreenWidth/76.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: ScreenWidth/153.6,),
            Text(
              widget.description,
              style: TextStyle(
                color: AppColor,

                fontSize: ScreenWidth/109.71,
              ),
            ),
            SizedBox(
              height: ScreenWidth/76.8,
            ),

            Row(
              children: [
                Icon(Icons.calendar_month_sharp, color: AppColor_green,size: ScreenWidth/96,),
                SizedBox(width: ScreenWidth/307.2,),
                Text(
                  "Published Date: ",
                  style: TextStyle(
                    fontSize: ScreenWidth/128,
                    color: AppColor_red,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: ScreenWidth/307.2),
                Text(
                  widget.data,
                  style: TextStyle(
                    fontSize: ScreenWidth/128,
                    color: AppColor_green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),

                Text(
                  "Published Time: ",
                  style: TextStyle(
                    fontSize: ScreenWidth/128,
                    color: AppColor_red,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: ScreenWidth/307.2,),
                Text(
                  widget.time,
                  style: TextStyle(
                    fontSize: ScreenWidth/128,
                    color: AppColor_green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )

          ],
        ),

      )
      : tablet? Container( // for Tablet
        decoration: BoxDecoration(
          color: AppColor_second,
          borderRadius: BorderRadius.circular(10.0),

        ),
        padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
        margin: EdgeInsets.only(top: 30),
        // color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.noticeTitle,
              style: TextStyle(
                color: AppColor_green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              widget.description,
              style: TextStyle(
                color: AppColor,

                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Icon(Icons.calendar_month_sharp, color: AppColor_green,size: 16,),
                SizedBox(width: 5,),
                Text(
                  "Published Date: ",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor_red,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  widget.data,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor_green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),

                Text(
                  "Published Time: ",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor_red,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5,),
                Text(
                  widget.time,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor_green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )

          ],
        ),

      )
      :Container( // for Tablet
        decoration: BoxDecoration(
          color: AppColor_second,
          borderRadius: BorderRadius.circular(10.0),

        ),
        padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
        margin: EdgeInsets.only(top: 30),
        // color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.noticeTitle,
              style: TextStyle(
                color: AppColor_green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              widget.description,
              style: TextStyle(
                color: AppColor,

                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Icon(Icons.calendar_month_sharp, color: AppColor_green,size: 16,),
                SizedBox(width: 5,),
                Text(
                  "Published Date: ",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor_red,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  widget.data,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor_green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),


              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text(
                  "Published Time: ",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor_red,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5,),
                Text(
                  widget.time,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor_green,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),

          ],
        ),

      ),
    );
  }
}
