import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/cubits/timer/timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(InitialState());



  counting(int seconds) async {
    while (seconds > 0) {
      seconds--;
      await Future.delayed(const Duration(seconds: 1), () {
        emit(StartedState(seconds: seconds));
      });
    }
  }

  cancel() {
    emit(CanceledState());
  }
}
