import 'package:bookia/feature/auth/presentation/createnewpassword/pages/createnewpasswordscreen.dart';
import 'package:bookia/feature/auth/presentation/passwordchangedsuccess/pages/passwordchangedsuccessfullyscreen.dart';
import 'package:bookia/feature/bookdetails/pages/details_screen.dart';
import 'package:bookia/feature/cart/cart/presentations/cubit/cartcubit.dart';
import 'package:bookia/feature/cart/cart/presentations/pages/congratulationscreen.dart';
import 'package:bookia/feature/home/data/model/home_response/product.dart';
import 'package:bookia/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/pages/main_screen.dart';
import 'package:bookia/feature/home/presentation/pages/search_screen.dart';
import 'package:bookia/feature/place/pages/place_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookia/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/forgetpassword/pages/forgetpassword.dart';
import 'package:bookia/feature/auth/presentation/login/pages/loginscreen.dart';
import 'package:bookia/feature/auth/presentation/otpverication/pages/otpvericationscreen.dart';
import 'package:bookia/feature/auth/presentation/register/pages/registerscreen.dart';

import 'package:bookia/feature/profile/profilemain/presenatation/pages/profilescreen.dart';
import 'package:bookia/feature/profile/updateprofile/editptofile/editprofilescreen.dart';
import 'package:bookia/feature/splash/splashacreen.dart';
import 'package:bookia/feature/welcome/welcomescreen.dart';
import 'package:go_router/go_router.dart';

class MyRouts {
  static const String splash = '/';
  static const String welcome = '/welcome';

  static const String login = '/login';
  static const String register = '/signup';
  static const String forgetpassword = '/forgetpassword';
  static const String otpverication = '/otpverication';
  static const String profile = '/profile';
  static const String editprofile = '/editprofile';
  static const String details = '/details';
  static const String search = '/search';

  static const String main = '/mainscreen';
  static const String place = '/place';
  static const String createNewPassword = '/createNewPassword';
  static const String passwordChangedSuccessfully =
      '/passwordChangedSuccessfully';
  static const String congratulationscreen = '/Congratulationscreen';

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
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: Otpvericationscreen(email: state.extra as String),
          );
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
          return BlocProvider(
            create: (context) => HomeCubit(),
            child: DetailsScreen(book: state.extra as Product),
          );
        },
      ),
      GoRoute(
        path: forgetpassword,
        builder: (context, state) {
          return const Forgetpassword();
        },
      ),
      GoRoute(
        path: main,
        builder: (context, state) {
          final int? index = state.extra is int ? state.extra as int : null;
          return MainScreen(index: index);
        },
      ),
      GoRoute(
        path: congratulationscreen,
        builder: (context, state) {
          return const Congratulationscreen();
        },
      ),
      GoRoute(
        path: search,
        builder: (context, state) {
          return const SearchScreen();
        },
      ),
      GoRoute(
        path: place,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => Cartcubit(),
            child: const PlaceScreen(),
          );
        },
      ),
      GoRoute(
        path: search,
        builder: (context, state) {
          return const SearchScreen();
        },
      ),
      GoRoute(
        path: passwordChangedSuccessfully,
        builder: (context, state) {
          return const Passwordchangedsuccessfullyscreen();
        },
      ),
      GoRoute(
        path: createNewPassword,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: Createnewpasswordscreen(otp: state.extra as String),
          );
        },
      ),
    ],
  );
}
