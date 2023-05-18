import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lebonberger/auth/auth.controller.dart';

class TodoList extends StatelessWidget {
  TodoList({super.key});
  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Container(
        child: Obx(() => ListView.builder(
              itemCount: controller.todos.length,
              itemBuilder: (context, int index) {
                return Ink(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ),
                      color: Colors.white70,
                      child: ListTile(
                        title: Text(
                          controller.todos[index].path +
                              ' ${controller.todos[index].path}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text('${controller.todos[index].id}'),
                      ),
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
