import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:genta_ios/News/newsscreen.dart';
import 'package:genta_ios/Kuisioner/kuisionerscreen.dart';
import 'package:genta_ios/Upcoming Events/upcomingeventsscreen.dart';
import 'package:genta_ios/EGENTA/egentascreen.dart';
import 'package:genta_ios/Login/loginscreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            title: Text('Upcoming Events'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bookmark_solid),
            title: Text('e-genta'.toUpperCase()),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.create_solid),
            title: Text('Kuisioner'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_solid),
            title: Text('Login'),
          ),
        ]),
        tabBuilder: (context, index) {
          if (index == 0) {
            return NewsPageScreen();
          } else if (index == 1) {
            return UpcomingEventsScreen();
          } else if (index == 2) {
            return EGENTAScreen();
          } else if (index == 3) {
            return KuisionerScreen();
          } else {
            return LoginScreen();
          }
        });
  }
}
