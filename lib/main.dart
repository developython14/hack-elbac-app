import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_mac/get_mac.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Screnn(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _platformID = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hackelbac prototype'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('unique data of devices Infos'), Text(_platformID)],
        ),
      ),
    );
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await GetMac.macAddress;
    } on PlatformException {
      platformVersion = 'Failed to get Device MAC Address.';
    }
    print("MAC-: " + platformVersion);
    if (!mounted) return;
    setState(() {
      _platformID = platformVersion;
    });
  }
}

class Screnn extends StatefulWidget {
  @override
  _ScrennState createState() => _ScrennState();
}

class _ScrennState extends State<Screnn> {
  bool _secureMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Secure Mode: ${_secureMode.toString()}\n'),
              ElevatedButton(
                  onPressed: () async {
                    final secureModeToggle = !_secureMode;

                    if (secureModeToggle == true) {
                      await FlutterWindowManager.addFlags(
                          FlutterWindowManager.FLAG_SECURE);
                    } else {
                      await FlutterWindowManager.clearFlags(
                          FlutterWindowManager.FLAG_SECURE);
                    }

                    setState(() {
                      _secureMode = !_secureMode;
                    });
                  },
                  child: const Text("Toggle Secure Mode")),
            ],
          ),
        ),
      ),
    );
  }
}
