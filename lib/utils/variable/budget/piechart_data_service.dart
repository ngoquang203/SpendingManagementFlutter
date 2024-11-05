
import 'package:flutter/material.dart';

class PieChartDataService {
  double value;
  Color color;
  String title;

  PieChartDataService(this.value, this.color, this.title);

  get getValue => value;

  get getColor => color;

  get getTitle => title;
}