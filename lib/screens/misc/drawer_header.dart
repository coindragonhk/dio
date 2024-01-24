import 'package:flutter/material.dart';

class DrawerHeaderBox extends StatefulWidget {
  const DrawerHeaderBox({Key? key}): super(key: key);

  @override
  _DrawerHeaderState createState() => _DrawerHeaderState();
}

class _DrawerHeaderState extends State<DrawerHeaderBox> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      color: Colors.red,
      constraints: const BoxConstraints.expand(height: 175.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.red,
                  ),
                  SizedBox(
                    height: 88.0,
                    width: 88.0,
                    child: Image.asset(""),
                  )
                ],
              ),
              Text(
                'Developer Libs',
                style: textTheme.subtitle1?.copyWith(color: Colors.white70),
              ),
              Text(
                'developerlibs@gmail.com',
                style: textTheme.subtitle1?.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
