import 'dart:math';

import 'package:dio_flutter_specialist_course_imc_calculator/model/bmi.dart';

class Person {
  String? name;
  double? weight;
  int? heightCm;
  late final double bmiValue;
  late final String healthStatus;

  static void calculateBmi({required Person person}) {
    person.bmiValue = person.weight!/pow((person.heightCm!/100),2);
    person.healthStatus = BmiCategory.values.firstWhere((element) => person.bmiValue >= element.min &&
      person.bmiValue < element.max).description;
  }
}