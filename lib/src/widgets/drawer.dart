import 'package:flutter/material.dart';
import 'package:sample_todo/src/utils/http.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // if (!kReleaseMode)
              ListTile(
                leading: Icon(Icons.bug_report),
                title: Text('Show Http request'),
                onTap: () {
                  alice.showInspector();
                },
              ),
          ],
        ),
      ),
    );
  }
}
