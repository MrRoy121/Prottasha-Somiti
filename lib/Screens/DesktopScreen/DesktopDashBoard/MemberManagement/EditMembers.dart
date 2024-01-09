import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/somitee.dart';
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
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  var selectedsomiti;
  var sselectedsomiti;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    await FirebaseFirestore.instance
        .collection('Somitee')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        somitee.add(Somitee(
            address: element["Address"],
            id: element.id,
            lastupdated: element["Last Edited"].toDate(),
            name: element["Name"],
            active: element["Active"],
            formation: element["Formation Date"].toDate(),
            phone: element["Phone"],
            branch: element["Branch"],
            sl: 0));
        ssomitee.add(element["Name"]);
      }
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      selectedsomiti = ss;
      sselectedsomiti = ss;
    });
  }

  @override
  Widget build(BuildContext context) {

    void _setupsomiti(int ins){
      setState(() {
        selectedsomiti = somitee[ins];
      });
    }

    Future<List<Somitee>> getCust() async {
      List<Somitee> somitee = [];
      int s = 1;
      await FirebaseFirestore.instance
          .collection('Somitee')
          .get()
          .then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          somitee.add(Somitee(
              address: element["Address"],
              id: element.id,
              lastupdated: element["Last Edited"].toDate(),
              name: element["Name"],
              active: element["Active"],
              formation: element["Formation Date"].toDate(),
              phone: element["Phone"],
              branch: element["Branch"],
              sl: s));
          s++;
        }
      });
      return somitee;
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

            SamiteeSelection(
                submit: false,
                selectmember: false,
                clear: true,
                ssomitee: ssomitee,
                close: true,setupsomiti: _setupsomiti,
                active: true,
                selectedsomiteeid: selectedsomiti,
                onsubmit: (){},
                somitee: somitee,
                onclear: _onclear,
                selectedsomitee: sselectedsomiti),


            SizedBox(
              height: 50,
            ),

            Container(
              width: 1400,
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
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text(
                            "Member General Report",
                            style: TextStyle(
                              color: AppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: selectedsomiti == null? Center(
                      child: Text("No Somitee Is Selected.."),
                    ):FutureBuilder(
                      builder: (ctx, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text("No Somitee Data Available.."),
                            );
                          } else if (snapshot.hasData) {
                            return MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: DataTable(
                                showCheckboxColumn: false,
                                border: TableBorder.all(
                                    color: Colors.black26, width: 1),
                                headingRowColor:
                                MaterialStateProperty.all<Color>(
                                    AppColor_Blue),
                                columns: const [
                                  DataColumn(
                                    label: Text(
                                      'SL',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Somitee Code',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text('Somitee Name',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Branch Name',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Phone',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text('Address',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                      label: Text(
                                        'Formation Date',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )),
                                  DataColumn(
                                    label: Text('Last Updated',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('Active Members',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataColumn(
                                    label: Text('ACTION',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                                rows: List.generate(snapshot.data.length,
                                        (index) {
                                      return DataRow(
                                        cells: [
                                          DataCell(Text((index + 1).toString(), style: const TextStyle(
                                            fontSize: 12,
                                          ))),
                                          DataCell(
                                            Text(snapshot.data[index].id, style: TextStyle(
                                              fontSize: 12,
                                            )),
                                          ),
                                          DataCell(
                                              Text(snapshot.data[index].name, style: TextStyle(
                                                fontSize: 12,
                                              ))),
                                          DataCell(
                                            Text(snapshot.data[index].branch, style: TextStyle(
                                              fontSize: 12,
                                            )),
                                          ),
                                          DataCell(
                                            Text(snapshot.data[index].phone, style: TextStyle(
                                              fontSize: 12,
                                            )),
                                          ),
                                          DataCell(
                                            Text(snapshot.data[index].address, style: TextStyle(
                                              fontSize: 12,
                                            )),
                                          ),
                                          DataCell(
                                            Text(DateFormat.yMMMd().format(
                                                snapshot.data[index].formation), style: TextStyle(
                                              fontSize: 12,
                                            )),
                                          ),
                                          DataCell(
                                            Text(DateFormat.yMMMd().format(
                                                snapshot
                                                    .data[index].lastupdated), style: TextStyle(
                                              fontSize: 12,
                                            )),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Text(snapshot.data[index].active
                                                  .toString(), style: TextStyle(
                                                fontSize: 12,
                                              )),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: InkWell(
                                                onTap: () {
                                                  // _onEditSomitee(widget.cst);
                                                },
                                                child: Container(
                                                    padding: EdgeInsets.all(4.0),
                                                    decoration: BoxDecoration(
                                                        color: AppColor_Blue,
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                    child: const Icon(
                                                      Icons.edit_outlined,
                                                      size: 16,
                                                      color: AppColor_White,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            );
                          }
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      future: getCust(),
                    ),
                  ),
                ],
              ),
            ),
        
          ],
        ),
      ),

    );
  }
}
