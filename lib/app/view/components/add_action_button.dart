import 'package:agenda_tareas/app/model/task.dart';
import 'package:agenda_tareas/app/view/components/sub_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class AddActionButton extends GetView<TaskController> {
  const AddActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF40B7AD),
      onPressed: () => controller.showNewTaskModal(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.0), // Ensures the button is round
      ),
      child: const Icon(
        Icons.add,
        size: 30, // Adjusted size for better fitting
        color: Color(0xFFFFFFFF),
      ),
    );
  }
}

class TaskController extends GetxController {
  var taskList = <Task>[].obs;

  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() {
    List taskList = storage.read<List>('tasks') ?? [];
    print(taskList);
  }

  void showNewTaskModal() {
    Get.bottomSheet(
      const _NewTaskModal(),
      isScrollControlled: true,
    );
  }

  void saveTasks() {
    List<Map<String, dynamic>> tasks = taskList.map((task) => task.toJson()).toList();
    storage.write('tasks', tasks);
  }

  void addTask(String description) {
    taskList.add(Task(description));
    saveTasks();
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
    saveTasks();
  }

}

class _NewTaskModal extends StatelessWidget {
  const _NewTaskModal({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _taskController = TextEditingController();
    final TaskController taskController = Get.find<TaskController>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 23),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SubHeading("Nueva tarea"),
          const SizedBox(height: 26),
          TextField(
            controller: _taskController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Descripción de la tarea',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
          const SizedBox(height: 26),
          ElevatedButton(
            onPressed: () {
              if (_taskController.text.isNotEmpty) {
                taskController.addTask(_taskController.text);
                Get.back(); // Close the modal
              }
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
