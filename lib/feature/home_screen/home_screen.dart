import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:property_management_system/core/Drawer/bloc/home_drawer_cubit/cubit/home_drawer_cubit.dart';
import 'package:property_management_system/core/Drawer/drawer.dart';
import 'package:property_management_system/core/constant/colors.dart';
import 'package:property_management_system/feature/add_screen/add_screen.dart';
import 'package:property_management_system/feature/home_screen/bloc/cubit/home_cubit.dart';
import 'package:property_management_system/feature/reigster/reigster_screen.dart';
import 'package:property_management_system/injection_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    sl<HomeCubit>().initState();
  }

  @override
  void dispose() {
    sl<HomeCubit>().identity = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener(
          listener: (ctx, state) {
            if (state is HomeDrawerLoading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
              if (state is HomeDrawerLoaded) {
                Navigator.popUntil(context, (route) => false);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReigsterScreen(),
                    ));
              }
            }
          },
          bloc: sl<HomeDrawerCubit>(),
        )
      ],
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddScreen()));
        }),
        appBar: AppBar(
          backgroundColor: teal,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: AppDrawer(),
      ),
    );
  }
}
