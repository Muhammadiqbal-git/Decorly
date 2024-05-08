import 'package:decorly/bloc/appointment_cubit.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_card.dart';
import 'package:decorly/widgets/custom_card2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TodayAppointmentPage extends StatelessWidget {
  const TodayAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Today's Appointments",
          style: body_1.copyWith(color: text_cr),
        ),
        centerTitle: true,
        backgroundColor: white_cr,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const ImageIcon(
              AssetImage("assets/imgs/icons/back_arrow.png"),
              color: text_cr,
            )),
      ),
      body: BlocBuilder<AppointmentCubit, AppointmentState>(
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
                    style: body_1.copyWith(fontSize: 20, color: primary_cr),
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
                    style: body_1.copyWith(fontSize: 20, color: primary_cr),
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
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
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
                                  state.appointment!.upcoming[index].time,
                                  style: body_1.copyWith(
                                      fontSize: 13, color: primary_cr),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  Text(
                                    state.appointment!.upcoming[index].name,
                                    style: body_1.copyWith(color: primary_cr),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset("assets/imgs/icons/loc.png"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "location",
                                        style: body_2.copyWith(color: text_cr),
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
                                  Row(
                                    children: [
                                      CustomCard(
                                        heightContainer: 40,
                                        widthContainer: 40,
                                        paddingContainer: EdgeInsets.zero,
                                        backgroundColor: primary_cr,
                                        child: Image.asset(
                                            "assets/imgs/icons/chat.png", color: secondary_cr,),
                                      ),
                                      const SizedBox(width: 10,),
                                      CustomCard(
                                        heightContainer: 40,
                                        widthContainer: 40,
                                        paddingContainer: EdgeInsets.zero,
                                        backgroundColor: primary_cr,
                                        child: Image.asset(
                                            "assets/imgs/icons/video.png", color: secondary_cr,),
                                      ),
                                    ],
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
                          widthCard: 80 + getWidth(8),
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
    );
  }
}
