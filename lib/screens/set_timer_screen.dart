import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/cubits/timer/timer_cubit.dart';
import 'package:timer/data/models/timer_model.dart';
import 'package:timer/screens/timers.dart';
import 'package:timer/utils/timer_list.dart';

class SetTimerScreen extends StatefulWidget {
  const SetTimerScreen({super.key});

  @override
  State<SetTimerScreen> createState() => _SetTimerScreenState();
}

class _SetTimerScreenState extends State<SetTimerScreen>
    with TickerProviderStateMixin {
  int number = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 30,
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        //leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back_ios,color: Colors.white,),),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoTimerPicker(
            onTimerDurationChanged: (s) {
              number = s.inSeconds;

              //setState(() {});
            },
            backgroundColor: Colors.white,
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
                    context.read<TimerCubit>().counting(number);
                    list.add(TimerModel(
                        seconds: number,
                        name: textEditingController.text.isNotEmpty
                            ? textEditingController.text
                            : "Timer",
                        allTime: number));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const TimersScreen();
                    }));
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
                hintStyle: TextStyle(color: Colors.white.withOpacity(.6)),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 16, top: 10, bottom: 10),
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
                  borderSide: const BorderSide(width: 0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
