import 'package:bird_solution_task/Modules/Home/home_screen.dart';
import 'package:bird_solution_task/Modules/Login/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{

  RxBool isChecked = false.obs;


  //function that carry the initial value of checkBox to switch its current value.
  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }



}