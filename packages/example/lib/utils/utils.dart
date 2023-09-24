import 'package:flutter/material.dart';
import 'package:google_ml_kit_example/providers/counter_bloc.dart';

double calcularPendiente(Offset punto1, Offset punto2) {
  double deltaY = (punto2.dy - punto1.dy);
  double deltaX = (punto2.dx - punto1.dx);
  if (deltaX.abs() < 1e-6) {
    return double.infinity;
  }
  double pendiente = deltaY / deltaX;

  return pendiente;
}


PushUpState? isPushUp(Offset puntoA,Offset puntoB,Offset puntoC,PushUpState current) {
  double pendienteAB = calcularPendiente(puntoA, puntoB);
  double pendienteBC = calcularPendiente(puntoB, puntoC);
  print('Pendiente AB: ${pendienteAB.toStringAsFixed(2)}');
  print('Pendiente BC: ${pendienteBC.toStringAsFixed(2)}');
  // Define un umbral para distinguir entre "muy cerrado" y "un poco cerrado".
  

  if(-2.49 <= pendienteAB && pendienteAB <= -1.67 && pendienteBC >= 1.44 && pendienteBC <= 3.90 && current == PushUpState.neutral) {
    return PushUpState.init;    
  } else if(pendienteAB >= -1.15 && pendienteAB <= -0.88  && pendienteBC >= 0.34 && pendienteBC <= 0.69 && current == PushUpState.init){
    print('NO UNTIL');
    return PushUpState.middleArms;
  } else if(pendienteAB >= -0.51  && pendienteAB <= -0.21 && pendienteBC >= -0.42 && pendienteBC <= -0.21 && current == PushUpState.middleArms){
    print('is complete!!!!');
    return PushUpState.complete;
  }
}
