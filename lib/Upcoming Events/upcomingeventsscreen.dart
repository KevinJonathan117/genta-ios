import 'package:flutter/cupertino.dart';
import 'package:genta_ios/styles.dart';
import 'package:genta_ios/Upcoming Events/upcomingeventsadd.dart';

class UpcomingEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Upcoming Events')
          ),
          child: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'No Data',
                  style: Styles.headlineNothingness,
                )),
          ),
        );
      },
    );
  }
}
