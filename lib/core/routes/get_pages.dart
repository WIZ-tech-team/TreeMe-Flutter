import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treeme/core/bindings/forgot_passwod_bindings.dart';
import 'package:treeme/core/bindings/my_contact_bindings.dart';
import 'package:treeme/modules/auth/presentation/pages/forgot_password_screen.dart';
import 'package:treeme/modules/chat/presentation/pages/chat_screen.dart';
import 'package:treeme/modules/create_event/presentation/pages/create_event_screen.dart';
import 'package:treeme/modules/create_event/presentation/pages/select_contact_owner_screen.dart';
import 'package:treeme/modules/create_event/presentation/pages/select_contacts_screen.dart';
import 'package:treeme/modules/create_event/presentation/pages/type_with_theme_screen.dart';
import 'package:treeme/modules/my_profile/presentation/pages/edit_profile_screen.dart';
import 'package:treeme/modules/nav_bar/presentation/pages/nav_bar_screen.dart';
import 'package:treeme/modules/profile/presentation/pages/profile_screen.dart';

import '../../modules/auth/presentation/pages/login_screen.dart';
import '../../modules/auth/presentation/pages/sign_up_screen.dart';
import '../../modules/home/presentation/pages/home_screen.dart';
import '../../modules/on_boarding/presentation/pages/on_boarding_screen.dart';
import '../../modules/splash/presentation/pages/splash_screen.dart';
import '../bindings/bindings_export.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      // binding: MainBindings(),
    ),
    GetPage(
        name: AppRoutes.onBoarding,
        page: () => const OnBoardingScreen(),
        // binding: MainBinding(),c
        curve: Curves.easeInOutQuart,
        transition: Transition.cupertino,
        transitionDuration: Duration(milliseconds: 2000)),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
        name: AppRoutes.register,
        page: () => SignUpScreen(),
        bindings: [LoginBindings(), SignUpBindings()]),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: AppRoutes.navBar,
        page: () => const NavBarScreen(),
        binding: NavBarBindings()),
    GetPage(
      name: AppRoutes.createEvent,
      page: () => const CreateEventScreen(),
      bindings: [
        MyContactBinding(),
        CreateEventBindings(),
      ],
    ),
    GetPage(
        name: AppRoutes.selecetOwner,
        page: () => const SelectOwnerContact(),
        binding: CreateEventBindings()),
    GetPage(
        name: AppRoutes.typeWithTheme,
        page: () => const TypeWiththemeScreen(),
        binding: CreateEventBindings()),
    GetPage(
        name: AppRoutes.selectContactScreen,
        page: () => const SelectContactsScreen(),
        binding: CreateEventBindings()),
    GetPage(
        name: AppRoutes.profile,
        page: () => const ProfileScreen(),
        binding: ProfileBindings()),
    GetPage(name: AppRoutes.chat, page: () => ChatScreen(), binding: ChatBindings()),
    // GetPage(
    //     name: AppRoutes.createMedia,
    //     page: () => CreateMediaScreen(),
    //     binding: CreateMediaBindings()),
    GetPage(
        name: AppRoutes.forgotPassword,
        page: () => ForgotPasswordScreen(),
        binding: ForgotPasswordBindings()),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => EditProfileScreen(),
    ),
  ];
}
