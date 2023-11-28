import 'package:expenses_project/widgets/chart/version2/bar_chart.dart';
import 'package:expenses_project/widgets/chart/version1/chart.dart';
import 'package:expenses_project/widgets/expanses_list/expanses_list.dart';
import 'package:flutter/material.dart';

import '../models/expanse.dart';
import 'newExpanse.dart';

class Expanses extends StatefulWidget {
  const Expanses({super.key});

  @override
  State<Expanses> createState() => _ExpansesState();
}

class _ExpansesState extends State<Expanses> {
  final List<Expanse> _expanses = [
    Expanse(category: Category.Work, title: "Flutter Course", amount: 29.9, date: DateTime.now()),
    Expanse(category: Category.Leisure, title: "Cinema", amount: 9.5, date: DateTime.now()),
    Expanse(category: Category.Food, title: "Breakfast", amount: 31.3, date: DateTime.now()),

  ];

  void _addExpanse(Expanse expanse){
    setState(() {
      _expanses.add(expanse);
    });
  }
  void _removeExpanse(Expanse expanse){
    setState(() {
      _expanses.remove(expanse);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    print('$width');

    Widget mainContent = const Center(
      child: Text("No Expenses found. Start adding Some!"),
    );
    if(_expanses.isNotEmpty){
      mainContent = ExpansesList(
        expanses: _expanses,
        onRemoveExpanse: _removeExpanse,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanses Home Page"),
        // leading: const Icon(Icons.add), // at beginning
        actions: [
          IconButton(
            onPressed: (){
              showModalBottomSheet(
                useSafeArea: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (ctx) => NewExpanse(_addExpanse)
              );
            },
            icon: const Icon(Icons.add),),
        ], // at the end
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: width<600? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Chart(expanses: _expanses,)),
              Expanded( child: mainContent ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Chart(expanses: _expanses,)),
              Expanded( child: mainContent ),
            ],
          )
          ,
        ),
      ),
    );
  }
}
