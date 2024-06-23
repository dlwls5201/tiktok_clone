import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/thread/model/user.dart';
import 'package:tiktok_clone/constants/Gaps.dart';

import '../../../../constants/sizes.dart';
import '../../../../utils.dart';

class ThreadSearchScreen extends StatefulWidget {
  const ThreadSearchScreen({super.key});

  @override
  State<ThreadSearchScreen> createState() => _ThreadSearchScreenState();
}

class _ThreadSearchScreenState extends State<ThreadSearchScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          "Search",
          style: TextStyle(
            fontSize: Sizes.size20,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            child: CupertinoSearchTextField(
              controller: textEditingController,
            ),
          ),
          Gaps.v10,
          Expanded(
            child: ListView(
              children: [
                for (final user in (SearchUser.values + SearchUser.values))
                  Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          foregroundImage: NetworkImage(
                            user.thumb,
                          ),
                        ),
                        title: Row(
                          children: [
                            Text(
                              user.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Gaps.h6,
                            const FaIcon(
                              FontAwesomeIcons.ribbon,
                              color: Colors.blue,
                              size: Sizes.size12,
                            )
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.subTitle),
                            Gaps.v6,
                            Row(
                              children: [
                                if (user.isBottomIcon)
                                  Container(
                                    margin: const EdgeInsets.only(
                                      right: Sizes.size8,
                                    ),
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                      foregroundImage: NetworkImage(
                                        isDarkMode(context)
                                            ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwJI9bUz3wxt3xho_93tKk3-ce_PkzgoMaOUKBeRLEy-efxE1tUR9FWt1F0xAISu26ygc&usqp=CAU"
                                            : "https://visla.kr/wp/wp-content/uploads/2023/07/230705_22.jpg",
                                      ),
                                    ),
                                  ),
                                Text(
                                  "${user.followers} followers",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: Sizes.size14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                16,
                              ),
                            ),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: Sizes.size2,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.size20,
                              vertical: Sizes.size6,
                            ),
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                fontSize: Sizes.size14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gaps.v6,
                      Divider(
                        height: 1,
                        thickness: 1,
                        indent: Sizes.size80,
                        endIndent: Sizes.size16,
                        color: Colors.grey.shade200,
                      ),
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
