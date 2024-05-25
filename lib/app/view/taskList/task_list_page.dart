import 'package:agenda_tareas/app/view/components/add_action_button.dart';
import 'package:agenda_tareas/app/view/components/shape.dart';
import 'package:agenda_tareas/app/view/components/sub_heading.dart';
import 'package:agenda_tareas/app/view/components/task_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _Header(),
                Expanded(child: _TaskList()),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(16.0), // Padding to position the button
                child: AddActionButton(),
              ),
            ),
            Shape(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
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
          const Padding(
            padding: EdgeInsets.all(10),
            child: SubHeading(
              'Completá tus tareas',
              color: Color(0xFFF5F5F5),
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskList extends GetView<TaskController> {
  const _TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 25,
            left: 30,
          ),
          child: SubHeading('Tareas'),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 13,
            ),
            child: Obx(
                  () => ListView.separated(
                itemBuilder: (_, index) => TaskCard(controller.taskList[index]),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: controller.taskList.length,
              ),
            ),
          ),
        ),
      ],
    );
  }
}