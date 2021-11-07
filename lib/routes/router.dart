import 'package:auto_route/auto_route.dart';
import 'package:ecommerancy/Screens/home_screen.dart';
import 'package:ecommerancy/Screens/signupScreen.dart';
import 'package:ecommerancy/Screens/sign_in_screen.dart';
import 'package:ecommerancy/Screens/products_by_categories_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
      AutoRoute(page: SignInScreen,initial: true),
      AutoRoute(page: signUpScreen),
      AutoRoute(page: HomeScreen),
      AutoRoute(page: ProductsByCategories),
])
// @MaterialAutoRouter(
//     replaceInRouteName: 'Page,Route',
//     routes: <AutoRoute>[
//       AutoRoute(page: SignInScreen,initial: true),
//       AutoRoute(page: signUpScreen),
//       AutoRoute(page: HomeScreen),
//     ])

class $AppRouter{

}

