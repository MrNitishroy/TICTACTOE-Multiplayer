import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktaktoe_multiplayer/Components/InGameUserCard.dart';
import 'package:tiktaktoe_multiplayer/Configs/AssetsPath.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    var playValue = ["X", "", "", "", "", "", "", "X", "X"];
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: SvgPicture.asset(
            IconsPath.smsIcon,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Row(
                  //   children: [
                  //     SvgPicture.asset(IconsPath.backIcon),
                  //     const SizedBox(width: 15),
                  //     Text(
                  //       "Play Game",
                  //       style: Theme.of(context).textTheme.bodyMedium,
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          InGameUserCard(
                            icon: IconsPath.xIcon,
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  IconsPath.wonIcon,
                                ),
                                SizedBox(width: 10),
                                Text("WON : 12")
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InGameUserCard(
                            icon: IconsPath.oIcon,
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  IconsPath.wonIcon,
                                ),
                                SizedBox(width: 10),
                                Text("WON : 12")
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    color: Theme.of(context).colorScheme.primary,
                    strokeWidth: 2,
                    dashPattern: [10, 10],
                    radius: Radius.circular(20),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: w,
                      height: w - 33,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                        itemCount: 9,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: EdgeInsets.all(0.5),
                            decoration: BoxDecoration(
                              color: playValue[index] == "X"
                                  ? Theme.of(context).colorScheme.primary
                                  : playValue[index] == "O"
                                      ? Theme.of(context).colorScheme.secondary
                                      : playValue[index] == ""
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primaryContainer
                                          : Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                              borderRadius: index == 0
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                    )
                                  : index == 2
                                      ? const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                        )
                                      : index == 6
                                          ? const BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                            )
                                          : index == 8
                                              ? const BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(20),
                                                )
                                              : const BorderRadius.only(),
                            ),
                            child: Center(
                              child: playValue[index] == "X"
                                  ? SvgPicture.asset(
                                      IconsPath.xIcon,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      width: 45,
                                    )
                                  : playValue[index] == "O"
                                      ? SvgPicture.asset(
                                          IconsPath.oIcon,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          width: 50,
                                        )
                                      : playValue[index] == ""
                                          ? SizedBox()
                                          : SizedBox(),
                            ),
                          );
                        }),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
