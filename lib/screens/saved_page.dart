import 'package:decorly/bloc/main_page_cubit.dart';
import 'package:decorly/bloc/saved_list_cubit.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_card.dart';
import 'package:decorly/widgets/custom_card2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  AppBar appBar(BuildContext? context) {
    print("saved appbar built");
    return AppBar(
      backgroundColor: white_cr,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(
        "My Saved List",
        style: body_1.copyWith(color: text_cr),
      ),
    );
  }
  // Widget empty(){
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    print("saved built");
    return BlocBuilder<SavedListCubit, SavedListState>(
      builder: (context, state) {
        if (state is SavedListEmpty) {
          return Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/imgs/empty.svg",
                  width: getWidth(40),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Your Saved List is Empty!",
                  style: body_1.copyWith(fontSize: 20, color: primary_cr),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Explor Products, Interior Designers, Decor Stylesand Articles , save them to show them heres.",
                  style: body_2.copyWith(color: text_cr),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    function: () {
                      BlocProvider.of<MainPageCubit>(context).updateIndex(0);
                    },
                    colorButton: primary_cr,
                    widthButton: getWidth(70),
                    heightButton: 48,
                    childButton: Text(
                      "Discover Now & Save",
                      style: body_1.copyWith(color: white_cr),
                    ))
              ],
            ),
          );
        } else if (state is SavedListFetched) {
          return DefaultTabController(
            animationDuration: const Duration(milliseconds: 120),
            length: 4,
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
                            text: "Products",
                          ),
                          Tab(
                            text: "Designers",
                          ),
                          Tab(
                            text: "Decor Styles",
                          ),
                          Tab(
                            text: "Articles",
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TabBarView(children: [
                    SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(22, 0, 22, 22),
                      child: Column(
                          children: state.data.furniture.isNotEmpty
                              ? state.data.furniture.entries
                                  .map(
                                    (e) => Container(
                                        height: 144,
                                        width: double.maxFinite,
                                        padding: EdgeInsets.zero,
                                        margin:
                                            const EdgeInsets.only(bottom: 12),
                                        decoration: BoxDecoration(
                                            color: accent_cr,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      text_cr.withOpacity(0.4),
                                                  spreadRadius: -3.5,
                                                  blurRadius: 6,
                                                  offset: const Offset(0, 5))
                                            ]),
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomCard2(
                                                    colorCard: accent_cr,
                                                    widthCard: 90,
                                                    heightCard: 90,
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    borderColor: white_cr,
                                                    borderWidth: 9,
                                                    childCard: Image.asset(
                                                        e.value.img)),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, bottom: 15),
                                                  child: Text(
                                                    "\$${e.value.price}",
                                                    style: body_1.copyWith(
                                                        fontSize: 19,
                                                        color: text_cr),
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
                                                    e.value.name,
                                                    style: body_1.copyWith(
                                                        color: text_cr,
                                                        letterSpacing: 0.4),
                                                  ),
                                                  Text(
                                                    e.value.desc,
                                                    maxLines: 5,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: body_2.copyWith(
                                                        color: text_cr),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      14, 15, 15, 15),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    overlayColor:
                                                        const MaterialStatePropertyAll(
                                                            Colors.transparent),
                                                    onTap: () {
                                                      BlocProvider.of<
                                                                  SavedListCubit>(
                                                              context)
                                                          .updateSavedFurniture(
                                                        furniture: e.value,
                                                      );
                                                    },
                                                    child: const ImageIcon(
                                                      AssetImage(
                                                          "assets/imgs/icons/bookmark.png"),
                                                      color: secondary_cr,
                                                    ),
                                                  ),
                                                  const ImageIcon(
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
                                  .toList()
                              : [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: getHeight(20),
                                      ),
                                      SvgPicture.asset(
                                        "assets/imgs/empty.svg",
                                        width: getWidth(15),
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      Text(
                                        "There's No Furnitures You Saved",
                                        style: body_1.copyWith(
                                            fontSize: 14, color: primary_cr),
                                      ),
                                    ],
                                  )
                                ]),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(22, 0, 22, 22),
                      child: Column(
                          children: state.data.designer.isNotEmpty
                              ? state.data.designer.entries
                                  .map(
                                    (e) => Container(
                                        height: 122,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            color: accent_cr,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      text_cr.withOpacity(0.4),
                                                  spreadRadius: -3.5,
                                                  blurRadius: 6,
                                                  offset: const Offset(0, 5)),
                                            ]),
                                        padding: EdgeInsets.zero,
                                        margin:
                                            const EdgeInsets.only(bottom: 12),
                                        child: Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: CustomCard2(
                                                  colorCard: accent_cr,
                                                  widthCard: 110,
                                                  heightCard: 90,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 0, 8, 2),
                                                  borderColor: white_cr,
                                                  borderWidth: 9,
                                                  align: Alignment.bottomCenter,
                                                  childCard: Image.asset(
                                                    e.value.img,
                                                    fit: BoxFit.cover,
                                                  )),
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
                                                    e.value.name,
                                                    style: body_1.copyWith(
                                                        color: text_cr,
                                                        letterSpacing: 0.4),
                                                  ),
                                                  Text(
                                                    e.value.biography,
                                                    maxLines: 5,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: body_2.copyWith(
                                                        color: text_cr),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  14, 15, 15, 15),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ImageIcon(
                                                    AssetImage(
                                                        "assets/imgs/icons/bookmark.png"),
                                                    color: secondary_cr,
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
                                  .toList()
                              : [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: getHeight(20),
                                      ),
                                      SvgPicture.asset(
                                        "assets/imgs/empty.svg",
                                        width: getWidth(15),
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      Text(
                                        "There's No Designers You Saved",
                                        style: body_1.copyWith(
                                            fontSize: 14, color: primary_cr),
                                      ),
                                    ],
                                  )
                                ]),
                    ),
                    // Design
                    SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(22, 0, 22, 22),
                      child: Column(
                        children: state.data.design.isNotEmpty
                            ? state.data.design.entries
                                .map((e) => Container(
                                      height: 124,
                                      width: double.maxFinite,
                                      margin: const EdgeInsets.only(bottom: 12),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(e.value.img),
                                            fit: BoxFit.fitWidth),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                              color: text_cr.withOpacity(0.4),
                                              blurRadius: 6,
                                              spreadRadius: 0,
                                              offset: const Offset(0, 3))
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              margin: const EdgeInsets.all(12),
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: white_cr
                                                      .withOpacity(0.3)),
                                              child: InkWell(
                                                overlayColor:
                                                    const MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                child: ImageIcon(
                                                  const AssetImage(
                                                      "assets/imgs/icons/bookmark.png"),
                                                  color: e.value.bookmark
                                                      ? secondary_cr
                                                      : white_cr,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              padding: const EdgeInsets.only(
                                                  left: 15, bottom: 10),
                                              height: 44,
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(12),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12)),
                                                gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: [
                                                      text_cr.withOpacity(0.6),
                                                      text_cr.withOpacity(0.4),
                                                      Colors.transparent,
                                                    ]),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    e.value.title,
                                                    style: body_1.copyWith(
                                                        fontSize: 14,
                                                        color: white_cr),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ))
                                .toList()
                            : [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: getHeight(20),
                                    ),
                                    SvgPicture.asset(
                                      "assets/imgs/empty.svg",
                                      width: getWidth(15),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                      "There's No Decoration Styles You Saved",
                                      style: body_1.copyWith(
                                          fontSize: 14, color: primary_cr),
                                    ),
                                  ],
                                )
                              ],
                      ),
                    ),
                    // ARTICLES
                    SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(22, 0, 22, 22),
                      child: Column(
                        children: state.data.article.isNotEmpty
                            ? state.data.article.entries
                                .map((e) => Container(
                                      height: 124,
                                      width: double.maxFinite,
                                      margin: const EdgeInsets.only(bottom: 12),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(e.value.img),
                                            fit: BoxFit.fitWidth),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                              color: text_cr.withOpacity(0.4),
                                              blurRadius: 6,
                                              spreadRadius: 0,
                                              offset: const Offset(0, 3))
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              margin: const EdgeInsets.all(12),
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: white_cr
                                                      .withOpacity(0.3)),
                                              child: InkWell(
                                                onTap: () {
                                                  BlocProvider.of<
                                                              SavedListCubit>(
                                                          context)
                                                      .updateSavedArticle(
                                                          article: e.value);
                                                },
                                                highlightColor: Colors.amber,
                                                overlayColor:
                                                    const MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                child: ImageIcon(
                                                  const AssetImage(
                                                      "assets/imgs/icons/bookmark.png"),
                                                  color: e.value.bookmark
                                                      ? secondary_cr
                                                      : white_cr,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              padding: const EdgeInsets.only(
                                                  left: 15, bottom: 10),
                                              height: 44,
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(12),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12)),
                                                gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: [
                                                      text_cr.withOpacity(0.6),
                                                      text_cr.withOpacity(0.4),
                                                      Colors.transparent,
                                                    ]),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    e.value.title,
                                                    style: body_1.copyWith(
                                                        fontSize: 14,
                                                        color: white_cr),
                                                  ),
                                                  Text(
                                                    "By ${e.value.author}",
                                                    style: body_1.copyWith(
                                                        fontSize: 10,
                                                        color: white_cr),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ))
                                .toList()
                            : [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: getHeight(20),
                                    ),
                                    SvgPicture.asset(
                                      "assets/imgs/empty.svg",
                                      width: getWidth(15),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                      "There's No Articles You Saved",
                                      style: body_1.copyWith(
                                          fontSize: 14, color: primary_cr),
                                    ),
                                  ],
                                )
                              ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          );
        } else {
          return Center(
            child: Text(
              "Kesahalan terjadi, mohon coba lagi nanti",
              style: body_1.copyWith(color: primary_cr),
            ),
          );
        }
      },
    );
  }
}
