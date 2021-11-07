// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../Screens/home_screen.dart' as _i3;
import '../Screens/products_by_categories_screen.dart' as _i4;
import '../Screens/sign_in_screen.dart' as _i1;
import '../Screens/signupScreen.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SignInScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.SignInScreen());
    },
    SignUpScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.signUpScreen());
    },
    HomeScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.HomeScreen());
    },
    ProductsByCategories.name: (routeData) {
      final args = routeData.argsAs<ProductsByCategoriesArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.ProductsByCategories(PBC:args.PBC));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SignInScreen.name, path: '/'),
        _i5.RouteConfig(SignUpScreen.name, path: '/sign-up-screen'),
        _i5.RouteConfig(HomeScreen.name, path: '/home-screen'),
        _i5.RouteConfig(ProductsByCategories.name,
            path: '/products-by-categories')
      ];
}

/// generated route for [_i1.SignInScreen]
class SignInScreen extends _i5.PageRouteInfo<void> {
  const SignInScreen() : super(name, path: '/');

  static const String name = 'SignInScreen';
}

/// generated route for [_i2.signUpScreen]
class SignUpScreen extends _i5.PageRouteInfo<void> {
  const SignUpScreen() : super(name, path: '/sign-up-screen');

  static const String name = 'SignUpScreen';
}

/// generated route for [_i3.HomeScreen]
class HomeScreen extends _i5.PageRouteInfo<void> {
  const HomeScreen() : super(name, path: '/home-screen');

  static const String name = 'HomeScreen';
}

/// generated route for [_i4.ProductsByCategories]
class ProductsByCategories extends _i5.PageRouteInfo<ProductsByCategoriesArgs> {
  ProductsByCategories({required dynamic PBC})
      : super(name,
            path: '/products-by-categories',
            args: ProductsByCategoriesArgs(PBC: PBC));

  static const String name = 'ProductsByCategories';
}

class ProductsByCategoriesArgs {
  const ProductsByCategoriesArgs({required this.PBC});

  final dynamic PBC;
}
