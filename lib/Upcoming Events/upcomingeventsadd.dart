import 'package:flutter/cupertino.dart';
import 'package:genta_ios/styles.dart';

class UpcomingEventsAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Upload Upcoming Event'),
          ),
          child: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Coming Soon',
                  style: Styles.headlineNothingness,
                )),
          ),
        );
      },
    );
  }
}
