import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:venkat_ecommerce/firstpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1600983326705-585903fbd55b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjB8fHBvdHRlcnl8ZW58MHwxfDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1572186192734-e82b57dc4435?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fHBvdHRlcnl8ZW58MHwxfDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1594009756326-6bb1d980dbf6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    'https://images.unsplash.com/photo-1588436979745-9127c5e2908a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=282&q=80',
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) {
            final double height = MediaQuery.of(context).size.height;
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstPage(),
                  ),
                );
              },
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        height: height,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: imgList
                        .map((item) => Container(
                              child: Center(
                                  child: Image.network(
                                item,
                                fit: BoxFit.cover,
                                height: height,
                              )),
                            ))
                        .toList(),
                  ),
                  Positioned(
                    top: 10.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Container(
                            width: 20.0,
                            height: 4.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Modular Planters',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: height * 0.03),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Designed to form the artificial \n enviroinment of any plant',
                              style: TextStyle(fontSize: height * 0.02),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 30,
                    child: Container(
                      height: 80,
                      width: 80,
                      child: RaisedButton.icon(
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstPage(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.navigate_next,
                          size: height * 0.05,
                          color: Colors.white,
                        ),
                        label: Text(''),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: Colors.black)),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
