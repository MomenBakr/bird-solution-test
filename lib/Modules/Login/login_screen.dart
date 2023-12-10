import 'package:bird_solution_task/Network/http_login.dart';
import 'package:bird_solution_task/modules/Login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var controller = Get.put(LoginController());
  var httpController = Get.put(HttpAuth());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245,245,250,1),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
            child: Center(
              child: Padding(
                padding:  EdgeInsets.only(top: 120.sp,bottom: 25.sp),
                child: Column(
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: Color.fromRGBO(42, 53, 55,1),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Login to continue Radio App',
                      style: TextStyle(
                        color: Color.fromRGBO(42, 53, 55,1),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                          child: Padding(
                            padding:  EdgeInsets.all(10.sp),
                            child: TextFormField(
                              controller: emailController,
                              cursorColor: Colors.grey,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                label: Text(
                                  'Email Address',
                                ),
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(130,133,170,1),
                            ),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Color.fromRGBO(130,133,170,1),),
                              ),
                            ),
                          ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: TextFormField(
                            controller: passwordController,
                            cursorColor: Colors.grey,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(130,133,170,1),

                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Color.fromRGBO(130,133,170,1),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Obx(
                                    () => Checkbox(
                                      activeColor: Colors.pinkAccent,
                                      shape: CircleBorder(eccentricity: 0.5),
                                  value: controller.isChecked.value,
                                  onChanged: (value) {
                                    controller.toggleCheckbox();
                                  },
                                ),
                              ),
                            ],
                          ),
                          Text(
                              'Remember me',
                            style: TextStyle(
                              color: Color.fromRGBO(40, 40, 41, 1),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: (){},
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                color: Color.fromRGBO(129,131,145, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                      child: InkWell(
                        onTap: (){
                          httpController.login(
                              email: emailController.text,
                              password: passwordController.text
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50.h,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey, // Shadow color
                                offset: Offset(0, 4), // Offset in the x and y directions
                                blurRadius: 6.0, // Blur radius
                              ),
                            ],
                            color: Color.fromRGBO(122,95,201,1),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Text(
                                'Log In',
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
                    SizedBox(height:20.h,),
                    Text(
                        'OR',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                      child: InkWell(
                        onTap: (){

                        },
                        child: Container(
                          width: double.infinity,
                          height: 50.h,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey, // Shadow color
                                offset: Offset(0, 4), // Offset in the x and y directions
                                blurRadius: 6.0, // Blur radius
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Text(
                              'Continue with google',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                      child: InkWell(
                        onTap: (){

                        },
                        child: Container(
                          width: double.infinity,
                          height: 50.h,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey, // Shadow color
                                offset: Offset(0, 4), // Offset in the x and y directions
                                blurRadius: 6.0, // Blur radius
                              ),
                            ],
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Text(
                              'Sign In with Apple ID',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                      child: InkWell(
                        onTap: (){

                        },
                        child: Container(
                          width: double.infinity,
                          height: 50.h,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey, // Shadow color
                                offset: Offset(0, 4), // Offset in the x and y directions
                                blurRadius: 6.0, // Blur radius
                              ),
                            ],
                            color: Color.fromRGBO(57,87,154,1),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Text(
                              'Continue with Facebook',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        InkWell(
                          onTap: (){

                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(122,95,201,1),
                            ),
                          ),
                        )

                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 70.sp),
                      child: RichText(
                        textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'By signing up you indicate that you have read and agreed to the patch ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                  color:Color.fromRGBO(122,95,201,1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ]
                          )
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
