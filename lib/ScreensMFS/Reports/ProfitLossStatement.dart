import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
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

  Future<List<DailyTransactionModel>> getmemberdeposit() async {
    List<DailyTransactionModel> allmemberss = [];
    int s = 1;
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Member').get();
      for (var element in querySnapshot.docs) {
        if (element["Deposits"] != null) {
          var deposits = element["Deposits"] ?? [];
          for (int i = 0; i < deposits.length; i++) {
            DateTime ddd = DateTime.parse(deposits[i]["date"]);
            if (_selectedDate.day == ddd.day &&
                _selectedDate.month == ddd.month &&
                _selectedDate.year == ddd.year) {
              allmemberss.add(DailyTransactionModel(
                  amount: deposits[i]["value"],
                  transacno: s.toString(),
                  drcr: false,
                  acno: element.id,
                  actitle: element["First Name"] + " " + element["Last Name"],
                  naration: deposits[i]["remarks"],
                  transactiondate: ddd));
              s++;
            }
          }
        }
      }
    } catch (e) {
      print("Error fetching data from Firestore: $e");
    }
    return allmemberss;
  }

  Future<List<DailyTransactionModel>> getmemberwithdraw() async {
    List<DailyTransactionModel> allmemberss = [];
    int s = 1;
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Member').get();
      for (var element in querySnapshot.docs) {
        if (element["Withdraws"] != null) {
          var deposits = element["Withdraws"] ?? [];
          for (int i = 0; i < deposits.length; i++) {
            DateTime ddd = DateTime.parse(deposits[i]["date"]);
            if (_selectedDate.day == ddd.day &&
                _selectedDate.month == ddd.month &&
                _selectedDate.year == ddd.year) {
              allmemberss.add(DailyTransactionModel(
                  amount: deposits[i]["value"],
                  transacno: s.toString(),
                  drcr: true,
                  acno: element.id,
                  actitle: element["First Name"] + " " + element["Last Name"],
                  naration: deposits[i]["remarks"],
                  transactiondate: ddd));
              s++;
            }
          }
        }
      }
    } catch (e) {
      print("Error fetching data from Firestore: $e");
    }
    return allmemberss;
  }

  Future<List<DailyTransactionModel>> getloandisbursement() async {
    List<DailyTransactionModel> allmemberss = [];
    int s = 1;
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('LoanDisbursed').get();
    for (var element in querySnapshot.docs) {
      if (element['Status'] && element['Approve']) {
        DateTime ddd = element["Disbursed Date"].toDate();
        if (_selectedDate.day == ddd.day &&
            _selectedDate.month == ddd.month &&
            _selectedDate.year == ddd.year) {
          allmemberss.add(DailyTransactionModel(
              amount: element["Disbursed Amount"],
              transacno: s.toString(),
              drcr: true,
              acno: element['Member ID'],
              actitle: element["Member Name"],
              naration: element["Narration"],
              transactiondate: ddd));
          s++;
        }
      }
    }
    return allmemberss;
  }

  Future<List<DailyTransactionModel>> getloanrepayment() async {
    List<DailyTransactionModel> allmemberss = [];
    int s = 1;
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('LoanRepayment').get();
    for (var element in querySnapshot.docs) {
      if (element['Status'] && element['Approve']) {
        DateTime ddd = element["Request Date"].toDate();
        if (_selectedDate.day == ddd.day &&
            _selectedDate.month == ddd.month &&
            _selectedDate.year == ddd.year) {
          allmemberss.add(DailyTransactionModel(
              amount: element["Pay Amount"],
              transacno: s.toString(),
              drcr: false,
              acno: element['Member ID'],
              actitle: element["Member Name"],
              naration: element["Narration"],
              transactiondate: ddd));
          s++;
        }
      }
    }
    return allmemberss;
  }

  @override
  Widget build(BuildContext context) {


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
        PdfProfitLossStatement.generate(
            cashwithdraw: await getmemberwithdraw(),
            cashdeposit: await getmemberdeposit(),
            loandisburse: await getloandisbursement(),
            loanrepayment: await getloanrepayment(),
            ledgertitle: selectedsomiti.name,
            ledgeno: selectedsomiti.id);
      }
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100,left: 50),
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
                              Container(
                                height: 40,
                                width: 125,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2.0, left: 12),
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
                                        style: TextStyle(color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: (){

                                  _selectedDate = DateTime.now();
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 90,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3.0, left: 15),
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
                                          style: TextStyle(color: Colors.white, fontSize: 14),
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
                                          style: TextStyle(color: Colors.black, fontSize: 14),
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
                                                    color: Colors.black, fontSize: 14)),
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
                                                  borderSide: BorderSide(color: Colors.grey),
                                                ),
                                                hintText: _selectedDate != null
                                                    ? "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}"
                                                    : "Select a date",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                suffixIcon: Icon(Icons.calendar_month_sharp,
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
