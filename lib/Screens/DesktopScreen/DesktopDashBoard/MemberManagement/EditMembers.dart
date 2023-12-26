import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/SamiteeSelection.dart';


class EditMembers extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  EditMembers({required this.appbool, required this.navbool});

  @override
  State<EditMembers> createState() => _EditMembersState();
}

class _EditMembersState extends State<EditMembers> {
  var arr = [false, false, false, false, false, false, false, false, false];


  @override
  Widget build(BuildContext context) {
    _toglechnage(int index){
      setState(() {
        for(int i =0;i<arr.length;i++){
          arr[i] = false;
        }
        arr[index] = true;
      });
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
        
            SamiteeSelection(submit: false,),
        
        
            SizedBox(
              height: 50,
            ),
            
            NoDataFound(title: "Member General Report"),
        
        
          ],
        ),
      ),

    );
  }
}
