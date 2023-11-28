import 'package:expenses_project/models/expanse.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'bar_data.dart';

class BarGraph extends StatefulWidget {
  const BarGraph({super.key, required this.expanses});

  final List<Expanse> expanses;

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  
  List<ExpanseBucket> get buckets{
    return[
      ExpanseBucket.forCategory(widget.expanses, Category.Food),
      ExpanseBucket.forCategory(widget.expanses, Category.Leisure),
      ExpanseBucket.forCategory(widget.expanses, Category.Travel),
      ExpanseBucket.forCategory(widget.expanses, Category.Work),
    ];
  }
  
  List<double> totalExpanses = [];
  
  get maxTotalExpanse{
    double maxTotalExpanse = 0;
    for(var bucket in buckets){
      if(bucket.totalExpanses > maxTotalExpanse){
        maxTotalExpanse = bucket.totalExpanses;
      }
    }
    return maxTotalExpanse;
  }
  
  
  @override
  Widget build(BuildContext context) {

    var myBarData = BarData(
        food: buckets[0].totalExpanses/maxTotalExpanse,
        leisure: buckets[1].totalExpanses/maxTotalExpanse,
        travel: buckets[2].totalExpanses/maxTotalExpanse,
        work: buckets[3].totalExpanses/maxTotalExpanse
    );
    myBarData.initializeBarData();

    return SizedBox(
      height: 150,
      child: BarChart(
          BarChartData(
              maxY: 10,
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData:  FlTitlesData(
                  show: true,
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false),),
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: getBottomTitles
                    ),
                  )
              ),
              minY: 0,
              barGroups: myBarData.barData
                  .map(
                      (data)=>BarChartGroupData(
                    x: data.x,
                    barRods: [
                      BarChartRodData(
                          toY: data.y,
                          color: Theme.of(context).colorScheme.secondary,
                          width: 50,
                          borderRadius: BorderRadius.circular(4),
                          backDrawRodData: BackgroundBarChartRodData(
                            show: true,
                            toY: 10,
                            color: Theme.of(context).colorScheme.primaryContainer,
                          )
                      )
                    ],
                  )
              )
                  .toList()
          )
      ),
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta){
    const style = TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 14
    );
    Widget text;
    switch (value.toInt()){
      case 0:
        text = const Text("Food", style: style,);
        break;
      case 1:
        text = const Text("Leisure", style: style,);
        break;
      case 2:
        text = const Text("Travel", style: style,);
        break;
      case 3:
        text = const Text("Work", style: style,);
        break;
      default:
        text = const Text("", style: style,);
        break;

    }
    return SideTitleWidget(child: text, axisSide: meta.axisSide);
  }
}
