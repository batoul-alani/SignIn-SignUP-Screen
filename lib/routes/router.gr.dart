// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../Screens/home_screen.dart' as _i5;
import '../Screens/sign_in_screen.dart' as _i3;
import '../Screens/signupScreen.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SignInScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.SignInScreen();
        }),
    SignUpScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.signUpScreen();
        }),
    HomeScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.HomeScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SignInScreen.name, path: '/'),
        _i1.RouteConfig(SignUpScreen.name, path: '/sign-up-screen'),
        _i1.RouteConfig(HomeScreen.name, path: '/home-screen')
      ];
}

class SignInScreen extends _i1.PageRouteInfo {
  const SignInScreen() : super(name, path: '/');

  static const String name = 'SignInScreen';
}

class SignUpScreen extends _i1.PageRouteInfo {
  const SignUpScreen() : super(name, path: '/sign-up-screen');

  static const String name = 'SignUpScreen';
}

class HomeScreen extends _i1.PageRouteInfo {
  const HomeScreen() : super(name, path: '/home-screen');

  static const String name = 'HomeScreen';
}
