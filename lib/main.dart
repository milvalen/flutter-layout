import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  PageState createState() => PageState();
}

class PageState extends State<Page> {
  var _toggled = false;

  void toggle() => setState(() => _toggled = !_toggled);

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
          children: [
            Row(children: [Text(_toggled ? 'This is a cat' : 'This is my Flutter app!')]),
            const SizedBox(height: 42),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () => launchSite('github.com'),
                    child: const Text('github'),
                  )
                ]
            ),
            const SizedBox(height: 42),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButton(
                    onPressed: () => launchSite('youtube.com'),
                    child: const Text('youtube'),
                  )
                ]
            ),
          ]
      ),
      GestureDetector(
        onTap: () => toggle(),
        child: const Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ36-P_hF9F94w44taOE9yRUFXcYDF3FxIeg&s')),
      )
    ],
  );
}

void launchSite(String authority) async {
  var url = Uri.https(authority);

  await canLaunchUrl(url)
      ? launchUrl(url)
      : throw 'Could not launch $url';
}

void main() =>
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(42),
            child: const Page(),
          ),
        ),
      )
    );
