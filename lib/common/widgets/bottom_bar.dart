import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fullstack_amazon_clone/constants/global_variables.dart';
import 'package:fullstack_amazon_clone/features/account/account_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  List<Widget> pages = [
    const Center(
      child: Text('Home'),
    ),
    const AccountScreen(),
    const Center(child: Text('Cart'))
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 0
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(Icons.home_outlined),
              ),
              label: ""),
          //account
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 1
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(Icons.person_outline_outlined),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: Badge(
                  badgeColor: Colors.white,
                  badgeContent: Text(
                    "2",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
              label: ""),
        ],
      ),
    );
  }
}
