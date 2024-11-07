import 'package:flutter/material.dart';
import 'package:flutter_onboarding/main.dart';
import 'package:flutter_onboarding/menus/archive.dart';
import 'package:flutter_onboarding/menus/favorites.dart';
import 'package:flutter_onboarding/menus/inbox.dart';
import 'package:flutter_onboarding/menus/login.dart';
import 'package:flutter_onboarding/menus/outbox.dart';
import 'package:flutter_onboarding/menus/register.dart';
import 'package:flutter_onboarding/menus/spam.dart';
import 'package:flutter_onboarding/menus/trash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* all menus on drawer
  static const List<Widget> widgetDrawerMenu = <Widget>[
    Expanded(child: InboxPage()),
    Expanded(child: OutboxPage()),
    Expanded(child: FavoritesPage()),
    Expanded(child: ArchivePage()),
    Expanded(child: TrashPage()),
    Expanded(child: SpamPage()),
    Expanded(child: RegisterPage()),
    Expanded(child: LoginPage()),
  ];

//* drawer menu first time opened
  int selectedDrawerIndex = 0;

  //* change selected drawer menu
  void onChangeDrawerMenu(int index) {
    //* setState() is used to change state of the drawer
    setState(() {
      selectedDrawerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIMPLIFY APP'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        // leading: Icon(Icons.home),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.logout),
          //   onPressed: () async {
          //     final prefs = await SharedPreferences.getInstance();
          //     prefs.setBool('showHome', false);
          //     Navigator.of(context).pushReplacement(
          //       MaterialPageRoute(
          //         builder: (context) => OnBoarding(),
          //       ),
          //     );
          //   },
          // ),
          IconButton(
            onPressed: () => debugPrint('Search'),
            icon: Icon(Icons.search),
          ),
          PopupMenuButton(
            iconColor: Colors.white,
            tooltip: 'Menu item',
            itemBuilder: (context) {
              return {
                "Logout",
              }.map((String menu) {
                return PopupMenuItem(
                  value: menu,
                  child: Text(menu),
                );
              }).toList();
            },
            onSelected: (String menu) async {
              switch (menu) {
                case "Logout":
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', false);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => OnBoarding(),
                    ),
                  );
                  break;
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 240,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/nav-drawer-header-bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.teal,
                      backgroundImage:
                          AssetImage('assets/images/nav-drawer-avatar.jpg'),
                    ),
                    Padding(padding: EdgeInsets.only(top: 24)),
                    Text(
                      'Yusuf Rizal H.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'rizal@inixindo.co.id',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 24)),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Inbox'),
              selected: selectedDrawerIndex == 0,
              onTap: () {
                onChangeDrawerMenu(0);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text('Outbox'),
              selected: selectedDrawerIndex == 1,
              onTap: () {
                onChangeDrawerMenu(1);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              selected: selectedDrawerIndex == 2,
              onTap: () {
                onChangeDrawerMenu(2);
                Navigator.of(context).pop();
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.archive),
              title: Text('Archive'),
              selected: selectedDrawerIndex == 3,
              onTap: () {
                onChangeDrawerMenu(3);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Trash'),
              selected: selectedDrawerIndex == 4,
              onTap: () {
                onChangeDrawerMenu(4);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.warning),
              title: Text('Spam'),
              selected: selectedDrawerIndex == 5,
              onTap: () {
                onChangeDrawerMenu(5);
                Navigator.of(context).pop();
              },
            ),
            ExpansionTile(
              title: Text('USER AREA'),
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person_add),
                  title: Text('Register'),
                  selected: selectedDrawerIndex == 6,
                  onTap: () {
                    onChangeDrawerMenu(6);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.login),
                  title: Text('Login'),
                  selected: selectedDrawerIndex == 7,
                  onTap: () {
                    onChangeDrawerMenu(7);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widgetDrawerMenu[selectedDrawerIndex],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const snackBar = SnackBar(
            backgroundColor: Colors.teal,
            duration: Duration(seconds: 5),
            showCloseIcon: true,
            closeIconColor: Colors.white,
            content: Text('This message is a snackbar'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        backgroundColor: Colors.teal,
        child: Icon(
          Icons.create,
          color: Colors.white,
        ),
      ),
    );
  }
}
