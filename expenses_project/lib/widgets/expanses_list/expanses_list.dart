import 'package:expenses_project/widgets/expanses_list/expanses_item.dart';
import 'package:flutter/material.dart';

import '../../models/expanse.dart';

class ExpansesList extends StatelessWidget {
  const ExpansesList({
        super.key,
        required this.expanses,
    });

  final List<Expanse> expanses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expanses.length,
        itemBuilder: (ctx, index){
          return ExpansesItem(expanse: expanses[index]);
        }
    );
  }
}
