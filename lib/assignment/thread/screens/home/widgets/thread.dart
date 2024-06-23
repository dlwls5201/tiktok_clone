import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/Gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

import '../../../model/thread_model.dart';
import 'thread_info_bottom_sheet.dart';

class Thread extends StatelessWidget {
  const Thread({
    super.key,
    required this.model,
    this.isShowBottomView = true,
  });

  final bool isShowBottomView;
  final ThreadModel model;

  void _onReportTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ThreadInfoBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        const SizedBox(
                          width: 55,
                          height: 55,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              foregroundImage: NetworkImage(
                                model.thumb,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isDarkMode(context)? Colors.white: Colors.black,
                                border: Border.all(
                                  color: isDarkMode(context)? Colors.black: Colors.white,
                                  width: 3,
                                )),
                            child: FaIcon(
                              FontAwesomeIcons.plus,
                              color: isDarkMode(context)? Colors.black: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v10,
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        width: 2,
                      ),
                    ),
                    Gaps.v2,
                  ],
                ),
                Gaps.h10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            model.name,
                            style: const TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.h6,
                          const FaIcon(
                            FontAwesomeIcons.ribbon,
                            color: Colors.blue,
                            size: Sizes.size16,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "2h",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: Sizes.size16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Gaps.h6,
                                GestureDetector(
                                  onTap: () => _onReportTap(context),
                                  child: const FaIcon(
                                    FontAwesomeIcons.ellipsis,
                                    size: Sizes.size16,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      model.context.isNotEmpty
                          ? Container(
                              margin: const EdgeInsets.only(
                                top: Sizes.size6,
                              ),
                              child: Text(
                                model.context,
                                style: const TextStyle(
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            )
                          : Container(),
                      model.images.isNotEmpty
                          ? Container(
                              margin: const EdgeInsets.only(
                                top: Sizes.size16,
                              ),
                              child: SizedBox(
                                height: 150,
                                child: PageView.builder(
                                  controller: PageController(viewportFraction: 0.85),
                                  itemCount: model.images.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                        right: Sizes.size10,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          model.images[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          : Container(),
                      Container(
                        margin: const EdgeInsets.only(
                          top: Sizes.size16,
                        ),
                        child: const Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.heart,
                            ),
                            Gaps.h14,
                            FaIcon(
                              FontAwesomeIcons.comment,
                            ),
                            Gaps.h14,
                            FaIcon(
                              FontAwesomeIcons.arrowsRotate,
                            ),
                            Gaps.h14,
                            FaIcon(
                              FontAwesomeIcons.paperPlane,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Gaps.v5,
          if (isShowBottomView)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 55,
                  height: 45,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://i.namu.wiki/i/5jFH_c97fBV1fUMnTm5gsYwsC_hvchJqwl9vHrsMQq5y5sUnD4ppEaAchSZiI5bh4EuvtFd02obDFb-m6zdKYg.webp",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://i.namu.wiki/i/APF_M3b3EO3CM9_EUyRb44a2CHU8a-uVgeZE0UNYkoePoCAGxIeH06nbZW6tiV5iSeaQx0Pp-LNdkrRSixVcdw.webp",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        bottom: 0,
                        child: SizedBox(
                          width: 15,
                          height: 15,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://i.namu.wiki/i/1JNGu2hM7iPsK46em0cLSJFpKpnnwnWMrQXZnq3D9-xCKQUhNgObpNuJTgM0IfNJ3q-LH7jDC-YBySfIgS7SJA.webp",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.h10,
                Text(
                  "${Random().nextInt(100)} replies, ${Random().nextInt(999)} likes",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
