import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool status = true;
  late bool status1 = true;
  late bool status2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Settings",
      )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "General",
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Icon(Icons.language),
                ),
                Text(
                  "Language",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacer(),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Icon(Icons.notifications),
                ),
                Text(
                  "Push Notifications",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Spacer(),
                Container(
                  child: FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    activeColor: Colors.teal,
                    valueFontSize: 10.0,
                    toggleSize: 30.0,
                    value: status,
                    borderRadius: 30.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Icon(Icons.dark_mode),
                ),
                Text("Dark Mode"),
                Spacer(),
                Container(
                  child: FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    activeColor: Colors.teal,
                    valueFontSize: 10.0,
                    toggleSize: 30.0,
                    value: status1,
                    borderRadius: 30.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status1 = val;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Scurity",
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Icon(Icons.fingerprint),
                ),
                Text("Use fingerprint"),
                Spacer(),
                Container(
                  child: FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    activeColor: Colors.teal,
                    valueFontSize: 10.0,
                    toggleSize: 30.0,
                    value: status2,
                    borderRadius: 30.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status2 = val;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Others",
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Icon(Icons.help),
                ),
                TextButton(onPressed: () {}, child: Text('help'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
