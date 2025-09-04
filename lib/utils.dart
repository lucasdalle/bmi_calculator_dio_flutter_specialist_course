import 'dart:convert';
import 'dart:io';

import 'package:dio_flutter_specialist_course_imc_calculator/model/person.dart';

bool isValidName(String name){
  final RegExp firstNameValidator = RegExp(r"^\p{L}+$", unicode: true);
  return firstNameValidator.hasMatch(name.trim());
}

bool readValidName({required Person person}){
  try{
    String? enteredName = stdin.readLineSync(encoding: utf8);

    if(enteredName == null){
      throw FormatException('Name cannot be null');
    }
    
    if(!isValidName(enteredName)){
      throw FormatException('Name must contain only alphabetical characters');
    }

    person.name = enteredName;
    return true;
  }
  catch (e) {
    print('❌ Error: Invalid Name. ${e.toString()}');
    return false;
  }
}

bool isValidHeight(int heightCm){
  return heightCm >= 30 && heightCm <= 300;
}

bool readValidHeight({required Person person}){
  try {
    String? enteredHeight = stdin.readLineSync(encoding: utf8);

    if(enteredHeight == null){
      throw FormatException('Height cannot be null.');
    }

    person.heightCm = int.parse(enteredHeight);
    
    if(!isValidHeight(person.heightCm!)) {
      throw FormatException('Height must be between 30 and 300 cm.');
    }

    return true;
  } catch (e) {
    print('❌ Error: Invalid height. ${e.toString()}');
    return false;
  }
}

bool isValidWeight(double weight){
  return weight >= 1 && weight <= 700;
}

bool readValidWeight({required Person person}){
  try {
    String? enteredWeight = stdin.readLineSync(encoding: utf8);
    if(enteredWeight == null){
      throw FormatException('Weight cannot be null.');
    }

    person.weight = double.parse(enteredWeight);

    if(!isValidWeight(person.weight!)){
      throw FormatException('Weight must be between 1 and 700.');
    }

    return true;
  } catch (e) {
    print('❌ Error: Invalid weight. ${e.toString()}');
    return false;
  }
}