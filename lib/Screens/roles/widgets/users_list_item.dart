import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/User.dart';

class UsersListItem extends StatefulWidget {
  User cst;
  int index;
  UsersListItem(
      {required this.cst,
        required   this.index,
      });

  @override
  State<UsersListItem> createState() => _UsersListItemState();
}

class _UsersListItemState extends State<UsersListItem> {
 showDeleteDialog(BuildContext context) {
   // Widget cancelButton = TextButton(
   //   child: Text("Cancel"),
   //   onPressed:  () {Navigator.pop(context);},
   // );
   // Widget continueButton = TextButton(
   //   child: Text("Delete", style: TextStyle(color: Colors.red)),
   //   onPressed:  () {
   //     // FirebaseFirestore.instance.collection("Accounts").doc(widget.cst.uid).delete().then((value) {
   //     //   Navigator.pop(context);
   //     //   setState(() {
   //     //     widget.fetchDocuments();
   //     //   });
   //     // });
   //   },
   // );
   //
   // showDialog(
   //   context: context,
   //   builder: (BuildContext context) {
   //     return Padding(
   //       padding: const EdgeInsets.all(10.0),
   //       child: AlertDialog(
   //         title: Text("Confirmation To Delete!!", style: TextStyle(fontWeight: FontWeight.bold),),
   //         content: Padding(
   //           padding: const EdgeInsets.only(left: 2.0),
   //           child: Text("Permanently Delete the item ${widget.cst.name} from the list? "),
   //         ),
   //         actions: [
   //           cancelButton,
   //           continueButton,
   //         ],
   //       ),
   //     );
   //   },
   // );
 }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    (widget.index+1).toString(),
                    style: TextStyle(
                        fontSize: 12, color: Colors.black, fontFamily: 'inter'),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                   widget.cst.name,
                    style: TextStyle(
                        fontSize: 12, color: Colors.black, fontFamily: 'inter'),
                  ),
                ),
              ),
              Expanded(
                flex:4,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                    widget.cst.id,
                    style: TextStyle(
                        fontSize: 12, color: Colors.black, fontFamily: 'inter'),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                      DateFormat('dd/MM/yyyy HH:mm a').format(widget.cst.lastlogin),
                    style: TextStyle(
                        fontSize: 12, color: Colors.black, fontFamily: 'inter'),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                    DateFormat('dd/MM/yyyy HH:mm a').format(widget.cst.lastlogout),
                    style: TextStyle(
                        fontSize: 12, color: Colors.black, fontFamily: 'inter'),
                  ),
                ),
              ),
              Expanded(
                flex:3,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                    widget.cst.type,
                    style: TextStyle(
                        fontSize: 12, color: Colors.black, fontFamily: 'inter'),
                  ),
                ),
              ),
              Expanded(
                flex:3,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                    widget.cst.sts?"Enabled":"Disabled",
                    style: TextStyle(
                        fontSize: 12, color: Colors.black, fontFamily: 'inter'),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Align(

                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(right: _width/35, left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(100)),
                        color: Colors.grey.shade200,
                      ),
                      child: _width>830?Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: (){
                                showDeleteDialog(context);
                              },
                              child: Icon(
                                Icons.delete_outline,
                                size: _width/70,
                              )),
                        ],
                      ):Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              child: Icon(
                                Icons.edit_outlined,
                                size: _width/55,
                              )),
                          InkWell(
                              onTap: (){
                                showDeleteDialog(context);
                              },
                              child: Icon(
                                Icons.delete_outline,
                                size: _width/55,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: .2,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
