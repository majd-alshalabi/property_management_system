import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:property_management_system/core/componets/components.dart';
import 'package:property_management_system/feature/comments_screen/comments_screen.dart';

class DtailsScreern extends StatelessWidget {
  List<String> images = [
    "assets/images/123.jpg",
    "assets/images/123.jpg",
    "assets/images/123.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 300.0,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: images.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                ),
                control: const SwiperControl(
                    color: Colors.black87, disableColor: Colors.black),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Spacer(),
                Text("10"),
                SizedBox(
                  width: 5.0,
                ),
                Icon(
                  Icons.remove_red_eye,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text("4.3"),
                SizedBox(
                  width: 5.0,
                ),
                Icon(
                  Icons.star_rate,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Price",
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.00),
            child: Text(
              "1000" "\$",
              style: TextStyle(color: Colors.green),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Descraption",
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "A property description is the written portion of a real estate listing that describes the details of a home for sale or lease.Descriptions account for roughly one-third of a listing and are accompanied by property information (i.e. the number of bedrooms) and photographs. The goal of a creative property description is to attract home buyers. Listing descriptions need colorful words to paint a clear mental picture of a home’s features and benefits, over and above the accompanying",
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
          ),
          newbutton(
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => CommentsScreen())));
              },
              height: 50.0,
              text: "comments",
              width: double.infinity,
              color: Colors.white,
              colortext: Colors.green,
              colorRaduis: Colors.green)
        ],
      ),
    ));
  }
}
