import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/cubits/timer/timer_cubit.dart';
import 'app/app.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (_) => TimerCubit())],
      child: const MyApp()));
}
