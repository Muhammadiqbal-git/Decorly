import 'package:decorly/theme.dart';
import 'package:decorly/widgets/chooser_widget.dart';
import 'package:decorly/widgets/cube_swipe_widget.dart';
import 'package:flutter/material.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  AppBar appBar() {
    print("saved appbar built");
    return AppBar(
      backgroundColor: white_cr,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(
        "Appointments",
        style: body_1.copyWith(color: text_cr),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("built");
    return DefaultTabController(
      animationDuration: Duration(milliseconds: 120),
      length: 3,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(12),
              color: accent_cr,
              child: TabBar(
                  indicatorColor: Colors.transparent,
                  labelPadding: EdgeInsets.zero,
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  indicator: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: text_cr.withOpacity(0.6),
                          blurRadius: 3,
                          spreadRadius: 0,
                          offset: const Offset(0, 3),
                        )
                      ],
                      color: primary_cr,
                      borderRadius: BorderRadius.circular(12)),
                  labelStyle: body_1.copyWith(fontSize: 13),
                  labelColor: white_cr,
                  unselectedLabelStyle: body_2.copyWith(fontSize: 12),
                  unselectedLabelColor: subtle_text_cr,
                  tabs: const [
                    Tab(
                      text: "Upcoming",
                    ),
                    Tab(
                      text: "Completed",
                    ),
                    Tab(
                      text: "Canceled",
                    ),
                  ]),
            ),
            const SizedBox(
              height: 25,
            ),
            CubeSwipeWidget(
              width: 150,
              height: 25,
              onPageChanged: (val) {
                print(val);
              },
              children: [
                Text(
                  "January",
                  style: body_2.copyWith(color: secondary_cr),
                ),
                Text(
                  "February",
                  style: body_2.copyWith(color: secondary_cr),
                ),
                Text(
                  "March",
                  style: body_2.copyWith(color: secondary_cr),
                ),
                Text(
                  "April",
                  style: body_2.copyWith(color: secondary_cr),
                ),
                Text(
                  "May",
                  style: body_2.copyWith(color: secondary_cr),
                ),
                Text(
                  "June",
                  style: body_2.copyWith(color: secondary_cr),
                ),
                Text(
                  "July",
                  style: body_2.copyWith(color: secondary_cr),
                ),
                Text(
                  "August",
                  style: body_2.copyWith(color: secondary_cr),
                ),
                Text(
                  "September",
                  style: body_2.copyWith(color: secondary_cr),
                ),
                Text(
                  "October",
                  style: body_2.copyWith(color: secondary_cr),
                ),
                Text(
                  "November",
                  style: body_2.copyWith(color: secondary_cr),
                ),
                Text(
                  "December",
                  style: body_2.copyWith(color: secondary_cr),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            ChooserWidget(
                child: Column(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                  color: primary_cr,
                  borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "1",
                    style: body_1.copyWith(fontSize: 14, color: white_cr),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Sun",
                  style: body_1.copyWith(fontSize: 14, color: primary_cr),
                )
              ],
            )),
            const SizedBox(
              height: 25,
            ),
            ChooserWidget(
              height: 48,
              width: 96,
              color: primary_cr,
              child: Text(
                "09.00 am",
                style: body_1.copyWith(fontSize: 14, color: white_cr),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: TabBarView(children: [
                Container(
                  height: 200,
                  width: 200,
                  color: primary_cr,
                ),
                Container(
                  height: 200,
                  width: 200,
                  color: accent_cr,
                ),
                Container(
                  height: 200,
                  width: 200,
                  color: primary_cr,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
