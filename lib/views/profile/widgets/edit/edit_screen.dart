import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/data/data_API/profile/update_user_info_API.dart';
import 'package:rafiq/logic/cubit/update_user_info_cubit/update_user_cubit.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';

import 'package:rafiq/views/main_pages/main_sign_up/sign_up_classes/widget/container_choose.dart';
import 'package:rafiq/views/profile/widgets/edit/widgets/country_input_field.dart';
import 'package:rafiq/views/profile/widgets/edit/widgets/date_of%20_birth_input_field.dart';
import 'package:rafiq/views/profile/widgets/edit/widgets/edit_input_field.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);
  static const routeName = '/edit_screen';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xffDBD1EB),
      statusBarBrightness: Brightness.dark,
    ));
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    TextEditingController firstNameController = TextEditingController()
      ..text = ' ${context.read<UserDataCubit>().firstName!}';

    TextEditingController lastNameController = TextEditingController()
      ..text = '${context.read<UserDataCubit>().lastName!}';

    TextEditingController passwordController = TextEditingController();

    TextEditingController facebookController = TextEditingController();

    TextEditingController instagramController = TextEditingController();

    TextEditingController tiktokController = TextEditingController();

    return BlocProvider(
      create: (context) =>
          UpdateUserCubit(updataUserInfoRepo: UpdateUserInfoAPI()),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffDBD1EB),
                Color(0xffDBD1EB),
                Color(0xffF7F4F8),
              ],
            ),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: height(169),
                child: Stack(
                  children: [
                    Positioned(
                      left: width(19),
                      top: height(23.83),
                      child: SizedBox(
                        width: width(264),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                            Text(
                              'Edit your profile',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(fontSize: 24),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: height(-10),
                      right: width(-25),
                      child: SvgPicture.asset(
                          'assets/images/edit_profile/Earth.svg'),
                    ),
                    Positioned(
                      top: height(95),
                      left: width(39),
                      child: EditInputField(
                        controller: firstNameController,
                        label: 'FirstName',
                        sizeoflabel: 20,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height(31)),
              Column(
                children: [
                  EditInputField(
                    controller: lastNameController,
                    label: 'LastName',
                    sizeoflabel: 20,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: height(31)),
                  const CountryInputField(),
                  SizedBox(height: height(31)),
                  const EditInputField(
                    label: 'Lives in',
                    sizeoflabel: 20,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: height(31)),
                  const DateOfBirthInputField(),
                  SizedBox(height: height(31)),
                  BlocBuilder<UpdateUserCubit, UpdateUserState>(
                    builder: (context, state) {
                      return EditInputField(
                        label: 'Password',
                        sizeoflabel: 20,
                        obscureText:
                            context.read<UpdateUserCubit>().obscureText,
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        widget: InkWell(
                          onTap: () {
                            context.read<UpdateUserCubit>().changeObscureText();
                          },
                          child: AutoSizeText(
                            BlocProvider.of<UpdateUserCubit>(context)
                                    .obscureText
                                ? 'Show'
                                : 'Hide',
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'DavidLibre',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF5B618A),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: height(31)),
                  EditInputField(
                    controller: facebookController,
                    label: 'Facebook',
                    sizeoflabel: 20,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    widget: Row(
                      children: [
                        Container(
                          height: height(38),
                          width: width(4),
                          color: const Color(0xFF5B618A).withOpacity(0.6),
                        ),
                        SizedBox(
                          width: width(7),
                        ),
                        SvgPicture.asset(
                            'assets/images/edit_profile/facebook.svg'),
                      ],
                    ),
                  ),
                  SizedBox(height: height(31)),
                  EditInputField(
                    controller: instagramController,
                    label: 'Instagram',
                    sizeoflabel: 20,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    widget: Row(
                      children: [
                        Container(
                          height: height(38),
                          width: width(4),
                          color: const Color(0xFF5B618A).withOpacity(0.6),
                        ),
                        SizedBox(
                          width: width(7),
                        ),
                        SvgPicture.asset(
                            'assets/images/edit_profile/instagram.svg'),
                      ],
                    ),
                  ),
                  SizedBox(height: height(31)),
                  EditInputField(
                    controller: tiktokController,
                    label: 'TikTok',
                    sizeoflabel: 20,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    widget: Row(
                      children: [
                        Container(
                          height: height(38),
                          width: width(4),
                          color: const Color(0xFF5B618A).withOpacity(0.6),
                        ),
                        SizedBox(
                          width: width(7),
                        ),
                        SvgPicture.asset(
                            'assets/images/edit_profile/tiktok.svg'),
                      ],
                    ),
                  ),
                  SizedBox(height: height(28)),
                ],
              ),
              SizedBox(
                height: height(205),
                child: Stack(
                  children: [
                    Positioned(
                      left: width(39),
                      child: AutoSizeText(
                        'Gender',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    BlocBuilder<UpdateUserCubit, UpdateUserState>(
                      builder: (context, state) {
                        var cubit = context.read<UpdateUserCubit>();
                        return Positioned(
                          left: width(93.25),
                          top: height(27),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  cubit.changeGenderValue('Male');
                                },
                                child: ContainerChoose('Male', width(94),
                                    height(33), cubit.isMale),
                              ),
                              SizedBox(
                                width: width(18.5),
                              ),
                              InkWell(
                                onTap: () {
                                  cubit.changeGenderValue('Female');
                                },
                                child: ContainerChoose('Female', width(94),
                                    height(33), cubit.isFemale),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Positioned(
                      left: width(0),
                      bottom: height(-2),
                      child: SvgPicture.asset(
                          'assets/images/edit_profile/plane.svg'),
                    ),
                    Positioned(
                      right: width(128),
                      bottom: height(26),
                      child: BlocBuilder<UpdateUserCubit, UpdateUserState>(
                        builder: (context, state) {
                          var cubit = context.read<UpdateUserCubit>();
                          return ConditionalBuilder(
                            condition: (state is! UpdateUserInfoLoadingState),
                            builder: (context) => InkWell(
                              onTap: () {
                                cubit.changeLableOfButtonSaveEditProfileData();
                                cubit
                                    .changeBackGroundColorOfButtonSaveEditProfileData();
                                cubit
                                    .changeColorLableOfButtonSaveEditProfileData();
                              },
                              child: Container(
                                height: height(43),
                                width: width(136),
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xff6E75A0),
                                      blurRadius: 7,
                                    ),
                                  ],
                                  border: Border.all(
                                    color: const Color(0xff6E75A0),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: cubit.backGroundBottonColor,
                                ),
                                child: Center(
                                  child: AutoSizeText(
                                    cubit.lable,
                                    style: TextStyle(
                                      color: cubit.colorOFLable,
                                      fontSize: 25,
                                      fontFamily: 'DavidLibre',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            fallback: (context) => CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
