import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/data/models/login_model.dart';
import 'package:rafiq/logic/cubit/login_cubit/login_cubit.dart';
import 'package:rafiq/views/forget_password/screens/first_forget_password.dart';
import 'package:rafiq/views/login/widgets/custom_check_box.dart';
import 'package:rafiq/views/main_pages/main_home/screens/main_home.dart';
import 'package:rafiq/views/painter/bottom_cloud.dart';
import 'package:rafiq/views/painter/top_cloud.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // validate functions
  bool customValidteEmail() {
    if (emailController.text.isEmpty ||
        emailController.text.length < 2 ||
        emailController.text.length >= 35) {
      return false;
    } else {
      return true;
    }
  }

  bool customValidtePasswrod() {
    if (passwordController.text.isEmpty ||
        passwordController.text.length < 7 ||
        passwordController.text.length >= 65) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    var cubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccessState) {
          if (token == '') {
            await CahchHelper.updateData(
                    key: 'token', value: cubit.loginModel.results!.accessToken)
                .then(
              (value) => token = CahchHelper.getData(key: 'token'),
            );
          } else {
            await CahchHelper.saveData(
                    key: 'token', value: cubit.loginModel.results!.accessToken)
                .then((value) {
              token = CahchHelper.getData(key: 'token');
            });
          }
          // user name
          if (userName == '') {
            await CahchHelper.updateData(
                    key: 'userName',
                    value: cubit.loginModel.results!.user!.userName)
                .then(
              (value) => userName = CahchHelper.getData(key: 'userName'),
            );
          } else {
            await CahchHelper.saveData(
                    key: 'userName',
                    value: cubit.loginModel.results!.user!.userName)
                .then((value) {
              userName = CahchHelper.getData(key: 'userName');
            });
          }
          Navigator.pushReplacementNamed(context, MainHomeScreen.routeName);
          // refreshtoken
          /*  if (CahchHelper.getData(key: 'refreshToken') == '') {
            CahchHelper.saveData(
                    key: 'refreshToken',
                    value: cubit.loginModel.results!.accessToken)
                .then(
              (value) => Navigator.pushReplacementNamed(
                  context, MainHomeScreen.routeName),
            );
          } 
*/

          showTosat(msg: cubit.messege, state: true);
        } else if (state is LoginErrorState) {
          showTosat(msg: cubit.messege, state: false);
        }
      },
      builder: (context, state) {
        bool? rememberMe = CahchHelper.getData(key: 'rememberMe');
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h(851),
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.topCenter,
                        child: TopCloud(true),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: BottomCLoud(),
                      ),
                      Positioned(
                        top: h(190),
                        child: Padding(
                          padding: EdgeInsets.only(left: w(40)),
                          child: Form(
                            key: fromKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,

                            // TODO autovalidateMode: ,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: h(48.16),
                                ),
                                SizedBox(
                                  width: w(313),
                                  child: const Center(
                                    child: AutoSizeText(
                                      'Welcome back',
                                      style: TextStyle(
                                        fontFamily: 'DavidLibre',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 35,
                                        color: Color(0xff5B618A),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: h(41)),
                                InputField(
                                  // formKey: fromKey,
                                  label: 'Username or Email',
                                  sizeoflabel: 18,
                                  obscureText: false,
                                  controller: emailController,
                                ),
                                SizedBox(height: h(34)),
                                InputField(
                                  label: 'Password',
                                  sizeoflabel: 18,
                                  obscureText: cubit.obscureText,
                                  controller: passwordController,
                                  widget: InkWell(
                                    onTap: () {
                                      cubit.changeObscureText();
                                    },
                                    child: AutoSizeText(
                                      cubit.obscureText ? 'Show' : 'Hide',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'DavidLibre',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF5B618A),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: h(8),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        cubit.changeCheckBox();
                                        if (rememberMe == null) {
                                          CahchHelper.saveData(
                                              key: 'rememberMe',
                                              value: cubit.checkedBox);
                                        } else {
                                          CahchHelper.removeData(
                                            key: 'rememberMe',
                                          );
                                          CahchHelper.saveData(
                                              key: 'rememberMe',
                                              value: cubit.checkedBox);
                                        }
                                      },
                                      child: CustomCheckBox(cubit.checkedBox),
                                    ),
                                    SizedBox(
                                      width: w(8),
                                    ),
                                    const AutoSizeText(
                                      'Remember me',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'DavidLibre',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF5B618A),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: h(45)),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: w(53)),
                                  child: ConditionalBuilder(
                                    condition: (state is! LoginLoadingrState),
                                    builder: (context) => CustomButton(
                                      label: 'Log in',
                                      ontap: () async {
                                        if (customValidteEmail() &&
                                            customValidtePasswrod()) {
                                          await cubit.login(
                                            RequestLoginModel(
                                                userName: emailController.text,
                                                password:
                                                    passwordController.text),
                                          );
                                        } else {
                                          if (!customValidteEmail() &&
                                              customValidtePasswrod()) {
                                            showValidationTosat(context,
                                                'Please enter your correct email ');
                                          } else if (!customValidtePasswrod() &&
                                              customValidteEmail()) {
                                            showValidationTosat(context,
                                                'Please enter your correct password ');
                                          } else {
                                            showValidationTosat(context,
                                                'Please enter your correct data ');
                                          }
                                        }
                                      },
                                    ),
                                    fallback: (context) => SizedBox(
                                      width: w(200),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: h(20)),
                                SizedBox(
                                  width: w(313),
                                  child: Center(
                                    child: TextButton(
                                      child: const AutoSizeText(
                                        'Forget password?',
                                        style: TextStyle(
                                          fontSize: 16,
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'DavidLibre',
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF5B618A),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(context,
                                            FirstForgetPassword.routeName);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
