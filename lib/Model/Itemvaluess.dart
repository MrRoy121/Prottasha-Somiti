class Itemvaluess {
  double value;
  String remarks,date;
  int sl;

  Itemvaluess({required this.date, required this.sl,required this.value, required this.remarks});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'value': value,
      'remarks': remarks,
    };
  }
}