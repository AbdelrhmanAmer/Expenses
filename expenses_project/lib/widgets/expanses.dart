import 'package:expenses_project/widgets/expanses_list/expanses_list.dart';
import 'package:flutter/material.dart';

import '../models/expanse.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanses Home Page"),
        // leading: const Icon(Icons.add), // at beginning
        actions: [
          IconButton(onPressed: (){
            showModalBottomSheet(
                context: context,
                builder: (ctx) =>
                const SizedBox(
                    width:double.infinity,
                    height: 300,
                    child: Text("Data")));
          },icon: const Icon(Icons.add),),
        ], // at the end
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("text1"),
            Expanded(
              child: ExpansesList(
                expanses: _expanses,
              )
            ),
          ],
        ),
      ),
    );
  }
}
