import 'package:flutter/material.dart';
import 'package:timer/screens/api_screen.dart';
import 'package:timer/screens/timers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ApiScreen()));
                },
                child: const Text("Api Screen")),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const TimersScreen()));
                },
                child: const Text("Timer Screen")),
          ],
        ),
      ),
    );
  }
}
