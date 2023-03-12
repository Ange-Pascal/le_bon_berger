import 'package:get/get.dart';
import 'package:lebonberger/membres/controller/membre.controller.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MembreController());
  }
}
