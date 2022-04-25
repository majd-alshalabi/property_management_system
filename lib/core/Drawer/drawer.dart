import 'package:flutter/material.dart';
import 'package:property_management_system/core/Drawer/drawer_Item.dart';
import 'package:property_management_system/feature/login_screen/login_screen.dart';
import 'package:property_management_system/feature/reigster/reigster_screen.dart';

import '../constant/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 6,
          style: BorderStyle.none,
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 20,
              color: Colors.grey.shade200,
              blurStyle: BlurStyle.solid),
        ],
      ),
      child: Drawer(
        elevation: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(.7), BlendMode.darken),
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/123.jpg'),
                      ),
                      color: Colors.grey.shade900,
                      boxShadow: [BoxShadow(blurRadius: 20)],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(110),
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(right: 40, top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Mohamad Alnashwati",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                          ),
                          Text(
                            'Mohamad@gmail.com',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 80,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/123.jpg'),
                          ),
                          color: grey,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(blurRadius: 9, offset: Offset(0, 5))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 30),
              children: [
                const SizedBox(
                  height: 1,
                ),
                const Divider(
                  thickness: 1,
                  height: 2,
                  color: black,
                ),
                const SizedBox(
                  height: 40,
                ),
                DrawerItem(
                  name: 'Home',
                  icon: Icons.home,
                  onPressed: () => onItemPressed(context, index: 0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DrawerItem(
                  name: 'My Favorite',
                  icon: Icons.favorite,
                  onPressed: () => onItemPressed(context, index: 1),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DrawerItem(
                  name: 'Map',
                  icon: Icons.location_pin,
                  onPressed: () => onItemPressed(context, index: 2),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DrawerItem(
                  name: 'Settings',
                  icon: Icons.settings_outlined,
                  onPressed: () => onItemPressed(context, index: 3),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Divider(
                  thickness: 1,
                  height: 2,
                  color: black,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                DrawerItem(
                  name: 'Sign Out',
                  icon: Icons.logout_outlined,
                  onPressed: () => onItemPressed(context, index: 4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void onItemPressed(BuildContext context, {required int index}) {
  Navigator.pop(context);

  switch (index) {
    case 0:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
      break;
    case 1:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
      break;
    case 2:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
      break;
    case 3:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
      break;
    case 4:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ReigsterScreen()));
      break;
  }
}

// Widget headerWidget() {
//   return Padding(
//     padding: const EdgeInsets.all(15.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const CircleAvatar(
//           backgroundColor: teal2,
//           radius: 45,
//           backgroundImage: AssetImage('assets/images/google.png'),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Text(
//           'Mohamad alnashwati',
//           style: const TextStyle(
//             color: black,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Text(
//           'mohamad@email.com',
//           style: const TextStyle(
//             color: black,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//       ],
//     ),
//   );
// }
