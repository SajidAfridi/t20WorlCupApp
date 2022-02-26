import 'package:flutter/material.dart';
class HomePageWidgets extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  const HomePageWidgets.homePage({
    Key? key, required this.title, required this.icon, required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              size: 85,
              color: Colors.white,
            ),
            Text(title,style: const TextStyle(color: Colors.white,fontSize: 25),),
          ],
        ),
      ),
    );
  }
}