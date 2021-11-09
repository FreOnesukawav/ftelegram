import 'dart:async';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tdlib/td_client.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tdlib/td_api.dart' show TdObject;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TDLib Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter TDLib Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*
  Here we go!
   */
  int clientId = 0;
  StreamController<TdObject> _eventController = StreamController();
  late StreamSubscription<TdObject> _eventReceiver;

  void _clientCreator() async {
    /*
     Here we renew!
   */
    int oldClientId = clientId;
    int newClientId = await TdClient.createClient();
    setState(() {
      clientId = newClientId;
      if (_eventReceiver != null) {
        _eventReceiver.cancel();
      }
      _eventReceiver = TdClient.clientEvents(clientId).listen(_receiver);
    });
    // closing after renewing! just to get NEW client identifier.
    if (oldClientId != 0) {
      await TdClient.destroyClient(oldClientId);
    }
  }

  @override
  void initState() {
    super.initState();
    // clientId = await TdClient.createClient();
    // _eventReceiver = TdClient.clientEvents(clientId).listen(_receiver);
  }

  @override
  void dispose() {
    _eventController.close();
    _eventReceiver.cancel();
    TdClient.destroyClient(clientId);
    super.dispose();
  }

  void _receiver(TdObject newEvent) async {
    if (newEvent != null) {
      _eventController.add(newEvent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'TDLib Client ID\n$clientId',
            ),
            Text(
              '',
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.display1,
            ),
            StreamBuilder(
                stream: _eventController.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<TdObject> snapshot) {
                  if (!snapshot.hasData) {
                    return Text("");
                  } else {
                    return Text(snapshot.data!.toJson().toString());
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clientCreator,
        tooltip: 'creator',
        child: Icon(Icons.cached),
      ),
    );
  }
}
