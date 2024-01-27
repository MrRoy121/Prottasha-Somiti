import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/somitee.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBool.dart';
import '../Widget/NavbarScreen.dart';

class ShamiteeList extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  ShamiteeList({required this.appbool, required this.navbool});

  @override
  State<ShamiteeList> createState() => _ShamiteeListState();
}

class _ShamiteeListState extends State<ShamiteeList> {
  void _onEditSomitee(Somitee cst) async {}

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
            name: element["Name"],closed: element["Closed"],
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

  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 160,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100, left: 50),
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
                              "Somitee List",
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
                      padding:  EdgeInsets.all(ScreenWidth/153.6),
                      child: FutureBuilder(
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
                                      color: Colors.black26, width: ScreenWidth/1536),
                                  headingRowColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColor_Blue),
                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        'SL',
                                        style: TextStyle(
                                          fontSize: ScreenWidth/153.6,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Somitee Code',
                                        style: TextStyle(
                                          fontSize: ScreenWidth/153.6,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text('Somitee Name',
                                          style: TextStyle(
                                            fontSize: ScreenWidth/153.6,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Branch Name',
                                          style: TextStyle(
                                            fontSize: ScreenWidth/153.6,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Phone',
                                        style: TextStyle(
                                          fontSize: ScreenWidth/153.6,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text('Address',
                                          style: TextStyle(
                                            fontSize: ScreenWidth/153.6,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                    DataColumn(
                                        label: Text(
                                      'Formation Date',
                                      style: TextStyle(
                                        fontSize: ScreenWidth/153.6,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )),
                                    DataColumn(
                                      label: Text('Last Updated',
                                          style: TextStyle(
                                            fontSize: ScreenWidth/153.6,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('Active Members',
                                          style: TextStyle(
                                            fontSize: ScreenWidth/153.6,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                    DataColumn(
                                      label: Text('ACTION',
                                          style: TextStyle(
                                            fontSize: ScreenWidth/153.6,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                  rows: List.generate(snapshot.data.length,
                                      (index) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Text((index + 1).toString(), style: TextStyle(
                                          fontSize: ScreenWidth/153.6,
                                        ))),
                                        DataCell(
                                          Text(snapshot.data[index].id, style: TextStyle(
                                            fontSize: ScreenWidth/153.6,
                                          )),
                                        ),
                                        DataCell(
                                            Text(snapshot.data[index].name, style: TextStyle(
                                              fontSize: ScreenWidth/153.6,
                                            ))),
                                        DataCell(
                                          Text(snapshot.data[index].branch, style: TextStyle(
                                            fontSize: ScreenWidth/153.6,
                                          )),
                                        ),
                                        DataCell(
                                          Text(snapshot.data[index].phone, style: TextStyle(
                                            fontSize: ScreenWidth/153.6,
                                          )),
                                        ),
                                        DataCell(
                                          Text(snapshot.data[index].address, style: TextStyle(
                                            fontSize: ScreenWidth/153.6,
                                          )),
                                        ),
                                        DataCell(
                                          Text(DateFormat.yMMMd().format(
                                              snapshot.data[index].formation), style: TextStyle(
                                            fontSize: ScreenWidth/153.6,
                                          )),
                                        ),
                                        DataCell(
                                          Text(DateFormat.yMMMd().format(
                                              snapshot
                                                  .data[index].lastupdated), style: TextStyle(
                                            fontSize: ScreenWidth/153.6,
                                          )),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(snapshot.data[index].active
                                                .toString(), style: TextStyle(
                                              fontSize: ScreenWidth/153.6,
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
                                                  child:  Icon(
                                                    Icons.edit_outlined,
                                                    size: ScreenWidth/96,
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
              NavbarScreen(
                appbool: widget.appbool,
                navbool: widget.navbool,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
