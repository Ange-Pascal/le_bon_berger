import 'package:get/get.dart';
import 'package:lebonberger/cellules/model/cellule.model.dart';
import 'package:lebonberger/cellules/service/cellule.service.dart';

class CelluleController extends GetxController {
  RxBool isLoading = false.obs;
  late List<Cellule> cellules = <Cellule>[].obs;

  @override
  void onInit() {
    findAll();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  findAll() async {
    try {
      isLoading(false);
      var res = await CelluleService.flindAll();
      cellules.assignAll(res);
    } catch (e) {
      isLoading(false);
    }
  }
}
