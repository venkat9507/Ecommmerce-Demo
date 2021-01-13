import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final name, imgUrl, description, price;
  SecondPage({this.name, this.description, this.imgUrl, this.price});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List data;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                      Icons.favorite_border,
                      size: size.width * 0.09,
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Image.network(
                          widget.imgUrl,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.name),
                                  ),
                                  Text(
                                    '₹ ${widget.price.toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.height * 0.03),
                                  )
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 60,
                                child: RaisedButton(
                                  color: Colors.black,
                                  onPressed: () {},
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(color: Colors.black)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.description),
                        ),
                        Container(
                          width: size.width,
                          child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: Colors.black,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
