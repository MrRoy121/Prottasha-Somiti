import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../../Constants/Constants.dart';
import '../../Model/member.dart';
import '../../Model/somitee.dart';
import '../../helpers/pdfs_helpers/pdf_samiteewisememberdepositloanledger.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/SamiteeMemberDeposite.dart';

class SamiteeWiseMemberDepositeLoan extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  SamiteeWiseMemberDepositeLoan({required this.appbool, required this.navbool});

  @override
  State<SamiteeWiseMemberDepositeLoan> createState() =>
      _SamiteeWiseMemberDepositeLoanState();
}

class _SamiteeWiseMemberDepositeLoanState
    extends State<SamiteeWiseMemberDepositeLoan> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  var selectedsomiti;
  var sselectedsomiti;
  bool samiteeselected = false;

  @override
  void initState() {
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
            closed: element["Closed"],
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
      selectedsomiti = ss;
      samiteeselected = false;
    });
  }
  double calculateSum(List<dynamic> array) {
    return array.fold(0, (sum, map) => sum + (map['value'] as double? ?? 0));
  }
  Future<List<Memberss>> getCust() async {
    List<Memberss> allmemberss = [];
    int s = 1;
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Member').get();
      for (var element in querySnapshot.docs) {
        if (selectedsomiti.id == element["Somitee ID"] && element["Status"]) {
          if (element["Deposits"] != null || element["Withdraws"] != null) {
            double totaldeposit =0,totaldisbursement=0,totalwithdraw=0,repayment=0, totalloan=0;
            DateTime lastrepaymentdate =DateTime(2000, 1, 1);
            var deposits = element["Deposits"] ?? [];
            var withdrawals = element["Withdraws"] ?? [];
            totaldeposit= calculateSum(deposits) + calculateSum(withdrawals);
            totalwithdraw =  calculateSum(withdrawals);
            String sanctionid='';
            await FirebaseFirestore.instance
                .collection('LoanDisbursed')
                .get()
                .then((querySnapshot) {
              for (var json in querySnapshot.docs) {
                if(json['Member ID']==element.id&&json["Status"]&&json["Approve"]){
                  sanctionid=json['Sanction']['ID'];
                  totaldisbursement=totaldisbursement+json["Disbursed Amount"];
                  totalloan = totalloan+json["Disbursed Amount"]+(json["Disbursed Amount"]*(json['Sanction']['Service Charge']/100));
                }
              }
            });
            await FirebaseFirestore.instance
                .collection('LoanRepayment')
                .orderBy('Approve Date', descending: false)
                .get()
                .then((querySnapshot) {
              for (var json in querySnapshot.docs) {
                if(json['Sanction Id']==sanctionid&&json["Status"]&&json["Approve"]){
                  repayment=repayment+json['Pay Amount'];
                  lastrepaymentdate = json['Request Date'].toDate();
                }
              }
            });
            allmemberss.add(Memberss.ForReport(
                somiteename: element["Somitee Name"],
                somiteeid: element["Somitee ID"],
                membertype: element["Member Type"],
                deposit: deposits,totaldisbursement: totaldisbursement,totalwithdraw:totalwithdraw ,
                withdraw: withdrawals,totalloan: totalloan,lastrepaymentdate: lastrepaymentdate,repayment: repayment,totaldeposit: totaldeposit,
                occupation: element["Occupation"],
                firstname: element["First Name"],
                lastname: element["Last Name"],
                dead: element['Dead'],
                fathername: element["Father Name"],
                mothername: element["Mother Name"],
                loanpendingamount: element["Loan Pending Amount"],
                owndepositamount: element["Own deposit Amount"],
                gender: element["Gender"],
                religion: element["Religion"],
                sts: element["Status"],
                nationalid: element["National ID"],
                birthregi: element["Birth Registration"],
                annualincome: element["Annual Income"],
                age: element["Age"],
                education: element["Education"],
                maritalstatus: element["Marital Status"],
                mobilenotype: element["Mobile No Type"],
                mobilenno: element["Mobile No"],
                presentadd: element["Present Address"],
                parmaadd: element["Permanent Address"],
                livingperiod: element["Living Period"],
                nomaleearner: element["No Female Earner"],
                nofemaleearner: element["No Male Earner"],
                id: element.id,
                headfamily: element["Head Family"],
                ownhomestead: element["Own HomeStead"],
                relationwithhead: element["Relation With Head"],
                landdesc: element["Land Desc"],
                
                remarks: element["Remarks"],
                imageurl: element["ImageURL"],
                img: element["Image"],
                birthdate: element["Date Of Birth"].toDate(),
                sl: s));
            s++;
          }
        }
      }
    } catch (e) {
      print("Error fetching data from Firestore: $e");
    }
    return allmemberss;
  }
  @override
  Widget build(BuildContext context) {
    void _setupsomiti(int ins) {
      setState(() {
        selectedsomiti = somitee[ins];
        samiteeselected = true;
      });
    }

    _save() async {
      if (selectedsomiti == null) {
        Get.snackbar("Samitee Wise Member Ledger Report Generation Failed.",
            "Some Required Fields are Empty",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red,
            margin: EdgeInsets.zero,
            duration: const Duration(milliseconds: 2000),
            boxShadows: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
            ],
            borderRadius: 0);
      } else {
        PdfSamiteeWiseMemberDepositLoanLedger.generate(
            await getCust(),selectedsomiti.name,selectedsomiti.id);
      }
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: SamiteeMemberDeposite(
                      ssomitee: ssomitee,
                      setupsomiti: _setupsomiti,
                      selectedsomiteeid: selectedsomiti,
                      selectedsomitee: sselectedsomiti,
                      onsubmit: _save,
                      onclear: _onclear,
                      somitee: somitee,
                    ),
                  ),
                  samiteeselected
                      ? Container(
                          width: 1500,
                          // color: Colors.white,

                          margin: const EdgeInsets.only(top: 50, left: 15),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: selectedsomiti == null
                                    ? Center(
                                        child: Text("No Somitee Is Selected.."),
                                      )
                                    : FutureBuilder(
                                        builder: (ctx, AsyncSnapshot snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            if (snapshot.hasError) {
                                              return const Center(
                                                child: Text(
                                                    "No Member Data Available.."),
                                              );
                                            } else if (snapshot.hasData) {
                                              return MediaQuery.removePadding(
                                                context: context,
                                                removeTop: true,
                                                child: DataTable(
                                                  showCheckboxColumn: false,
                                                  border: TableBorder.all(
                                                      color: Colors.black26,
                                                      width: 1),
                                                  headingRowColor:
                                                      MaterialStateProperty.all<
                                                          Color>(AppColor_Blue),
                                                  columns: const [
                                                    DataColumn(
                                                      label: Text(
                                                        'Member Code',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Text('Member Name',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                    DataColumn(
                                                      label: Text(
                                                          'Total Deposit',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                    DataColumn(
                                                      label: Text(
                                                        'Total Interest',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn(
                                                        label: Text(
                                                      'Member Share Profit',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                    DataColumn(
                                                      label: Text(
                                                          'Total Withdraw',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                    DataColumn(
                                                      label: Text(
                                                          'Deposit Current Balance',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                    DataColumn(
                                                      label: Text(
                                                          'Loan Disbursement',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                    DataColumn(
                                                      label: Text('Repayment',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                    DataColumn(
                                                      label: Text('Due Loan',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                    DataColumn(
                                                      label: Text(
                                                          'Last Repayment',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                  ],
                                                  rows: List.generate(
                                                      snapshot.data.length,
                                                      (index) {
                                                    return DataRow(
                                                      cells: [
                                                        DataCell(
                                                          Text(
                                                              snapshot
                                                                  .data[index]
                                                                  .id,
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                              )),
                                                        ),
                                                        DataCell(Text(
                                                            snapshot.data[index]
                                                                    .firstname +
                                                                " " +
                                                                snapshot
                                                                    .data[index]
                                                                    .lastname,
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                            ))),
                                                        DataCell(
                                                          Text(
                                                              snapshot
                                                                  .data[index]
                                                                  .totaldeposit.toString(),
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              )),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                              '0',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              )),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                              '0',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12,
                                                              )),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                              snapshot
                                                                  .data[index]
                                                                  .totalwithdraw.toString(),
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12,
                                                              )),
                                                        ),
                                                        DataCell(
                                                          Center(
                                                            child: Text(
                                                                snapshot
                                                                        .data[
                                                                            index]
                                                                        .owndepositamount
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                )),
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                              snapshot
                                                                  .data[index]
                                                                  .totaldisbursement.toString(),
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              )),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                              snapshot
                                                                  .data[index]
                                                                  .repayment.toString(),
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              )),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                              (snapshot
                                                                  .data[index]
                                                                  .totalloan-snapshot
                                                                  .data[index]
                                                                  .repayment).toString(),
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              )),
                                                        ),

                                                        DataCell(
                                                          Center(
                                                            child: Text(
                                                        snapshot
                                                            .data[
                                                        index]
                                                            .lastrepaymentdate==DateTime(2000,1,1)?"":
                                                                DateFormat
                                                                    .yMMMd()
                                                                    .format(snapshot
                                                                    .data[
                                                                index]
                                                                    .lastrepaymentdate)
                                                                    .toString(),
                                                                style:
                                                                const TextStyle(
                                                                  fontSize: 10,
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
                        )
                      : Container(
                    margin: const EdgeInsets.only(top: 50, left: 15),),
                ],
              ),
            NavbarScreenMFS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
          ],
        ),
      ),
    );
  }
}
