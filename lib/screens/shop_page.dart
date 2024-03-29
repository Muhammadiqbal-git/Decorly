import 'dart:async';

import 'package:decorly/bloc/shop_cubit.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_card2.dart';
import 'package:decorly/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late TextEditingController _searchTextController;
  late TextEditingController _filterTextController;

  List<String> filterItem = ["Modern", "Indoor", "Outdoor", "Wood"];
  Timer? _delayTimer;
  final int _delayTime = 600;
  FocusNode tes = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    _searchTextController = TextEditingController();
    _filterTextController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchTextController.dispose();
    _filterTextController.dispose();

    super.dispose();
  }

  delayFilter() {
    print(_filterTextController.runtimeType);
    if (_delayTimer?.isActive ?? false) {
      _delayTimer!.cancel();
    }
    _delayTimer = Timer(Duration(milliseconds: _delayTime), () {
      BlocProvider.of<FilterCubit>(context)
          .searchFilter(_filterTextController.text);
    });
  }

  filterDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search Tags",
              style: body_1.copyWith(color: primary_cr),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 9, 0, 14),
              child: CustomForm(
                  focusNode: tes,
                  onChanged: (p0) {
                    print("asdd");
                    delayFilter();
                  },
                  onEdittingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                  logo: const AssetImage("assets/imgs/icons/search.png"),
                  textEditingController: _filterTextController,
                  textInputAction: TextInputAction.done),
            ),
            BlocBuilder<FilterCubit, FilterState>(
              builder: (context, state) {
                print(state);
                if (state is FilterLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: primary_cr,
                    ),
                  );
                } else if (state is FilterEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Top tags",
                        style: body_1.copyWith(fontSize: 14, color: text_cr),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Wrap(
                        runSpacing: 10,
                        children: filterItem
                            .map(
                              (e) => Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: accent_cr,
                                        boxShadow: [
                                          BoxShadow(
                                              color: text_cr.withOpacity(0.4),
                                              spreadRadius: -2,
                                              blurRadius: 4,
                                              offset: const Offset(0, 2))
                                        ]),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    child: Text(
                                      e,
                                      style: body_2.copyWith(
                                          fontSize: 16, color: secondary_cr),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  )
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Recent tags",
                        style: body_1.copyWith(fontSize: 14, color: text_cr),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      state.recentFilters.isEmpty
                          ? Text(
                              "-",
                              style: body_2.copyWith(color: text_cr),
                            )
                          : Wrap(
                              runSpacing: 10,
                              children: state.recentFilters
                                  .map(
                                    (e) => Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: accent_cr,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: text_cr
                                                        .withOpacity(0.4),
                                                    spreadRadius: -2,
                                                    blurRadius: 4,
                                                    offset: const Offset(0, 2))
                                              ]),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          child: Text(
                                            e,
                                            style: body_2.copyWith(
                                                fontSize: 16,
                                                color: secondary_cr),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        )
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                    ],
                  );
                } else {
                  print(state.filters);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Result tags",
                        style: body_1.copyWith(fontSize: 14, color: text_cr),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Wrap(
                        runSpacing: 10,
                        children: state.filters
                            .map(
                              (e) => Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    onTap: () {
                                      BlocProvider.of<FilterCubit>(context)
                                          .updateFilter(e);
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: accent_cr,
                                          boxShadow: [
                                            BoxShadow(
                                                color: text_cr.withOpacity(0.4),
                                                spreadRadius: -2,
                                                blurRadius: 4,
                                                offset: const Offset(0, 2))
                                          ]),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 4),
                                      child: Text(
                                        e,
                                        style: body_2.copyWith(
                                            fontSize: 16, color: secondary_cr),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  )
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    ).then((value) {
      _filterTextController.clear();
      print("closed");
      BlocProvider.of<FilterCubit>(context).searchFilter("");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          "Shop",
          style: body_1.copyWith(color: text_cr),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 16, 22, 0),
            child: CustomForm(
                logo: const AssetImage("assets/imgs/icons/search.png"),
                textEditingController: _searchTextController,
                textInputAction: TextInputAction.done),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomButton(
                    function: () {
                      print("s");

                      return filterDialog(context);
                    },
                    colorButton: primary_cr,
                    heightButton: 48,
                    widthButton: 48,
                    childButton: const ImageIcon(
                      AssetImage("assets/imgs/icons/filter.png"),
                      color: white_cr,
                    )),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: BlocBuilder<FilterCubit, FilterState>(
                    builder: (context, state) {
                      print(state.activeFilter);
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: state.activeFilter
                              .map(
                                (e) => Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: accent_cr,
                                          boxShadow: [
                                            BoxShadow(
                                                color: text_cr.withOpacity(0.4),
                                                spreadRadius: -2,
                                                blurRadius: 4,
                                                offset: const Offset(0, 2))
                                          ]),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 4),
                                      child: Text(
                                        e,
                                        style: body_2.copyWith(
                                            fontSize: 16, color: secondary_cr),
                                      ),
                                    ),
                                    IconButton(
                                        padding: EdgeInsets.zero,
                                        visualDensity:
                                            const VisualDensity(horizontal: -4),
                                        splashColor: Colors.transparent,
                                        onPressed: () {
                                          BlocProvider.of<FilterCubit>(context)
                                              .removeFilter(e);
                                        },
                                        icon: const ImageIcon(
                                          AssetImage(
                                              "assets/imgs/icons/x_mark.png"),
                                          color: secondary_cr,
                                          size: 54,
                                        )),
                                    const SizedBox(
                                      width: 8,
                                    )
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      );
                    },
                  ),
                ))
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: BlocBuilder<ShopCubit, ShopState>(
              builder: (context, state) {
                print("shop built");
                if (state is ShopLoading) {
                  return Container();
                } else if (state is ShopFetched) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(22, 4, 22, 22),
                    child: Column(
                        children: state.data
                            .map(
                              (e) => Container(
                                  height: 144,
                                  width: double.maxFinite,
                                  padding: EdgeInsets.zero,
                                  margin: const EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                      color: accent_cr,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                            color: text_cr.withOpacity(0.4),
                                            spreadRadius: -3.5,
                                            blurRadius: 6,
                                            offset: const Offset(0, 5))
                                      ]),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomCard2(
                                              colorCard: accent_cr,
                                              widthCard: 90,
                                              heightCard: 90,
                                              padding: const EdgeInsets.all(5),
                                              borderColor: white_cr,
                                              borderWidth: 9,
                                              childCard: Image.asset(e.img)),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, bottom: 15),
                                            child: Text(
                                              "\$${e.price}",
                                              style: body_1.copyWith(
                                                  fontSize: 19, color: text_cr),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 24,
                                            ),
                                            Text(
                                              e.name,
                                              style: body_1.copyWith(
                                                  color: text_cr,
                                                  letterSpacing: 0.4),
                                            ),
                                            Text(
                                              e.desc,
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                              style: body_2.copyWith(
                                                  color: text_cr),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(14, 15, 15, 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                  "assets/imgs/icons/bookmark.png"),
                                              color: e.bookmark
                                                  ? secondary_cr
                                                  : subtle_text_cr,
                                            ),
                                            ImageIcon(
                                              AssetImage(
                                                  "assets/imgs/icons/cart.png"),
                                              color: secondary_cr,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            )
                            .toList()),
                  );
                } else {
                  return Center(
                    child: Text(
                      "Error terjadi",
                      style: body_1.copyWith(color: primary_cr),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
