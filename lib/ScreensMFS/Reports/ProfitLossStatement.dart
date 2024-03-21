import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../../Constants/values.dart';
import '../../Model/ProfitLossModel.dart';
import '../../helpers/pdfs_helpers/pdf_profitlossstatement.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/GLSummary.dart';
import 'package:get/get.dart';

class ProfitLossStatement extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  ProfitLossStatement({required this.appbool, required this.navbool});

  @override
  State<ProfitLossStatement> createState() => _ProfitLossStatementState();
}

class _ProfitLossStatementState extends State<ProfitLossStatement> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  double calculateSum(List<dynamic> array) {
    return array.fold(0, (sum, map) => sum + (map['value'] as double? ?? 0));
  }

  Future<List<ProfitLossModel>> getincome() async {
    List<ProfitLossModel> profitloss = [];
    int s = 1;
    double tillpreviousmont = 0.0, currentmont = 0.0;
    await FirebaseFirestore.instance
        .collection('LoanRepayment')
        .orderBy('Approve Date', descending: true)
        .get()
        .then((querySnapshot) {
      for (var json in querySnapshot.docs) {
        if (json["Status"] && json['Approve']) {
          DateTime ddd = json['Request Date'].toDate();
          double serviceCharge = json['Service Charge'];
          double payAmount = json['Pay Amount'];
          double serviceChargePercentage = (serviceCharge / payAmount) * 100;
          double remainingAmount =
              payAmount - (payAmount * (serviceChargePercentage / 100));
          if (_selectedDate.month == ddd.month &&
              _selectedDate.year == ddd.year) {
            currentmont += remainingAmount;
          } else {
            tillpreviousmont += remainingAmount;
          }
        }
      }
    });
    profitloss.add(ProfitLossModel(
        glcode: "5490${s.toString().padLeft(3, '0')}",
        desc: "Interest On MicroCredit",
        sl: s,
        tillprevious: tillpreviousmont,
        current: currentmont,
        total: tillpreviousmont + currentmont));
    s++;
    profitloss.add(ProfitLossModel(
        glcode: "5490${s.toString().padLeft(3, '0')}",
        desc: "Others Loan",
        sl: s,
        tillprevious: 0,
        current: 0,
        total: 0));
    s++;
    profitloss.add(ProfitLossModel(
        glcode: "5490${s.toString().padLeft(3, '0')}",
        desc: "Registration Fee",
        sl: s,
        tillprevious: 0,
        current: 0,
        total: 0));
    s++;
    profitloss.add(ProfitLossModel(
        glcode: "5490${s.toString().padLeft(3, '0')}",
        desc: "Document Fee",
        sl: s,
        tillprevious: 0,
        current: 0,
        total: 0));
    s++;
    return profitloss;
  }

  Future<List<ProfitLossModel>> getExpense() async {
    List<ProfitLossModel> profitloss = [];
    int s = 1;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await FirebaseFirestore.instance.collection('ExpenseItem').get();
    for (var category in ExpensecategoryList) {
      double tillpreviousmont = 0.0, currentmont = 0.0;
      List<QueryDocumentSnapshot<Map<String, dynamic>>> expenses = querySnapshot.docs
          .where((ele) =>
      ele['Expense Category'] == category &&
          _selectedDate.month == ele['Date'].toDate().month &&
          _selectedDate.year == ele['Date'].toDate().year)
          .toList();
      for (var ele in expenses) {
        double amount = ele['Amount'];
        if (_selectedDate.month == ele['Date'].toDate().month &&
            _selectedDate.year == ele['Date'].toDate().year) {
          currentmont += amount;
        } else {
          tillpreviousmont += amount;
        }
      }

      profitloss.add(ProfitLossModel(
        glcode: "5490${s.toString().padLeft(3, '0')}",
        desc: category,
        sl: s,
        tillprevious: tillpreviousmont,
        current: currentmont,
        total: tillpreviousmont + currentmont,
      ));
      s++;
    }

    return profitloss;
  }

  @override
  Widget build(BuildContext context) {
    _save() async {
      PdfProfitLossStatement.generate(
          getincome: await getincome(),getexpense: await getExpense(), date: _selectedDate);
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, left: 50),
              child: Column(
                children: [
                  Container(
                    width: 1400,
                    height: 300,
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text(
                                  "Profit Loss Statement",
                                  style: TextStyle(
                                    color: AppColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  _save();
                                },
                                child: Container(
                                  height: 40,
                                  width: 125,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0, left: 12),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.remove_red_eye_outlined,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "View Report",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  _selectedDate = DateTime.now();
                                  setState(() {});
                                },
                                child: Container(
                                  height: 40,
                                  width: 90,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3.0, left: 15),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.clear_all_sharp,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Clear",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  color: AppColor_yellow,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 90, left: 430),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          text: 'Transaction Date',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red,
                                                    fontSize: 14)),
                                            TextSpan(
                                                text: ' :',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: InkWell(
                                          onTap: () => _selectDate(context),
                                          child: AbsorbPointer(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                hintText: _selectedDate != null
                                                    ? "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}"
                                                    : "Select a date",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                suffixIcon: Icon(
                                                    Icons.calendar_month_sharp,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
