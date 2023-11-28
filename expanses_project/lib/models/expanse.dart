import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final dateTime = DateFormat.yMd();

const categoryIcons = {
  Category.Food: Icons.lunch_dining_outlined,
  Category.Travel: Icons.flight_takeoff,
  Category.Leisure: Icons.video_camera_back_outlined,
  Category.Work: Icons.work_outline
};

enum Category { Food, Travel, Work, Leisure }

class Expanse{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return dateTime.format(date);
  }

  Expanse({
    required this.category,
    required this.title,
    required this.amount,
    required this.date
  }): id= uuid.v4();
}

class ExpanseBucket{
  final Category category;
  final List<Expanse> expanses;

  ExpanseBucket(this.category, this.expanses);

  ExpanseBucket.forCategory(List<Expanse> allExpanses, this.category)
      : expanses=allExpanses
      .where((element) => element.category == category)
      .toList();

  double get totalExpanses{
    double sum = 0;
    for(var expanse in expanses){
      sum += expanse.amount;
    }
    return sum;
  }
}