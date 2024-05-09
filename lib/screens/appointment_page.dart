import 'package:decorly/bloc/appointment_cubit.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/chooser_widget.dart';
import 'package:decorly/widgets/cube_swipe_widget.dart';
import 'package:decorly/widgets/custom_card.dart';
import 'package:decorly/widgets/custom_card2.dart';
import 'package:decorly/widgets/custom_rate_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});
  AppBar appBar() {
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
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppointmentCubit>(context).setInitial();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 120),
      length: 3,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
            child: Material(
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
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
            child: CubeSwipeWidget(
              width: 150,
              height: 25,
              onPageChanged: (val) {
                BlocProvider.of<AppointmentCubit>(context).setMonth(val + 1);
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
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
            child: BlocBuilder<AppointmentCubit, AppointmentState>(
              builder: (context, state) {
                return ChooserWidget(
                    height: 65,
                    onSelected: (value) {
                      BlocProvider.of<AppointmentCubit>(context)
                          .setDay(value + 1);
                    },
                    children: state.listDays
                        .map((e) => Column(
                              children: [
                                Container(
                                  width: 28,
                                  height: 28,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: primary_cr,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    e.day.toString(),
                                    style: body_1.copyWith(
                                        fontSize: 14, color: white_cr),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  DateFormat("EEE").format(e),
                                  style: body_1.copyWith(
                                      fontSize: 14, color: primary_cr),
                                )
                              ],
                            ))
                        .toList());
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // ChooserWidget(
          //   height: 48,
          //   width: 96,
          //   color: primary_cr,
          //   child: Text(
          //     "09.00 am",
          //     style: body_1.copyWith(fontSize: 14, color: white_cr),
          //   ),
          // ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: TabBarView(
              clipBehavior: Clip.none,
              children: [
                BlocBuilder<AppointmentCubit, AppointmentState>(
                  builder: (context, state) {
                    if (state.appointment == null) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/imgs/empty.svg",
                              width: getWidth(25),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "No Upcoming Appointment",
                              style: body_1.copyWith(
                                  fontSize: 20, color: primary_cr),
                            ),
                          ],
                        ),
                      );
                    } else if (state.appointment!.upcoming.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/imgs/empty.svg",
                              width: getWidth(25),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "No Upcoming Appointment",
                              style: body_1.copyWith(
                                  fontSize: 20, color: primary_cr),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
                        clipBehavior: Clip.none,
                        itemCount: state.appointment!.upcoming.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 190,
                            width: double.maxFinite,
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: CustomCard(
                                    heightContainer: 140,
                                    widthContainer: double.maxFinite,
                                    backgroundColor: accent_cr,
                                    boxShadow: [
                                      BoxShadow(
                                        color: text_cr.withOpacity(0.4),
                                        blurRadius: 8,
                                        spreadRadius: 0,
                                        offset: const Offset(0, 4),
                                      ),
                                      BoxShadow(
                                        color: text_cr.withOpacity(0.1),
                                        blurRadius: 1,
                                        spreadRadius: 0,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 90,
                                          child: Text(
                                            state.appointment!.upcoming[index]
                                                .time,
                                            style: body_1.copyWith(
                                                fontSize: 13,
                                                color: primary_cr),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Spacer(),
                                            Text(
                                              state.appointment!.upcoming[index]
                                                  .name,
                                              style: body_1.copyWith(
                                                  color: primary_cr),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                    "assets/imgs/icons/loc.png"),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  state.appointment!
                                                      .upcoming[index].location,
                                                  style: body_2.copyWith(
                                                      color: text_cr),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "11:30 - 12:00",
                                              style: body_2.copyWith(
                                                  fontSize: 13, color: text_cr),
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          children: [
                                            const Spacer(),
                                            Image.asset(
                                                "assets/imgs/icons/calendar_x.png")
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 90,
                                      ),
                                      Container(
                                        height: 145,
                                        width: 5,
                                        color: white_cr,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 95,
                                  child: CustomCard2(
                                    colorCard: accent_cr,
                                    widthCard: 60 + getWidth(14),
                                    heightCard: 90,
                                    align: Alignment.bottomCenter,
                                    borderColor: white_cr,
                                    borderWidth: 7,
                                    childCard: Image.asset(
                                        state.appointment!.upcoming[index].img),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                BlocBuilder<AppointmentCubit, AppointmentState>(
                  builder: (context, state) {
                    if (state.appointment == null) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/imgs/empty.svg",
                              width: getWidth(25),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "No Completed Appointment",
                              style: body_1.copyWith(
                                  fontSize: 20, color: primary_cr),
                            ),
                          ],
                        ),
                      );
                    } else if (state.appointment!.completed.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/imgs/empty.svg",
                              width: getWidth(25),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "No Completed Appointment",
                              style: body_1.copyWith(
                                  fontSize: 20, color: primary_cr),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
                        clipBehavior: Clip.none,
                        itemCount: state.appointment!.completed.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 190,
                            width: double.maxFinite,
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: CustomCard(
                                    heightContainer: 140,
                                    widthContainer: double.maxFinite,
                                    backgroundColor: accent_cr,
                                    paddingContainer:
                                        EdgeInsets.fromLTRB(6, 16, 16, 10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: text_cr.withOpacity(0.4),
                                        blurRadius: 8,
                                        spreadRadius: 0,
                                        offset: const Offset(0, 4),
                                      ),
                                      BoxShadow(
                                        color: text_cr.withOpacity(0.1),
                                        blurRadius: 1,
                                        spreadRadius: 0,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            "Completed",
                                            style: body_1.copyWith(
                                                fontSize: 13,
                                                color: primary_cr),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Spacer(),
                                            Text(
                                              state.appointment!
                                                  .completed[index].name,
                                              style: body_1.copyWith(
                                                  color: primary_cr),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                    "assets/imgs/icons/loc.png"),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  state.appointment!
                                                      .completed[index].location,
                                                  style: body_2.copyWith(
                                                      color: text_cr),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "11:30 - 12:00",
                                              style: body_2.copyWith(
                                                  fontSize: 13, color: text_cr),
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomRate(
                                              rateScore: "4",
                                              style: body_2.copyWith(
                                                  color: text_cr),
                                            ),
                                            const Spacer(),
                                            Image.asset(
                                                "assets/imgs/icons/re_calendar.png")
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 80,
                                      ),
                                      Container(
                                        height: 145,
                                        width: 5,
                                        color: white_cr,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 95,
                                  child: CustomCard2(
                                    colorCard: accent_cr,
                                    widthCard: 60 + getWidth(14),
                                    heightCard: 90,
                                    align: Alignment.bottomCenter,
                                    borderColor: white_cr,
                                    borderWidth: 7,
                                    childCard: Image.asset(state
                                        .appointment!.completed[index].img),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                BlocBuilder<AppointmentCubit, AppointmentState>(
                  builder: (context, state) {
                    if (state.appointment == null) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/imgs/empty.svg",
                              width: getWidth(25),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "No Canceled Appointment",
                              style: body_1.copyWith(
                                  fontSize: 20, color: primary_cr),
                            ),
                          ],
                        ),
                      );
                    } else if (state.appointment!.canceled.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/imgs/empty.svg",
                              width: getWidth(25),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "No Canceled Appointment",
                              style: body_1.copyWith(
                                  fontSize: 20, color: primary_cr),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
                        clipBehavior: Clip.none,
                        itemCount: state.appointment!.canceled.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 190,
                            width: double.maxFinite,
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: CustomCard(
                                    heightContainer: 140,
                                    widthContainer: double.maxFinite,
                                    backgroundColor: accent_cr,
                                    boxShadow: [
                                      BoxShadow(
                                        color: text_cr.withOpacity(0.4),
                                        blurRadius: 8,
                                        spreadRadius: 0,
                                        offset: const Offset(0, 4),
                                      ),
                                      BoxShadow(
                                        color: text_cr.withOpacity(0.1),
                                        blurRadius: 1,
                                        spreadRadius: 0,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 90,
                                          child: Text(
                                            "Canceled",
                                            style: body_1.copyWith(
                                                fontSize: 13, color: red_cr),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Spacer(),
                                            Text(
                                              state.appointment!.canceled[index]
                                                  .name,
                                              style: body_1.copyWith(
                                                  color: primary_cr),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                    "assets/imgs/icons/loc.png"),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  state.appointment!.canceled[index].location,
                                                  style: body_2.copyWith(
                                                      color: text_cr),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "11:30 - 12:00",
                                              style: body_2.copyWith(
                                                  fontSize: 13, color: text_cr),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 90,
                                      ),
                                      Container(
                                        height: 145,
                                        width: 5,
                                        color: white_cr,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 95,
                                  child: CustomCard2(
                                    colorCard: accent_cr,
                                    widthCard: 60 + getWidth(14),
                                    heightCard: 90,
                                    align: Alignment.bottomCenter,
                                    borderColor: white_cr,
                                    borderWidth: 7,
                                    childCard: Image.asset(
                                        state.appointment!.canceled[index].img),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
