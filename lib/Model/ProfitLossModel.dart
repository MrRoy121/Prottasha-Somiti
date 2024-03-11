class ProfitLossModel {
  String glcode, desc;
  double tillprevious, current, total;
  int sl;
  
  ProfitLossModel(
      {required this.glcode,
      required this.desc,required this.sl,
      required this.tillprevious,
      required this.current,
      required this.total});
}
