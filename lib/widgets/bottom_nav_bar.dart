import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/constants.dart'; 
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      height: 80.0,
      color: Colors.white, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavItem(
            svgSrc: "assets/icons/calendar.svg",
            title: "Today",
            press: () {},
            isActive: true,
          ),
          BottomNavItem(
            svgSrc: "assets/icons/gym.svg",
            title: "All Exercises",
            press: () {},
            isActive: true,),
          BottomNavItem(
            svgSrc: "assets/icons/Settings.svg", 
            title: "Settings",
            press: () {}, 
            isActive: true,),
    
          
          
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgSrc;
  final String title;
  final VoidCallback press;
  final bool isActive; // Removed initialization here
  const BottomNavItem({
    super.key, required this.svgSrc, required this.title, required this.press, required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(svgSrc,color: isActive ? kActiveIconColor: kTextColor,),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor: kTextColor),),
        ],
      ),
    );
  }
}