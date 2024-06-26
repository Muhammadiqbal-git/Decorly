import 'package:decorly/bloc/article_post_cubit.dart';
import 'package:decorly/bloc/design_post_cubit.dart';
import 'package:decorly/bloc/designer_cubit.dart';
import 'package:decorly/bloc/featured_item_cubit.dart';
import 'package:decorly/bloc/saved_list_cubit.dart';
import 'package:decorly/screens/appointment_today_page.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_card.dart';
import 'package:decorly/widgets/custom_form.dart';
import 'package:decorly/widgets/custom_rate_star.dart';
import 'package:decorly/widgets/custom_card2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  AppBar appBar(BuildContext? context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: white_cr,
      elevation: 0,
      actions: const [
        ImageIcon(
          AssetImage("assets/imgs/icons/notif.png"),
          color: secondary_cr,
        ),
        SizedBox(
          width: 16,
        )
      ],
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _seachTextController;

  List tes = ["1", "2", 3, 4, 5, 5, 6, 7, 8, 9, 10];
  List iconFilter = [
    "by_bed.svg",
    "by_liv.svg",
    "by_din.svg",
    "by_bath.svg",
    "by_kit.svg",
    "by_off.svg",
    "by_out.svg",
    "by_ind.svg",
    "by_kid.svg"
  ];
  List nameFilter = [
    "Bed Room",
    "Living Room",
    "Dining Room",
    "Bath Room",
    "Kitchen",
    "Office",
    "Outdoor",
    "Indoor",
    "Kids"
  ];

  @override
  void initState() {
    _seachTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _seachTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: RichText(
              text: TextSpan(
                  text: "Hello ",
                  style: body_1.copyWith(
                    color: text_cr,
                  ),
                  children: [
                TextSpan(
                  text: "Iqbal",
                  style: body_1.copyWith(color: secondary_cr),
                ),
                TextSpan(
                  text: ",\n",
                  style: body_1.copyWith(color: text_cr),
                ),
                TextSpan(
                  text: "Let's make your house speaks!",
                  style: body_1.copyWith(color: text_cr),
                )
              ])),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "You have an appointment today",
                style: caption_1.copyWith(fontSize: 11, color: secondary_cr),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TodayAppointmentPage(),
                    ),
                  );
                },
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                child: Text(
                  "Click here to check!",
                  style: caption_1.copyWith(fontSize: 11, color: text_cr),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            children: [
              Expanded(
                child: CustomForm(
                    logo: const AssetImage("assets/imgs/icons/search.png"),
                    textEditingController: _seachTextController,
                    textInputAction: TextInputAction.done),
              ),
              const SizedBox(
                width: 20,
              ),
              CustomButton(
                  function: () {},
                  colorButton: primary_cr,
                  heightButton: 48,
                  widthButton: 48,
                  childButton: const ImageIcon(
                    AssetImage("assets/imgs/icons/filter.png"),
                    color: accent_cr,
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: SingleChildScrollView(
            restorationId: "12",
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shop by",
                        style: body_1.copyWith(color: text_cr),
                      ),
                      Text(
                        "See all",
                        style: body_2.copyWith(color: subtle_text_cr),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: iconFilter
                            .asMap()
                            .map((i, e) {
                              return MapEntry(
                                  i,
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: InkWell(
                                        onTap: () {
                                        },
                                        child: Container(
                                          height: 102,
                                          width: 64,
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 10, 5, 10),
                                          decoration: BoxDecoration(
                                              color: primary_cr,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset("assets/imgs/$e"),
                                              const Spacer(),
                                              Text(
                                                nameFilter[i],
                                                style: body_1.copyWith(
                                                    fontSize: 12,
                                                    color: white_cr),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        )),
                                  ));
                            })
                            .values
                            .toList()),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Featured Products",
                          style: body_1.copyWith(color: text_cr)),
                      Text(
                        "See all",
                        style: body_2.copyWith(color: subtle_text_cr),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 250,
                  width: getWidth(100),
                  child: LayoutBuilder(builder: (context, constraintsFeatured) {
                    return BlocBuilder<FeaturedItemCubit, FeaturedItemState>(
                        builder: (context, state) {
                      if (state is FeaturedItemLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: primary_cr,
                          ),
                        );
                      } else if (state is FeaturedItemEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/imgs/empty.svg",
                                  height: 84),
                              const SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                overlayColor: const MaterialStatePropertyAll(
                                    Colors.transparent),
                                splashFactory: NoSplash.splashFactory,
                                onTap: () {
                                  BlocProvider.of<FeaturedItemCubit>(context)
                                      .getData(2, 0);
                                },
                                child: Text(
                                  "More..?",
                                  style: body_1.copyWith(color: secondary_cr),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (state is FeaturedItemFetched) {
                        return Stack(
                            alignment: Alignment.center,
                            children: List.generate(
                                state.dataFurniture.data.length, (index) {
                              return AnimatedPositioned(
                                duration: const Duration(milliseconds: 200),
                                bottom: state.bottomPosition[index],
                                left: constraintsFeatured.maxWidth *
                                    state.paddingCard[index][0],
                                right: constraintsFeatured.maxWidth *
                                    state.paddingCard[index][1],
                                child: GestureDetector(
                                  onHorizontalDragEnd: (details) {
                                    int sensPositive = 200;
                                    int sensNegative = -200;
                                    if (index == state.bottomIndex) {
                                      if (details.primaryVelocity! >
                                          sensPositive) {
                                        BlocProvider.of<FeaturedItemCubit>(
                                                context)
                                            .swipeData(index, true);
                                      } else if (details.primaryVelocity! <
                                          sensNegative) {
                                        BlocProvider.of<FeaturedItemCubit>(
                                                context)
                                            .swipeData(index, false);
                                      }
                                    }
                                  },
                                  child: CustomCard(
                                      heightContainer: 200,
                                      widthContainer: 200,
                                      backgroundColor: index % 2 == 0
                                          ? state.colorCard[0]
                                          : state.colorCard[1],
                                      child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          return Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 0,
                                                child: Image(
                                                  image: AssetImage(state
                                                      .dataFurniture
                                                      .data[index]
                                                      .img),
                                                  // image: const AssetImage(
                                                  //     "assets/imgs/chair.png"),
                                                  height:
                                                      constraints.maxHeight -
                                                          60,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  left: 0,
                                                  bottom: 0,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        state.dataFurniture
                                                            .data[index].name,
                                                        style: body_1.copyWith(
                                                            letterSpacing: 0.4,
                                                            fontSize: 14,
                                                            color: index % 2 ==
                                                                    0
                                                                ? state.colorText[
                                                                    0]
                                                                : state.colorText[
                                                                    1]),
                                                      ),
                                                      CustomRate(
                                                          rateScore: state
                                                              .dataFurniture
                                                              .data[index]
                                                              .rate),
                                                      Text(
                                                        "\$ ${state.dataFurniture.data[index].price} ",
                                                        style: body_1.copyWith(
                                                            color: index % 2 ==
                                                                    0
                                                                ? state.colorText[
                                                                    0]
                                                                : state.colorText[
                                                                    1]),
                                                      )
                                                    ],
                                                  )),
                                              Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: InkWell(
                                                    onTap: () {
                                                      BlocProvider.of<
                                                                  FeaturedItemCubit>(
                                                              context)
                                                          .updateData(
                                                              !state
                                                                  .dataFurniture
                                                                  .data[index]
                                                                  .bookmark,
                                                              state
                                                                  .dataFurniture
                                                                  .data[index]
                                                                  .id);
                                                      BlocProvider.of<
                                                                  SavedListCubit>(
                                                              context)
                                                          .updateSavedFurniture(
                                                              furniture: state
                                                                  .dataFurniture
                                                                  .data[index]);
                                                    },
                                                    child: ImageIcon(
                                                      AssetImage(index % 2 == 0
                                                          ? "assets/imgs/icons/bookmark.png"
                                                          : "assets/imgs/icons/bookmark_light.png"),
                                                      color: !state
                                                              .dataFurniture
                                                              .data[index]
                                                              .bookmark
                                                          ? subtle_text_cr
                                                          : index % 2 == 0
                                                              ? state
                                                                  .colorText[0]
                                                              : state
                                                                  .colorText[1],
                                                    ),
                                                  )),
                                              Positioned(
                                                  right: 0,
                                                  bottom: 0,
                                                  child: InkWell(
                                                    onTap: () {
                                                    },
                                                    child: ImageIcon(
                                                      const AssetImage(
                                                          "assets/imgs/icons/cart.png"),
                                                      color: index % 2 == 0
                                                          ? state.colorText[0]
                                                          : state.colorText[1],
                                                    ),
                                                  )),
                                            ],
                                          );
                                        },
                                      )),
                                ),
                              );
                            }).reversed.toList());
                      } else {
                        return const Center(
                          child: Text("Empty"),
                        );
                      }
                    });
                  }),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Offers",
                        style: body_1.copyWith(color: text_cr),
                      ),
                      Text(
                        "See all",
                        style: body_2.copyWith(color: subtle_text_cr),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: tes
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: SizedBox(
                                    height: 280,
                                    width: 200,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 0,
                                          left: 22,
                                          child: CustomCard(
                                            backgroundColor: accent_cr,
                                            heightContainer: 280,
                                            widthContainer: 177,
                                            // marginContainer:
                                            //     EdgeInsets.only(left: 22),
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              alignment: Alignment.center,
                                              children: [
                                                const Positioned(
                                                    top: 0,
                                                    child: Image(
                                                      image: AssetImage(
                                                          "assets/imgs/hanging_chair.png"),
                                                      height: 110,
                                                      fit: BoxFit.fill,
                                                    )),
                                                Positioned(
                                                    left: 0,
                                                    right: 0,
                                                    bottom: 0,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Top offer",
                                                          style:
                                                              body_1.copyWith(
                                                                  fontSize: 13,
                                                                  color:
                                                                      red_cr),
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        Text(
                                                          "Outdoor",
                                                          style: body_2.copyWith(
                                                              fontSize: 11,
                                                              color:
                                                                  subtle_text_cr),
                                                        ),
                                                        Text(
                                                          "Outdoor White & Beige Hanging Chair",
                                                          style:
                                                              body_1.copyWith(
                                                                  fontSize: 14),
                                                        ),
                                                        const CustomRate(
                                                            rateScore: "4.9"),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "\$1.190",
                                                              style: body_1
                                                                  .copyWith(
                                                                      color:
                                                                          red_cr),
                                                            ),
                                                            const SizedBox(
                                                              width: 6,
                                                            ),
                                                            Text(
                                                              "\$1.810 ",
                                                              style: body_2.copyWith(
                                                                  fontSize: 14,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                                Positioned(
                                                    right: 0,
                                                    top: 0,
                                                    child: InkWell(
                                                      onTap: () {
                                                      },
                                                      child: const ImageIcon(
                                                          AssetImage(
                                                              "assets/imgs/icons/bookmark.png"),
                                                          color:
                                                              subtle_text_cr),
                                                    )),
                                                Positioned(
                                                    right: 0,
                                                    bottom: 0,
                                                    child: InkWell(
                                                      onTap: () {
                                                      },
                                                      child: const ImageIcon(
                                                          AssetImage(
                                                              "assets/imgs/icons/cart.png"),
                                                          color: primary_cr),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Image.asset(
                                                "assets/imgs/icons/discount.png")),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList()),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Decor Styles",
                        style: body_1.copyWith(color: text_cr),
                      ),
                      Text(
                        "See all",
                        style: body_2.copyWith(color: subtle_text_cr),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Design Style
                SizedBox(
                  height: 185,
                  child: BlocBuilder<DesignCubit, DesignState>(
                    builder: (context, state) {
                      if (state is DesignLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: primary_cr,
                          ),
                        );
                      } else if (state is DesignFetched) {
                        return PageView.builder(
                            clipBehavior: Clip.none,
                            controller: PageController(
                                initialPage: 0, viewportFraction: 0.85),
                            itemCount: state.dataArticle.data.length,
                            onPageChanged: (value) {
                              BlocProvider.of<DesignCubit>(context)
                                  .updateIndexData(value);
                            },
                            itemBuilder: (context, index) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: EdgeInsets.only(
                                    left: 2,
                                    right: 10,
                                    bottom:
                                        state.currentIndex == index ? 0 : 20),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          state.dataArticle.data[index].img),
                                      alignment: Alignment.bottomCenter,
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        color: state.currentIndex == index
                                            ? text_cr.withOpacity(0.6)
                                            : Colors.transparent,
                                        spreadRadius: 0,
                                        blurRadius: 6,
                                        offset: const Offset(0, 3))
                                  ],
                                ),
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        height: 44,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(12)),
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                text_cr.withOpacity(0.6),
                                                text_cr.withOpacity(0.4),
                                                Colors.transparent,
                                              ]),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  state.dataArticle.data[index]
                                                      .title,
                                                  style: body_1.copyWith(
                                                      fontSize: 14,
                                                      color: white_cr),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                )
                                              ],
                                            ),
                                            InkWell(
                                                overlayColor:
                                                    const MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                onTap: () {
                                                  BlocProvider.of<DesignCubit>(
                                                          context)
                                                      .updateData(state
                                                          .dataArticle
                                                          .data[index]
                                                          .id);
                                                  BlocProvider.of<
                                                              SavedListCubit>(
                                                          context)
                                                      .updateSavedDesign(
                                                          design: state
                                                              .dataArticle
                                                              .data[index]);
                                                },
                                                child: ImageIcon(
                                                  const AssetImage(
                                                      "assets/imgs/icons/bookmark.png"),
                                                  color: state.dataArticle
                                                          .data[index].bookmark
                                                      ? primary_cr
                                                      : white_cr,
                                                ))
                                          ],
                                        ))),
                              );
                            });
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Interior Designers",
                        style: body_1.copyWith(color: text_cr),
                      ),
                      Text(
                        "See all",
                        style: body_2.copyWith(color: subtle_text_cr),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 270,
                    child: BlocBuilder<DesignerCubit, DesignerState>(
                      builder: (context, state) {
                        if (state is DesignerLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: primary_cr,
                            ),
                          );
                        } else if (state is DesignerFetched) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: state.data.data
                                    .map(
                                      (e) => CustomCard(
                                        backgroundColor: accent_cr,
                                        widthContainer: 160,
                                        heightContainer: 270,
                                        marginContainer: EdgeInsets.only(right: 12),
                                        child: Column(
                                          children: [
                                            CustomCard2(
                                                colorCard: accent_cr,
                                                widthCard: 95,
                                                heightCard: 95,
                                                borderColor: white_cr,
                                                borderWidth: 10.0,
                                                align: Alignment.bottomCenter,
                                                childCard: Image.asset(
                                                  e.img,
                                                  fit: BoxFit.cover,
                                                  height: 75,
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              e.name,
                                              style: body_1.copyWith(
                                                  color: primary_cr),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            CustomRate(
                                                rateScore:
                                                    "${e.rate} (75 reviews)"),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              e.biography,
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style: body_1.copyWith(
                                                  fontSize: 13, color: text_cr),
                                            ),
                                            const Spacer(),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: InkWell(
                                                onTap: () {
                                                },
                                                child: const ImageIcon(
                                                  AssetImage(
                                                      "assets/imgs/icons/calendar.png"),
                                                  color: secondary_cr,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList()),
                          );
                        } else {
                          return const Text("ss");
                        }
                      },
                    ),
                  ),
                ),
                // CustomSlido(cubit: DesignCubit(), state: DesignState,)
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Articles", style: body_1.copyWith(color: text_cr)),
                      Text(
                        "See All",
                        style: body_2.copyWith(color: subtle_text_cr),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  height: 185,
                  child: BlocBuilder<ArticleCubit, ArticleState>(
                    builder: (context, state) {
                      if (state is ArticleLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: primary_cr,
                          ),
                        );
                      } else if (state is ArticleFetched) {
                        return PageView.builder(
                            clipBehavior: Clip.none,
                            controller: PageController(
                                initialPage: 0, viewportFraction: 0.85),
                            itemCount: state.dataArticle.data.length,
                            onPageChanged: (value) {
                              BlocProvider.of<ArticleCubit>(context)
                                  .updateIndexData(value);
                            },
                            itemBuilder: (context, index) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: EdgeInsets.only(
                                    left: 2,
                                    right: 10,
                                    bottom:
                                        state.currentIndex == index ? 0 : 20),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          state.dataArticle.data[index].img),
                                      alignment: Alignment.bottomCenter,
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        color: state.currentIndex == index
                                            ? text_cr.withOpacity(0.5)
                                            : Colors.transparent,
                                        spreadRadius: 0,
                                        blurRadius: 6,
                                        offset: const Offset(0, 3))
                                  ],
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      height: 44,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12)),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              text_cr.withOpacity(0.6),
                                              text_cr.withOpacity(0.4),
                                              Colors.transparent,
                                            ]),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.dataArticle.data[index]
                                                    .title,
                                                style: body_1.copyWith(
                                                    fontSize: 14,
                                                    color: white_cr),
                                              ),
                                              Text(
                                                "By ${state.dataArticle.data[index].author}",
                                                style: body_1.copyWith(
                                                    fontSize: 10,
                                                    color: white_cr),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            overlayColor:
                                                const MaterialStatePropertyAll(
                                                    Colors.transparent),
                                            onTap: () {
                                              BlocProvider.of<ArticleCubit>(
                                                      context)
                                                  .updateData(state.dataArticle
                                                      .data[index].id);
                                              BlocProvider.of<SavedListCubit>(
                                                      context)
                                                  .updateSavedArticle(
                                                      article: state.dataArticle
                                                          .data[index]);
                                            },
                                            child: ImageIcon(
                                              const AssetImage(
                                                  "assets/imgs/icons/bookmark.png"),
                                              color: state.dataArticle
                                                      .data[index].bookmark
                                                  ? primary_cr
                                                  : white_cr,
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              );
                            });
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
