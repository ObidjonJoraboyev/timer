import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/cubits/timer/timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(InitialState());

  setData({required int seconds}) async {
    int hour = 0;
    int minute = 0;
    int second = 0;

    hour = seconds % 3600;
    minute = seconds % 60;
    second = seconds % 60;
    emit(SetSettingsState(seconds: second, hour: hour, minute: minute));
  }

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
