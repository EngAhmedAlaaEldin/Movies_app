import 'package:flutter/material.dart';
import 'package:movie_application/screens/category_screen/category_screen.dart';
import 'package:movie_application/screens/search_screen/search_screen.dart';
import 'package:movie_application/screens/watchlist_screen/watchlist_screen.dart';
import 'home_movie_screen/home_movie_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [HomeMovieScreen(),CategoryScreen(),WatchlistScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
          if(index == 1){
           showSearch(context: context, delegate: SearchDelegateScreen());}
           else {
            selectedIndex = index;
            setState(() {

            });
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'HOME',backgroundColor: Color(0xFF1A1A1A)),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'SEARCH',backgroundColor: Color(0xFF1A1A1A)),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/browse_icon.png')),label: 'BROWSE',backgroundColor: Color(0xFF1A1A1A)),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/watchlist_icon.png')),label: 'WATCHLIST',backgroundColor: Color(0xFF1A1A1A)),
        ],
      ),
      body: screens[selectedIndex == 0 ||selectedIndex == 1?selectedIndex:--selectedIndex],
    );
  }


}
