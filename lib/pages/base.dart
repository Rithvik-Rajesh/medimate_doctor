import 'package:doctor_app/pages/doctor_details.dart';
import 'package:doctor_app/widgets/app_title.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  /// Views to display
  List<Widget> views = [
    Center(
      child: Text(
        'Dashboard',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
    Center(
      child: UserInfoPage(),
    ),
    Center(
      child: Text(
        'Account',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
    Center(
      child: Text(
        'Settings',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),

  ];

  /// The currently selected index of the bar
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppTitleBar(),
      body: Row(
        children: [
          SideNavigationBar(
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.home_outlined,
                label: 'Dashboard',
              ),
              SideNavigationBarItem(
                icon: Icons.home_outlined,
                label: 'Doctor Profile',
              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Account',
              ),
              SideNavigationBarItem(
                icon: Icons.settings,
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),

          /// Make it take the rest of the available width
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}
