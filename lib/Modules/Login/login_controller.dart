import 'package:bird_solution_task/Modules/Home/home_screen.dart';
import 'package:bird_solution_task/Modules/Login/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{

  RxBool isChecked = false.obs;
  final box = GetStorage();

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }



}