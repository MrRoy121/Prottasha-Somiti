import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopDashBoard/MemberManagement/widget/somitee_list_item.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/somitee.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/SamiteeSelection.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 160,
          child: Column(
            children: [
              NavbarScreen(
                appbool: widget.appbool,
                navbool: widget.navbool,
              ),
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
                      padding: EdgeInsets.all(10),
                      child: FutureBuilder(
                        builder: (ctx, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text("No Customer Data Available.."),
                              );
                            } else if (snapshot.hasData) {
                              return MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: DataTable(
                                  border: TableBorder.all(
                                      color: Colors.black26, width: 1),
                                  headingRowColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColor_Blue),
                                  columns: const [
                                    DataColumn(
                                      label: Expanded(
                                        flex: 1,
                                        child: Text(
                                          'SL',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        flex: 3,
                                        child: Text(
                                          'Somitee Code',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                          flex: 3,
                                          child: Text(
                                            'Somitee Name',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          )),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                          flex: 3,
                                          child: Text(
                                            'Branch Name',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          )),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Phone',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          )),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                          flex: 3,
                                          child: Text(
                                            'Address',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          )),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Formation Date',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          )),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Last Updated',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          )),
                                    ),
                                    DataColumn(numeric: true,
                                      label: Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Active Members',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          )),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                          flex: 1,
                                          child: Text(
                                            'ACTION',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          )),
                                    ),
                                  ],
                                  rows: List.generate(snapshot.data.length,
                                      (index) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Text((index + 1).toString())),
                                        DataCell(
                                          Text(snapshot.data[index].id),
                                        ),
                                        DataCell(
                                            Text(snapshot.data[index].name)),
                                        DataCell(
                                          Text(snapshot.data[index].branch),
                                        ),
                                        DataCell(
                                          Text(snapshot.data[index].phone),
                                        ),
                                        DataCell(
                                          Text(snapshot.data[index].address),
                                        ),
                                        DataCell(
                                          Text(DateFormat.yMMMd().format(
                                              snapshot.data[index].formation)),
                                        ),
                                        DataCell(
                                          Text(DateFormat.yMMMd().format(
                                              snapshot
                                                  .data[index].lastupdated)),
                                        ),
                                        DataCell(
                                          Text(snapshot.data[index].active
                                              .toString()),
                                        ),
                                        DataCell(
                                          InkWell(
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
      ),
    );
  }
}
