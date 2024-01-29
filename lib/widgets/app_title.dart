import 'package:flutter/material.dart';

class AppTitleBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTitleBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Image.asset(
            "assets/icon.jpg",
            fit: BoxFit.contain,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Row(
        children: [
          //Image.asset("assets/icon.jpg",width: 50,),
          Text(
            'Medi',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade900),
          ),
          Text(
            'Link',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade600),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
