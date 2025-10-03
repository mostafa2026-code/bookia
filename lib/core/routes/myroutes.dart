import 'package:bookia/feature/bookdetails/pages/details_screen.dart';
import 'package:bookia/feature/home/data/model/home_response/product.dart';
import 'package:bookia/feature/home/presentation/pages/homescreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookia/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/forgetpassword/pages/forgetpassword.dart';
import 'package:bookia/feature/auth/presentation/login/pages/loginscreen.dart';
import 'package:bookia/feature/auth/presentation/otpverication/pages/otpvericationscreen.dart';
import 'package:bookia/feature/auth/presentation/register/pages/registerscreen.dart';

import 'package:bookia/feature/profile/profilemain/pages/profilescreen.dart';
import 'package:bookia/feature/profile/updateprofile/editptofile/editprofilescreen.dart';
import 'package:bookia/feature/splash/splashacreen.dart';
import 'package:bookia/feature/welcome/welcomescreen.dart';
import 'package:go_router/go_router.dart';

class MyRouts {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/signup';
  static const String forgetpassword = '/forgetpassword';
  static const String otpverication = '/otpverication';
  static const String profile = '/profile';
  static const String editprofile = '/editprofile';
  static const String details = '/details';

  final GoRouter myroutes = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) {
          return const Splashacreen();
        },
      ),
      GoRoute(
        path: welcome,
        builder: (context, state) {
          return const Welcomescreen();
        },
      ),
      GoRoute(
        path: home,
        builder: (context, state) {
          return const Homescreen();
        },
      ),
      GoRoute(
        path: login,
        builder: (context, state) {
          return const Loginscreen();
        },
      ),
      GoRoute(
        path: register,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: const Registerscreen(),
          );
        },
      ),
      GoRoute(
        path: otpverication,
        builder: (context, state) {
          return Otpvericationscreen();
        },
      ),
      GoRoute(
        path: profile,
        builder: (context, state) {
          return const Profilescreen();
        },
      ),
      GoRoute(
        path: editprofile,
        builder: (context, state) {
          return const Editprofilescreen();
        },
      ),
      GoRoute(
        path: details,
        builder: (context, state) {
          return DetailsScreen(model: state.extra as Product);
        },
      ),
      GoRoute(
        path: forgetpassword,
        builder: (context, state) {
          return const Forgetpassword();
        },
      ),
    ],
  );
}
