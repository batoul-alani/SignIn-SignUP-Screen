// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../Screens/home_screen.dart' as _i3;
import '../Screens/sign_in_screen.dart' as _i1;
import '../Screens/signupScreen.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SignInScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.SignInScreen());
    },
    SignUpScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.signUpScreen());
    },
    HomeScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.HomeScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SignInScreen.name, path: '/'),
        _i4.RouteConfig(SignUpScreen.name, path: '/sign-up-screen'),
        _i4.RouteConfig(HomeScreen.name, path: '/home-screen')
      ];
}

/// generated route for [_i1.SignInScreen]
class SignInScreen extends _i4.PageRouteInfo<void> {
  const SignInScreen() : super(name, path: '/');

  static const String name = 'SignInScreen';
}

/// generated route for [_i2.signUpScreen]
class SignUpScreen extends _i4.PageRouteInfo<void> {
  const SignUpScreen() : super(name, path: '/sign-up-screen');

  static const String name = 'SignUpScreen';
}

/// generated route for [_i3.HomeScreen]
class HomeScreen extends _i4.PageRouteInfo<void> {
  const HomeScreen() : super(name, path: '/home-screen');

  static const String name = 'HomeScreen';
}
