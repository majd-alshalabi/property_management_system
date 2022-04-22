

import 'package:flutter/material.dart';
import 'package:property_management_system/core/Drawer/drawer_Item.dart';
import 'package:property_management_system/feature/login_screen/login_screen.dart';
import 'package:property_management_system/feature/reigster/reigster_screen.dart';

import '../constant/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: teal2,
      child: ListView(
        children: [
          headerWidget(),
          const SizedBox(
            height: 30,
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
          )
        ],
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

Widget headerWidget() {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundColor: teal2,
          radius: 45,
          backgroundImage: AssetImage('assets/images/google.png'),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Mohamad alnashwati',
          style: const TextStyle(
            color: black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'mohamad@email.com',
          style: const TextStyle(
            color: black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
