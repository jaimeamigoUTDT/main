import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskCardController extends GetxController {
  var state = false.obs;

  void toggleState() {
    state.value = !state.value;
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // Obtain an instance of TaskCardController
    final TaskCardController controller = Get.put(TaskCardController());

    return Container(
      width: screenWidth / 1.3,
      height: screenHeight / 12.6,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black,
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0)
      ]),
      child: Row(
        children: [
          Obx(() => Checkbox(
            value: controller.state.value,
            onChanged: (bool? value) {
              controller.toggleState();
            },
          )),
        ],
      ),
    );
  }
}
