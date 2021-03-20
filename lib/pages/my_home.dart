import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:successproject/pages/auth_page.dart';
import 'package:successproject/provider/page_notifier.dart';
import 'google_map_screen.dart';

class MyHomePage extends StatefulWidget {

  static final String pageName = 'MyHomepage';

MyHomePage({Key key, this.title}) : super(key: key);

final String title;

@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: (){
            Provider.of<PageNotifier>(context, listen: false).goToOtherPage(AuthPage.pageName);
          })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Main page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      drawer: new Drawer(
        // 리스트뷰 추가
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // 드로워해더 추가
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            // 리스트타일 추가
            ListTile(
              title: Text('Item 1'),
              onTap: (){
                // 네이게이터 팝을 통해 드로워를 닫는다.
                Navigator.pop(context);
              },
            ),
            // 리스트타일 추가
            ListTile(
              title: Text('Item 2'),
              onTap: (){
                // 드로워를 닫음
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapScreen())),
        tooltip: 'Google Map',
        child: Icon(Icons.pin_drop_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
