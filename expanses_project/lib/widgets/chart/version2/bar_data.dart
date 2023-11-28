import 'individual_bar.dart';
class BarData{
  final double work;
  final double leisure;
  final double travel;
  final double food;

  BarData({
    required this.work,
    required this.leisure,
    required this.food,
    required this.travel,
  });

  List<IndividualBar> barData = [];
  void initializeBarData(){
    barData = [
      IndividualBar(x: 0, y: food),
      IndividualBar(x: 1, y: leisure),
      IndividualBar(x: 2, y: travel),
      IndividualBar(x: 3, y: work),
    ];
  }
}