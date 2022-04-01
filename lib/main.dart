import 'package:flutter/material.dart';
import './utils/my_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.buildDark(),
      // theme: ThemeData.light(), //the default
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.back_hand),
          title: const Text('Themed App'), //gets font from AppBarTheme
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Some Title',
                        style: Theme.of(context).textTheme.headline3,
                        // we can use Theme.of(context) to target props from Theme
                      ),
                      Theme(
                        data: ThemeData.from(
                          colorScheme: ColorScheme.fromSwatch(
                            primarySwatch: Colors.amber,
                          ),
                          textTheme: const TextTheme(
                            bodyText2: TextStyle(
                              fontSize: 40,
                              fontFamily: 'SendFlowers',
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        child: Builder(builder: (context) {
                          return Text(
                            'Some SubTitle',
                            style: Theme.of(context).textTheme.bodyText2,
                          );
                        }),
                      ),
                      Text(
                        'lots and lots and lots of body text',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Icon(Icons.radar), //uses IconThemeData
                    ],
                  ),
                ),
              ),
              const ListTile(
                title: Text('ListTile Title'), //uses textTheme.subTitle1
                subtitle: Text('ListTile Subtitle'), //uses textTheme.bodyText2
                leading: Icon(Icons.card_giftcard),
              ),
              ElevatedButton(
                child: const Text('Click This'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.black87,
                  // Theme.of(context).colorScheme.primary, //from colorScheme
                ),
                onPressed: () {
                  //click the button
                  //colors from ElevatedButton.styleFrom()
                },
              ),
              ElevatedButton(
                child: const Text('Click again'),
                //using the style from the theme
                onPressed: () {
                  //click the button
                  //colors from ElevatedButtonTheme
                },
              ),
              TextButton(
                onPressed: () {
                  //click the button
                  //color from textButtonTheme
                },
                child: Text('TextButton'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {}),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.abc),
                label: 'ABC',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.watch),
                label: 'Watch',
              ),
            ],
            onTap: (int index) {
              //change the active bar item
            }),
      ),
    );
  }
}
