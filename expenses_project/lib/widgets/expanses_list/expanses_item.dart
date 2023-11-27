import 'dart:math';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../../models/expanse.dart';

class ExpansesItem extends StatelessWidget {
  const ExpansesItem({
    super.key,
    required this.expanse,
  });

  final Expanse expanse;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expanse.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4,),
                  Row(
                    children: [
                      Text('\$${expanse.amount.toStringAsFixed(2)}'),
                      const Spacer(),
                      Row(
                        children: [
                          Icon(categoryIcons[expanse.category]),
                          const SizedBox(width: 4),
                          Text(expanse.formattedDate)
                        ],
                      )
                    ],
                  )
                ]
            )
        )
    );
  }
}
