import 'package:flutter/material.dart';
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


  void _onEditSomitee(Somitee cst) async  {

  }

  Future<List<Somitee>> getCust() async {
    List<Somitee> somitee = [];

    return somitee;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavbarScreen(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
            SizedBox(
              height: 50,
            ),
            NoDataFound(title: "Member General Report"),
            Container(
              width: 1400,
              height: 150,
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
                    color: AppColor_Blue,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 30),
                            child: InkWell(
                              onTap: () {
                              },
                              child: const Text(
                                "SL",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,),
                              ),
                            ),
                          ),
                        ),
                        Text("|"),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: 7),
                            child: const Text(
                              "Somitee Code",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text("|"),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(left: 7),
                                  child: const Text(
                                    "Somitee Name",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.arrow_drop_up,
                                        color: Colors.black45,
                                      ),
                                      transform:
                                      Matrix4.translationValues(
                                          0.0, 8.0, 0.0),
                                    ),
                                    Container(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color:  Colors.black
                                        ,
                                      ),
                                      transform:
                                      Matrix4.translationValues(
                                          0.0, -8.0, 0.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("|"),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: 7),
                            child: const Text(
                              "Branch Name",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                        Text("|"),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: 7),
                            child: const Text(
                              "Phone",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text("|"),
                        Expanded(
                          flex: 4,
                          child: Container(
                            margin: EdgeInsets.only(left: 7),
                            child: const Text(
                              "Address",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                        Text("|"),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: 7),
                            child: const Text(
                              "Formation Date",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                        Text("|"),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: 7),
                            child: const Text(
                              "Last Updated",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text("|"),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 7),
                            child: const Text(
                              "Active Members",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text("|"),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(left: 7),
                            child: Text(
                              "ACTION",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      builder: (ctx, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasError) {
                            return const Center(
                              child:
                              Text("No Customer Data Available.."),
                            );
                          } else if (snapshot.hasData) {
                            return MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.builder(
                                physics:
                                const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return SomiteeListItem(
                                    index: index,
                                    cst: snapshot.data[index],
                                    onEditSomitee: _onEditSomitee,
                                  );
                                },
                              ),
                            );
                          }
                        }
                        return const Center(
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
