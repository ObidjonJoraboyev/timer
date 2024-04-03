abstract class TimerState {}

class StartedState extends TimerState {
  final int seconds;

  StartedState({
    required this.seconds,
  });

  StartedState copyWith({
    int? seconds,
  }) {
    return StartedState(
      seconds: seconds ?? this.seconds,
    );
  }
}

class InitialState extends TimerState {}

class CanceledState extends TimerState {}

class SetSettingsState extends TimerState {
  final int seconds;
  final int hour;
  final int minute;

  SetSettingsState({
    required this.hour,
    required this.minute,
    required this.seconds,
  });

  SetSettingsState copyWith({
    int? seconds,
    int? hour,
    int? minute,
  }) {
    return SetSettingsState(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      seconds: seconds ?? this.seconds,
    );
  }
}
