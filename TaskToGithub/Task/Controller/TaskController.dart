import 'package:crickon/Task/Api_service/Task_API.dart';
import 'package:crickon/Task/Models/TaskUserModel.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  static final instance = Get.find<TaskController>();

  late Rx<List<TaskUserModel>>? listUserModel;
  List<TaskUserModel>? get list => listUserModel?.value;

  @override
  void onInit() {
    listUserModel = Rx<List<TaskUserModel>>([]);
    super.onInit();
  }

  @override
  void onReady() {
    listUserModel?.bindStream(users());
    ever(listUserModel!, checkList);
    super.onReady();
  }

  checkList(List<TaskUserModel> list) {
    if (list.isEmpty) {
      return [];
    } else {
      return users();
    }
  }

  Stream<List<TaskUserModel>> users() {
    return TaskAPI.fetchData().asStream();
  }
}
