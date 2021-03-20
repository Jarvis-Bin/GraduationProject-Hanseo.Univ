import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:successproject/pages/auth_page.dart';
import 'package:successproject/pages/my_home.dart';
import 'package:successproject/provider/page_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>PageNotifier())],
      child: MaterialApp(
        title: '식후 30분',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: Consumer<PageNotifier>(
          builder: (context, pageNotifier, child){
            return Navigator(
              pages: [
                MaterialPage(
                    key: ValueKey(MyHomePage.pageName),
                    child: MyHomePage(title: '식후 30분')),
                if(pageNotifier.currentPage == AuthPage.pageName)AuthPage(),
              ],
              onPopPage:(route, result){
                if (!route.didPop(result)){
                  return false;
                }
                return true;
              },
            );
          },
          ),
        ),
      );
  }
}
