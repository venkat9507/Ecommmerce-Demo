import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:venkat_ecommerce/secondpage.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List data;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('json_data/data.json'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var data = json.decode(snapshot.data.toString());
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.navigate_before,
                                size: size.width * 0.09,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Spacer(),
                            Icon(
                              Icons.more_horiz_rounded,
                              size: size.width * 0.09,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Choose Device',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.03),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: size.width * 0.16,
                              width: size.width * 0.18,
                              child: RaisedButton.icon(
                                color: Colors.white,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  size: size.width * 0.05,
                                  color: Colors.black,
                                ),
                                label: Text(''),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.black)),
                              ),
                            ),
                            Container(
                              height: size.width * 0.16,
                              width: size.width * 0.18,
                              child: RaisedButton.icon(
                                color: Colors.white,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.sort,
                                  size: size.width * 0.05,
                                  color: Colors.black,
                                ),
                                label: Text(''),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.black)),
                              ),
                            ),
                            Container(
                              height: size.width * 0.16,
                              child: RaisedButton(
                                color: Colors.black,
                                onPressed: () {},
                                child: Text(
                                  'Cart \t 2',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: new GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            shrinkWrap: true,
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) =>
                                InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SecondPage(
                                      imgUrl: data[index]['imgUrl'],
                                      name: data[index]['name'],
                                      price: data[index]['price'],
                                      description: data[index]['description'],
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Image.network(data[index]['imgUrl'],
                                      fit: BoxFit.scaleDown,
                                      height: size.width * 0.3),
                                  new Text(data[index]['name']),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
