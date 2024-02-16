import 'package:decorly/models/featured_item.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_card.dart';
import 'package:decorly/widgets/custom_form.dart';
import 'package:decorly/widgets/custom_rate_star.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _seachTextController;

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

  List tes = ["1", "2", 3, 4, 5, 5, 6, 7, 8, 9, 10];
  List featuredItem = [
    Furniture(
        img: "assets/imgs/chair.png",
        name: "Milliard Cozy Chair",
        rate: "4.9",
        price: "99.99",
        discountPrice: null,
        category: "Interior"),
    Furniture(
        img: "assets/imgs/item2.png",
        name: "Modern Simple Vase",
        rate: "4.4",
        price: "59.99",
        discountPrice: null,
        category: "Interior"),
    Furniture(
        img: "assets/imgs/chair.png",
        name: "Milliard Cozy Chair 2",
        rate: "4.9",
        price: "99.99",
        discountPrice: null,
        category: "Interior")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
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
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "You have an appointment today",
              style: caption_1.copyWith(fontSize: 11, color: secondary_cr),
            ),
            Text(
              "Click here to check!",
              style: caption_1.copyWith(fontSize: 11, color: text_cr),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: CustomForm(
                  logo: const AssetImage("assets/imgs/search.png"),
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
                  AssetImage("assets/imgs/filter.png"),
                  color: white_cr,
                ))
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Row(
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
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: tes.map((e) {
                      print(tes.indexOf(e));
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                            onTap: () {
                              print("tapped");
                            },
                            child: Container(
                              height: 102,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: primary_cr,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(e.toString()),
                            )),
                      );
                    }).toList()),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
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
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 250,
                  width: getWidth(85),
                  child: LayoutBuilder(builder: (BuildContext context,
                      BoxConstraints constraintsFeatured) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 200),
                          bottom: 40,
                          left: constraintsFeatured.maxWidth * 0.12,
                          right: constraintsFeatured.maxWidth * 0.12,
                          child: CustomCard(
                              heightContainer: 200,
                              widthContainer: 200,
                              backgroundColor: accent_cr,
                              widget: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        top: 0,
                                        child: Image(
                                          image: const AssetImage(
                                              "assets/imgs/chair.png"),
                                          height: constraints.maxHeight - 60,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned(
                                          left: 0,
                                          bottom: 0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Milliard Cozy Chair",
                                                style: body_1.copyWith(
                                                    fontSize: 14,
                                                    color: primary_cr),
                                              ),
                                              const CustomRate(
                                                  rateScore: "4.9"),
                                              Text(
                                                "99.99 \$",
                                                style: body_1.copyWith(
                                                    color: primary_cr),
                                              )
                                            ],
                                          )),
                                      Positioned(
                                          right: 0,
                                          top: 0,
                                          child: InkWell(
                                            onTap: () {
                                              print("ss");
                                            },
                                            child: const ImageIcon(
                                              AssetImage(
                                                  "assets/imgs/bookmark.png"),
                                              color: primary_cr,
                                            ),
                                          )),
                                      Positioned(
                                          right: 0,
                                          bottom: 0,
                                          child: InkWell(
                                            onTap: () {
                                              print("ss");
                                            },
                                            child: const ImageIcon(
                                              AssetImage(
                                                  "assets/imgs/cart.png"),
                                              color: primary_cr,
                                            ),
                                          )),
                                    ],
                                  );
                                },
                              )),
                        ),
                        AnimatedPositioned(
                          bottom: 20,
                          left: constraintsFeatured.maxWidth * 0.10,
                          right: constraintsFeatured.maxWidth * 0.10,
                          duration: const Duration(milliseconds: 200),
                          child: CustomCard(
                              heightContainer: 200,
                              widthContainer: 200,
                              backgroundColor: primary_cr,
                              widget: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        top: 0,
                                        child: Image(
                                          image: const AssetImage(
                                              "assets/imgs/chair.png"),
                                          height: constraints.maxHeight - 60,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned(
                                          left: 0,
                                          bottom: 0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Milliard Cozy Chair",
                                                style: body_1.copyWith(
                                                    fontSize: 14,
                                                    color: secondary_cr),
                                              ),
                                              const CustomRate(
                                                  rateScore: "4.9"),
                                              Text(
                                                "99.99 \$",
                                                style: body_1.copyWith(
                                                    color: secondary_cr),
                                              )
                                            ],
                                          )),
                                      Positioned(
                                          right: 0,
                                          top: 0,
                                          child: InkWell(
                                            onTap: () {
                                              print("ss");
                                            },
                                            child: const ImageIcon(
                                              AssetImage(
                                                  "assets/imgs/bookmark.png"),
                                              color: secondary_cr,
                                            ),
                                          )),
                                      Positioned(
                                          right: 0,
                                          bottom: 0,
                                          child: InkWell(
                                            onTap: () {
                                              print("ss");
                                            },
                                            child: const ImageIcon(
                                              AssetImage(
                                                  "assets/imgs/cart.png"),
                                              color: secondary_cr,
                                            ),
                                          )),
                                    ],
                                  );
                                },
                              )),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 200),
                          bottom: 0,
                          left: constraintsFeatured.maxWidth * 0.08,
                          right: constraintsFeatured.maxWidth * 0.08,
                          child: CustomCard(
                              heightContainer: 200,
                              widthContainer: 200,
                              backgroundColor: accent_cr,
                              componentColor: primary_cr,
                              img: const AssetImage("assets/imgs/chair.png"),
                              widget: [
                                Text(
                                  "Milliard Cozy Chair",
                                  style: body_1.copyWith(
                                      fontSize: 14, color: primary_cr),
                                ),
                                const CustomRate(rateScore: "4.9"),
                                Text(
                                  "99.99 \$",
                                  style: body_1.copyWith(color: primary_cr),
                                )
                              ]),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Products",
                      style: body_1.copyWith(color: text_cr),
                    ),
                    Text(
                      "See all",
                      style: body_2.copyWith(color: subtle_text_cr),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: tes
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: 40,
                                  height: 80,
                                  color: primary_cr,
                                ),
                              ))
                          .toList()),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
