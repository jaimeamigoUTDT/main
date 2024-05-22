import 'package:agenda_tareas/app/components/shape.dart';
import 'package:agenda_tareas/app/components/subHeading.dart';
import 'package:agenda_tareas/app/components/taskCard.dart';
import 'package:flutter/material.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Color(0xFF40B7AD)),
                    height: screenHeight / 2.5,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight / 6.83,
                        ),
                        Image.asset(
                          'assets/images/tasks-list-image.png',
                          height: screenHeight / 6,
                          width: screenWidth / 3.425,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SubHeading('Completá tus tareas',
                              color: Color(0xFFF5F5F5)),
                        )
                      ],
                    ),
                  ),
                  SubHeading('Tareas'),
                ],
              ),
              const Shape(),
            ],
          )),
    );
  }
}
