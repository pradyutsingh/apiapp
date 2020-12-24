import 'package:apiapp/screens/menuscreen.dart';
import 'package:apiapp/screens/restropage.dart';
import 'package:apiapp/screens/searchscreen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:apiapp/models/positionClass.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int widgetindex = 0;
  @override
  Widget build(BuildContext context) {
    final positionClass positiondata = ModalRoute.of(context).settings.arguments;
    return Scaffold(appBar: 
    AppBar(
      title: Text(
        "ZomZom",
        ),
      actions: [
        IconButton(icon: Icon(Icons.supervised_user_circle), onPressed: null)
      ],
      ),
      body: IndexedStack(
        index: widgetindex,
        children: [
          RestroList(latitude: positiondata.latitude,
                      longitude: positiondata.longitude),
          SearchScreen(),
          MenuScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: widgetindex,
        onTap: (index){
          setState(() {
            widgetindex =index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Restaraunt',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menus',
          ),
        ],
        
      )

    );

  }
}
