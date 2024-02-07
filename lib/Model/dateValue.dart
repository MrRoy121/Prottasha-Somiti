class DateValue {
  DateTime date;
  double value;

  DateValue({required this.date, required this.value});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'value': value,
    };
  }
}