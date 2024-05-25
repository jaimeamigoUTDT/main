import 'package:agenda_tareas/app/model/task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskCardController extends GetxController {
  void toggleState(Task item) {
    item.done.value = !item.done.value;
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard(this.item, {super.key});

  final Task item;

  @override
  Widget build(BuildContext context) {
    // Obtain an instance of TaskCardController
    final TaskCardController controller = Get.put(TaskCardController());

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Obx(() => Checkbox(
                  value: item.done.value,
                  onChanged: (bool? newValue) {
                    if (newValue != null) {
                      controller.toggleState(item);
                    }
                  },
                )),
            Obx(() => Text(
                  item.title.value,
                  style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ))
          ],
        ),
      ),
    );
  }
}
