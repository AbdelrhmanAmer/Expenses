
import 'package:flutter/material.dart';

import '../../../models/expanse.dart';
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
    final bool isDarkMood = MediaQuery.of(context).platformBrightness==Brightness.dark ;

    return LayoutBuilder(
      builder: ((ctx, constraint){
        print(constraint.minWidth.toString());
        print(constraint.maxWidth.toString());
        print(constraint.minHeight.toString());
        print(constraint.maxHeight.toString());
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          width: double.infinity,
          height: constraint.maxHeight,
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
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for(final element in buckets) ChartBar(
                      fill: element.totalExpanses==0
                          ? 0
                          : element.totalExpanses / maxTotalExpanse,
                    ),
                  ],
                ),
              ),
              constraint.minHeight<200
                  ? Container()
                  : const SizedBox(height: 10),
              
              constraint.minHeight<200
                  ? Container()
                  : Row(
                children: buckets.map((e) =>
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                              categoryIcons[e.category],
                              color: isDarkMood
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.primary.withOpacity(0.7)

                          ),
                        ))).toList(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
