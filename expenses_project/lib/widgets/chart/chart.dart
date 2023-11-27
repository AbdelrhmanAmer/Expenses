
import 'package:flutter/material.dart';

import '../../models/expanse.dart';
import 'char_bar.dart';
class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.expanses
  });

  final List<Expanse> expanses;

  List<ExpanseBucket> get buckets{
    return [
      ExpanseBucket.forCategory(expanses, Category.Food),
      ExpanseBucket.forCategory(expanses, Category.Leisure),
      ExpanseBucket.forCategory(expanses, Category.Travel),
      ExpanseBucket.forCategory(expanses, Category.Work),
    ];
  }
  get maxTotalExpanse{
    double maxTotalExpanse = 0;

    for(var element in buckets){
      if(element.totalExpanses>maxTotalExpanse){
        maxTotalExpanse = element.totalExpanses;
      }
    }

    return maxTotalExpanse;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(.3),
            Theme.of(context).colorScheme.primary.withOpacity(.0)
          ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter
        )
      ),
      child: Column(
        children: [
          Expanded(child: Row(
            children: [
              for(final element in buckets)  const ChartBar(fill: 2),
            ],
          ),
          ),
          SizedBox(height: 12,),
          Row(
            children: buckets.map((e) =>
                const Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(Icons.abc),
            ))).toList(),
          ),
        ],
      ),
    );
  }
}
