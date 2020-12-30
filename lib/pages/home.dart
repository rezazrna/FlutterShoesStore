import 'package:shoes_store/pages/profile.dart';
import 'package:shoes_store/pages/favorites.dart';
import 'package:shoes_store/pages/history.dart';
import 'package:shoes_store/pages/cart.dart';
import 'package:shoes_store/pages/dashboard.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.lightBlue,
        ),
        onPressed: () {
          setState(() {
            currentScreen = Cart();
            currentTab = 2;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 80,
                    onPressed: () {
                      setState(() {
                        currentScreen = Dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Icon(
                      Icons.home_rounded,
                      color: currentTab == 0 ? Colors.purple : Colors.grey,
                    ),
                  ),
                  MaterialButton(
                    minWidth: 80,
                    onPressed: () {
                      setState(() {
                        currentScreen = Favorites();
                        currentTab = 1;
                      });
                    },
                    child: Icon(
                      Icons.favorite,
                      color: currentTab == 1 ? Colors.purple : Colors.grey,
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 80,
                    onPressed: () {
                      setState(() {
                        currentScreen = History();
                        currentTab = 3;
                      });
                    },
                    child: Icon(
                      Icons.article,
                      color: currentTab == 3 ? Colors.purple : Colors.grey,
                    ),
                  ),
                  MaterialButton(
                    minWidth: 80,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profile();
                        currentTab = 4;
                      });
                    },
                    child: Icon(
                      Icons.account_circle_rounded,
                      color: currentTab == 4 ? Colors.purple : Colors.grey,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
