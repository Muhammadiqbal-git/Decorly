import 'package:decorly/bloc/featured_item_cubit.dart';
import 'package:decorly/screens/home_page.dart';
import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: white_cr,
    appBar: AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: white_cr,
      elevation: 0,
      actions: const [
        ImageIcon(
          AssetImage("assets/imgs/notif.png"),
          color: secondary_cr,
        ),
        SizedBox(
          width: 16,
        )
      ],
    ),
    body: Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: HomePage(),
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: white_cr,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: secondary_cr,
        unselectedItemColor: subtle_text_cr,
        onTap: (value) {
          print("tes");
          BlocProvider.of<FeaturedItemCubit>(context).getData(1, 0);
        },
        items: [
          BottomNavigationBarItem(
              label: "", icon: ImageIcon(AssetImage("assets/imgs/home.png"))),
          BottomNavigationBarItem(
              label: "",
              icon: ImageIcon(AssetImage("assets/imgs/bookmark.png"))),
          BottomNavigationBarItem(
              label: "", icon: ImageIcon(AssetImage("assets/imgs/cart.png"))),
        ]),
                );
  }
}
