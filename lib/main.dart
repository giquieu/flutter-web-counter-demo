import 'package:flutter_web/material.dart';
import 'package:hello_flutter_web/controller/main-controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web Counter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Web Counter Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  MainController mainController = MainController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                StreamBuilder<int> (
                      stream: mainController.counterStream,
                      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data.toString(),
                            style: TextStyle(
                              fontSize: 50
                            ),
                          );
                        }
                      }
                  ),
                  RaisedButton(
                    child: Text('Counter'),
                    onPressed: () {
                      mainController.plusCounter();
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
