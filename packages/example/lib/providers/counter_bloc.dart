import 'package:flutter_bloc/flutter_bloc.dart';

enum PushUpState {
  neutral,
  init,
  middleArms,
  complete
}

class PushUpBloc extends Cubit<PushUpState> {
  PushUpBloc() : super(PushUpState.neutral);

  int counter = 0;

  void setCurrentPose(PushUpState value) {
    emit(value);
  }

  void increment() {
    counter++;
    emit(state);
  }

  void decrement() {
    counter--;
    emit(state);
  }
}
