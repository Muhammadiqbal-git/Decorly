import 'package:decorly/bloc/featured_item_cubit.dart';
import 'package:decorly/bloc/saved_list_cubit.dart';
import 'package:decorly/screens/cart_page.dart';
import 'package:decorly/screens/home_page.dart';
import 'package:decorly/screens/saved_page.dart';
import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> blocFunction(int index) async {
    if (index == 0) {
      return BlocProvider.of<FeaturedItemCubit>(context).getData(0, 0);
    } else if (index == 1) {
      // return BlocProvider.of<SavedListCubit>(context).getData();
    } else {
      // return BlocProvider.of<
    }
  }

  bool load = false;

  final List<Widget> listWidget = [
    const HomePage(),
    const SavedPage(),
    const CartPage()
  ];
  final List<AppBar> listAppbar = [
    const HomePage().appBar(null),
    const SavedPage().appBar(null),
    const CartPage().appBar()
  ];
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
          onTap: (value) async {
            setState(() {
              currentIndex = value;
              FocusScope.of(context).unfocus();
            });
            if (!load) {
              load = true;
              await blocFunction(value).then((value) => load = false);
            }
          },
          items: const [
            BottomNavigationBarItem(
                label: "",
                icon: ImageIcon(AssetImage("assets/imgs/icons/home.png"))),
            BottomNavigationBarItem(
                label: "",
                icon: ImageIcon(AssetImage("assets/imgs/icons/bookmark.png"))),
            BottomNavigationBarItem(
                label: "",
                icon: ImageIcon(AssetImage("assets/imgs/icons/cart.png"))),
          ]),
    );
  }
}
