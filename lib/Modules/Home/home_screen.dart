import 'package:bird_solution_task/Modules/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatelessWidget {


  final box = GetStorage(); // Local storage variable already carrying the token now from the user login

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Home Screen',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                  child: InkWell(
                    onTap: (){
                      box.remove('token'); // the user click on logout so the token will be removed
                      Get.offAll(LoginScreen()); // and navigate him back to the login screen and close all stack of screens
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 4), // Offset in the x and y directions
                            blurRadius: 6.0,
                          ),
                        ],
                        color: Color.fromRGBO(122,95,201,1),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Center(
                        child: Text(
                          'Log out',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
