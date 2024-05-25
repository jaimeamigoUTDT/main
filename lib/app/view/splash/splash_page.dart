import 'package:agenda_tareas/app/view/components/shape.dart';
import 'package:agenda_tareas/app/view/components/sub_heading.dart';
import 'package:agenda_tareas/app/view/taskList/task_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onHorizontalDragUpdate: (details) {
          Get.to(const TaskListPage(), transition: Transition.rightToLeft);
        },
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const Row(
                  children: [
                    Shape(),
                  ],
                ),
                SizedBox(height: screenHeight / 10),
                Image.asset(
                  'assets/images/onboarding-image.png',
                  width: 180,
                  height: 168,
                ),
                SizedBox(
                  height: (screenHeight / 7),
                ),
                const Center(child: SubHeading('Lista de tareas')),
                SizedBox(
                  height: screenHeight / 35,
                ),
                Center(
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: screenWidth / 12.84),
                    child: SizedBox(
                      width: 311,
                      height: 96,
                      child: Text(
                        'La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.circle,
                      color: Colors.grey,
                      size: 12,
                    ),
                    SizedBox(
                      width: screenWidth / 80,
                    ),
                    const Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 12,
                    ),
                    SizedBox(
                      width: screenWidth / 80,
                    ),
                    const Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 12,
                    )
                  ],
                ),
                const Spacer(),
                const SubHeading('Swipe to learn more'),
                const Spacer()
              ],
            ),
          ),
        ));
  }
}
