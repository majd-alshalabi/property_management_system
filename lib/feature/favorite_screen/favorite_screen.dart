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
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: GridView.builder(
            itemCount: 3,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 60,
              crossAxisSpacing: 1,
            ),
            itemBuilder: (context, index) {
              return favorite();
            }),
      ),
    );
  }

  Widget favorite() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/123.jpg'),
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5.0,
                          blurRadius: 25,
                          color: grey.withOpacity(0.7),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite),
                      color: Colors.blueAccent,
                      iconSize: 30,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'almaf',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              'almaf',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
