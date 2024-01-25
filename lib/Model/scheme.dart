class Scheme {
  int sl, installmentno, duration;
  double prinamount,
      servicecharge,
      dailyprofit,
      profitamount,
      yearlyprofit,
      totalprofit,
      installmentrate,
      installmentamount,
      dailyprincipleamount,
      total;
  String name;
  bool filterFn(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }
  Scheme(
      {required this.sl,
      required this.installmentno,
      required this.duration,
      required this.prinamount,
      required this.servicecharge,
      required this.dailyprofit,
      required this.profitamount,
      required this.yearlyprofit,
      required this.totalprofit,
      required this.installmentrate,
      required this.installmentamount,
      required this.dailyprincipleamount,
      required this.total,
      required this.name});
}
