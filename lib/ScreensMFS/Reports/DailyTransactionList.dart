import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import 'package:get/get.dart';
import '../../Constants/values.dart';
import '../../Model/dailyTransactionModel.dart';
import '../../Model/member.dart';
import '../../Model/somitee.dart';
import '../../helpers/pdfs_helpers/pdf_dailytransactionledger.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/TransactionList.dart';

class DailyTransactionList extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DailyTransactionList({required this.appbool, required this.navbool});

  @override
  State<DailyTransactionList> createState() => _DailyTransactionListState();
}

class _DailyTransactionListState extends State<DailyTransactionList> {
  DateTime _selectedDate = DateTime.now();
  String selectedtransactiontype = "All Transaction";
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
        PdfDailyTransactionLedger.generate(
            cashwithdraw: await getmemberwithdraw(),
            cashdeposit: await getmemberdeposit(),
            loandisburse: await getloandisbursement(),
            loanrepayment: await getloanrepayment(),
            ledgertitle: selectedsomiti.name,
            ledgeno: selectedsomiti.id);
      }
    }

    void _setuptransactionType(int ins) {
      setState(() {
        selectedtransactiontype = TranTypeList[ins];
      });
    }

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != _selectedDate) {
        setState(() {
          _selectedDate = picked;
        });
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
              margin: EdgeInsets.only(top: 100, left: 50),
              child: TransactionList(
                ssomitee: ssomitee,
                setupsomiti: _setupsomiti,
                selectDate: _selectDate,
                selectedDate: _selectedDate,
                selectedtransactiontype: selectedtransactiontype,
                selectedsomiteeid: selectedsomiti,
                selectedsomitee: sselectedsomiti,
                setuptransactionType: _setuptransactionType,
                onsubmit: _save,
                onclear: _onclear,
                somitee: somitee,
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
