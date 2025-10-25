import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),

        
        
             ),
      home:HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            )
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                  alignment: Alignment.center,
                  height: 52.0,
                  width: 52.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2BEA1),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset("assets/icons/menu.svg")
                ),
                ),
                Text(
                  "Good Evening \nDaniela",
                  style: Theme.of(context)
                  .textTheme
                  .headlineMedium?.copyWith(fontWeight: FontWeight.w900,
                  ),
                    
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30.0),
                  padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29.5),
                  ),
                  
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      icon: SvgPicture.asset("assets/icons/search.svg"),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    children: [
                      CategoryCard(
                        title: "Diet Recommendation",
                        svgSrc: "assets/icons/Hamburger.svg",
                        press: () {} ,
                      ),
                      CategoryCard(
                        title: "Kegel Exercises",
                        svgSrc: "assets/icons/Excrecises.svg", 
                        press: () {} ,
                      ),
                      CategoryCard(
                        title: "Meditation",
                        svgSrc: "assets/icons/Meditation.svg",
                        press: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsScreen();
                            },
                          ),
                        );
                        } ,
                      ),
                      CategoryCard(
                        title: "Yoga",
                        svgSrc: "assets/icons/yoga.svg",
                        press: () {} ,
                      ),

                    ],
                  ),
                ),
                ],

                        ),
            ),
        )

        ],
      ),
    );
  }
}

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

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final VoidCallback press;
  const CategoryCard({
    super.key, required this.svgSrc, required this.title, required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13.0),
      child: Container(
        //padding: EdgeInsets.all(  20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0,17),
              blurRadius: 17.0,
              spreadRadius: -23.0,
              color: kShadowColor,
            ),
          ],
        ),
        child:Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Spacer(),
                  SvgPicture.asset(svgSrc),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 15.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
