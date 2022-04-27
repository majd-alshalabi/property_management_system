import 'package:flutter/material.dart';
import 'package:property_management_system/core/constant/colors.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<String> listImage = [
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg',
    'assets/images/123.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite'),
      ),
      drawer: Drawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(5),
          crossAxisSpacing: 15,
          mainAxisSpacing: 30,
          children: listImage
              .map(
                (item) => Card(
                  elevation: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: grey,
                      image: DecorationImage(
                        image: AssetImage(item),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
