import 'package:agenda_tareas/app/components/actionButton.dart';
import 'package:agenda_tareas/app/components/shape.dart';
import 'package:agenda_tareas/app/components/subHeading.dart';
import 'package:agenda_tareas/app/view/taskList/taskListPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Shape(),
              ],
            ),
            const SizedBox(height: 73),
            Image.asset(
              'assets/images/onboarding-image.png',
              width: 180,
              height: 168,
            ),
            const SizedBox(
              height: 99,
            ),
            const Center(child: SubHeading('Lista de tareas')),
            const SizedBox(
              height: 21,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  width: 311,
                  height: 96,
                  child: Text(
                    'La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        !.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60,),
            GestureDetector(
                child: const ActionButton(text: 'Empezar'),
            onTap: (){
                  Get.to(const TaskListPage());
            },)
          ],
        ),
      ),
    );
  }
}
