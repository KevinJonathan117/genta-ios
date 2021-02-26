import 'package:flutter/cupertino.dart';
import 'package:genta_ios/styles.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Login'),
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
