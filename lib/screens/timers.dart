import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/utils/timer_list.dart';

import '../cubits/timer/timer_cubit.dart';
import '../cubits/timer/timer_state.dart';
import '../data/models/timer_model.dart';

class TimersScreen extends StatefulWidget {
  const TimersScreen({super.key});

  @override
  State<TimersScreen> createState() => _TimersScreenState();
}

class _TimersScreenState extends State<TimersScreen> {
  int number = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CupertinoTimerPicker(
                            onTimerDurationChanged: (s) {
                              number = s.inSeconds;

                              //setState(() {});
                            },
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: () {
                                    context.read<TimerCubit>().cancel();
                                  },
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(.3),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(.6),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.green.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: () {
                                    context
                                        .read<TimerCubit>()
                                        .setData(seconds: number);
                                    context.read<TimerCubit>().counting(number);
                                    list.add(TimerModel(
                                        seconds: number,
                                        name: textEditingController
                                                .text.isNotEmpty
                                            ? textEditingController.text
                                            : "Timer",
                                        allTime: number));
                                    setState(() {

                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: number != 0
                                          ? Colors.green.withOpacity(.4)
                                          : Colors.green.withOpacity(.2),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Start",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 32),
                            child: TextField(
                              controller: textEditingController,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.6),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.end,
                              cursorColor: Colors.orange,
                              decoration: InputDecoration(
                                hintText: "Timer",
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(.6)),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 16, top: 10, bottom: 10),
                                  child: Text(
                                    "Label ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.only(right: 2),
                                fillColor: Colors.grey,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 0, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 0, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    });
              },
              icon: Icon(Icons.add))
        ],
        title: Text(
          "Timers",
          style: TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.w800),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 26, bottom: 54),
          ),
          ...List.generate(list.length, (index) {
            return ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: BlocBuilder<TimerCubit, TimerState>(
                  builder: (context, TimerState state) {
                    if (state is StartedState) {
                      return CircularProgressIndicator(
                          color: Colors.black,
                          backgroundColor: Colors.grey,
                          strokeWidth: 5,
                          value: state.seconds / list[index].seconds);
                    }
                    return const SizedBox();
                  },
                ),
              ),
              title: Text(list[index].name),
            );
          }),
        ],
      ),
    );
  }
}
