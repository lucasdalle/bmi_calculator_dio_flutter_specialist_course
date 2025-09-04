import 'dart:convert';
import 'dart:io';

import 'package:dio_flutter_specialist_course_imc_calculator/model/person.dart';
import 'package:dio_flutter_specialist_course_imc_calculator/model/program_stages.dart';
import 'package:dio_flutter_specialist_course_imc_calculator/utils.dart';

void runBmiCalculator(){
  ProgramStages currentStage = ProgramStages.readName;
  Person person = Person();

  while(true){
    switch (currentStage) {
      case ProgramStages.readName:{
          print('📝  --  What is your name ?');
          if(!readValidName(person: person)){
            break;
          }
          currentStage = ProgramStages.readHeight;
        break;
      }

      case ProgramStages.readHeight:{
          print('📏  --  What is your height (cm) ?');
          if(!readValidHeight(person: person)){
            break;
          }
          currentStage = ProgramStages.readWeight;
        break;
      }

      case ProgramStages.readWeight:{
          print('⚖️  --  What is your weight (Kg) ?');
          if(!readValidWeight(person: person)){
            break;
          }
          currentStage = ProgramStages.calculateBmi;
        break;
      }

      case ProgramStages.calculateBmi:{
          Person.calculateBmi(person: person);
          print('\n${person.name}, your BMI is: ${person.bmiValue}');
          print('📊  --  Classification: ${person.healthStatus}');

          currentStage = ProgramStages.finished;
        break;
      }

      case ProgramStages.finished:{
          print('\nType "esc" to exit, or "rst" to restart');
          String? cmd = stdin.readLineSync(encoding: utf8);

          if(cmd == 'esc'){
            return;
          }
          else if (cmd == 'rst'){
            person = Person();
            currentStage = ProgramStages.readName;
            print("\x1B[2J\x1B[0;0H");
            print('-------------- BMI CALCULATOR --------------');
          }
        break;
      }
    } 
  }
}

void main(List<String> arguments) { 
  print('-------------- BMI CALCULATOR --------------');
  runBmiCalculator();
}
