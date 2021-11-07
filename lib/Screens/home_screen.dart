import 'package:ecommerancy/main.dart';
import '../viewModel/providerData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerancy/Screens/explore_page.dart';
import 'package:ecommerancy/Screens/basket_page.dart';
import 'package:ecommerancy/Screens/profile_page.dart';
import 'package:ecommerancy/viewModel/providerData.dart';

class HomeScreen extends StatelessWidget{
  List _pages=[
    ExplorePage(),
    BasketPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderData>(
        builder: (context,providerDate,child) {
          return Scaffold(
            appBar:  Provider.of<ProviderData>(context, listen: false).currentIndex==0?AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: Padding(padding:EdgeInsets.symmetric(horizontal: 10.0,vertical: 7.0),child: IconButton(onPressed: (){}, icon: Icon(Icons.search),color: Colors.black,iconSize: 24.0,)),
              actions: [
                 Padding(padding:EdgeInsets.symmetric(horizontal: 10.0,vertical: 7.0),child: CircleAvatar(radius:30,backgroundColor:basicColor,child: IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined),color: Colors.white,iconSize: 24.0,)))],
            ):null,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: Provider
                  .of<ProviderData>(context, listen: false)
                  .currentIndex,
              onTap: (newIndex) {
                Provider.of<ProviderData>(context, listen: false).currentIndex = newIndex;
                Provider.of<ProviderData>(context, listen: false).currentIndex;
                print(Provider.of<ProviderData>(context, listen: false).currentIndex);
              },
              selectedLabelStyle: TextStyle(fontFamily: 'NotoSans',),
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black54,
              backgroundColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    label: 'Explore', icon: Icon(Icons.search)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Basket'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
            body:  _pages.elementAt(Provider
                .of<ProviderData>(context, listen: false)
                .currentIndex),
        );
      }
    );
  }
}
