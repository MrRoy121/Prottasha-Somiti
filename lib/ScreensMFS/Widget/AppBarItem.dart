import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';


class AppbarItem extends StatefulWidget {
  bool flag;
  String text;
  var icon;

  AppbarItem({required this.text, required this.flag, required this.icon});

  @override
  State<AppbarItem> createState() => _AppbarItemState();
}

class _AppbarItemState extends State<AppbarItem> {


  @override
  Widget build(BuildContext context) {

    var ScreenWidth = MediaQuery.of(context).size.width;



    return SizedBox(
      width: ScreenWidth/7.68,
      child: Row(
        children: [SizedBox(
            width: ScreenWidth/48.4,
          ),
          Container(
              //width: mobile?  80:MediaQuery.of(context).size.width * 0.2 - 80,
            width: ScreenWidth/10.24,
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    // color: flag == true ? Colors.blue[50] : null,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  // margin: EdgeInsets.only(left: 10, top: 10),
                  padding: EdgeInsets.all(ScreenWidth/145.2),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        widget.icon,
                        size: ScreenWidth/90.75,
                        color: Colors.white,
                      ),
                      SizedBox(width: ScreenWidth/181.5),
                      Text(
                        widget.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: widget.flag ? FontWeight.bold : FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
