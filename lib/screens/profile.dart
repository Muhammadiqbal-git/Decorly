import 'package:decorly/screens/my_order_page.dart';
import 'package:decorly/screens/my_track_order.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_card.dart';
import 'package:decorly/widgets/custom_card2.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  AppBar appBar() {
    return AppBar(
      backgroundColor: white_cr,
      title: Text(
        "My Profile",
        style: body_1.copyWith(color: text_cr),
      ),
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 170,
            width: 178,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  child: CustomCard(
                    heightContainer: 130,
                    widthContainer: 178,
                    backgroundColor: accent_cr,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "nama",
                          style: body_1.copyWith(color: primary_cr),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/imgs/icons/loc.png"),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "lokasi",
                              style: body_2.copyWith(color: text_cr),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: CustomCard2(
                      heightCard: 100,
                      widthCard: 100,
                      colorCard: accent_cr,
                      borderColor: white_cr,
                      borderWidth: 15,
                      align: Alignment.bottomCenter,
                      childCard: Image.asset(
                        "assets/imgs/person4.png",
                        fit: BoxFit.cover,
                        height: 80,
                        alignment: Alignment.bottomCenter,
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomCard(
            heightContainer: null,
            widthContainer: 300,
            backgroundColor: accent_cr,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Edit Profile",
                  style: body_1.copyWith(color: text_cr),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyOrderPage(),
                      ),
                    );
                  },
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  child: Text(
                    "My Orders",
                    style: body_1.copyWith(color: text_cr),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Refund",
                  style: body_1.copyWith(color: text_cr),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "My Accounts",
                  style: body_1.copyWith(color: text_cr),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Conversations",
                  style: body_1.copyWith(color: text_cr),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Settings",
                  style: body_1.copyWith(color: text_cr),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Log Out",
                  style: body_1.copyWith(color: red_cr),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
