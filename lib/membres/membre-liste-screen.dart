import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:lebonberger/membres/components/MembreHeader.dart';
import 'package:lebonberger/membres/controller/membre.controller.dart';
import 'package:lebonberger/routes/api.routes.dart';
import 'package:lebonberger/routes/app.routes.dart';

class MembreListeScreen extends StatelessWidget {
  MembreListeScreen({super.key});
  MembreController controller = Get.put(MembreController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MembreHeader(),
          Container(
            padding: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height,
            child: RefreshIndicator(
              onRefresh: () async {
                controller.findAll();
              },
              child: Obx(
                () {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.membres.length,
                      itemBuilder: (context, int index) {
                        return Ink(
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.DetailsMembre,
                                  arguments: controller.membres[index].id);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 10,
                              ),
                              color: Colors.white70,
                              child: ListTile(
                                title: Text(
                                  controller.membres[index].nom +
                                      ' ${controller.membres[index].nom}',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                    '${controller.membres[index].departement.nomDepartement}'),
                                leading: Container(
                                  child: controller.membres[index].photo == null
                                      ? Image.asset(
                                          "assets/images/users.png",
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          ApiRoutes.STORAGE_PUBLIC_PATH +
                                              controller.membres[index].photo!,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                trailing: Ink(
                                  decoration: const ShapeDecoration(
                                    // color: Color.fromARGB(255, 183, 245, 188),
                                    shape: CircleBorder(),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.info_outline,
                                      size: 30,
                                      color: Color.fromARGB(184, 76, 175, 79),
                                    ),
                                    onPressed: () {
                                      Get.toNamed(AppRoutes.DetailsMembre,
                                          arguments:
                                              controller.membres[index].id);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
