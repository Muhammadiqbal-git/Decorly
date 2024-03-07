import 'package:decorly/screens/home_page.dart';
import 'package:decorly/screens/saved_page.dart';
import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  changePage(int index) {
    if (index == 0) {
      return const HomePage();
    }
  }

  final List<Widget> listWidget = [const HomePage(), const SavedPage()];
  final List<AppBar> listAppbar = [const HomePage().appBar(null), const SavedPage().appBar(null)];
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    print("main built");
        return Scaffold(
          backgroundColor: white_cr,
          appBar: listAppbar.elementAt(currentIndex),
          body: LazyLoadIndexedStack(
            index: currentIndex,
            children: listWidget,
          ),
          bottomNavigationBar: BottomNavigationBar(
              elevation: 8,
              currentIndex: currentIndex,
              backgroundColor: white_cr,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: secondary_cr,
              unselectedItemColor: subtle_text_cr,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
                FocusScope.of(context).unfocus();
                print("tes");
              },
              items: const [
                 BottomNavigationBarItem(
                    label: "",
                    icon: ImageIcon(AssetImage("assets/imgs/icons/home.png"))),
                 BottomNavigationBarItem(
                    label: "",
                    icon: ImageIcon(
                        AssetImage("assets/imgs/icons/bookmark.png"))),
                 BottomNavigationBarItem(
                    label: "",
                    icon: ImageIcon(AssetImage("assets/imgs/icons/cart.png"))),
              ]),
        );
      }
}
