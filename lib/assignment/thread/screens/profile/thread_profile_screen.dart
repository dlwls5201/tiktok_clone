import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/thread/model/user.dart';
import 'package:tiktok_clone/assignment/thread/screens/profile/widgets/thread_persistent_tab_bar.dart';
import 'package:tiktok_clone/constants/Gaps.dart';
import 'package:tiktok_clone/utils.dart';

import '../../../../constants/sizes.dart';
import '../../model/thread_model.dart';
import '../home/widgets/thread.dart';
import '../settings/thread_settings_screen.dart';

class ThreadProfileScreen extends StatefulWidget {
  const ThreadProfileScreen({super.key});

  @override
  State<ThreadProfileScreen> createState() => _ThreadProfileScreenState();
}

class _ThreadProfileScreenState extends State<ThreadProfileScreen> {
  final items = [
    ThreadModel(
      name: User.SpiderMain.name,
      thumb: User.SpiderMain.thumb,
      context: "With great power comes great responsibility",
    ),
    ThreadModel(
      name: User.CaptainAmerica.name,
      thumb: User.CaptainAmerica.thumb,
      images: [
        "https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2023%2F08%2Flego-captain-america-shield-2023-1.jpg?cbr=1&q=90",
      ],
    ),
    ThreadModel(
      name: User.BlackPanther.name,
      thumb: User.BlackPanther.thumb,
      context:
          "In my culture, death is not the end. It's more of a stepping-off point. You reach out with both hands and Bast and Sekhmet, they lead you into the green veld where you can run forever.",
      images: [
        "https://image.ytn.co.kr/general/jpg/2018/0418/201804180949030735_d.jpg",
        "https://cdn.casenews.co.kr/news/photo/201905/2398_9196_342.jpg",
        "https://t1.daumcdn.net/thumb/R720x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/1isF/image/yu5j-jnx9AxURcjY7Cd_hkbe_CI.jpg"
      ],
    ),
    ThreadModel(
      name: User.IronMan.name,
      thumb: User.IronMan.thumb,
      context: "I am Iron Man.",
      images: [
        "https://mblogthumb-phinf.pstatic.net/MjAxOTExMTJfMTE2/MDAxNTczNTcwNDg0Njkz.mGr7k37QBTeO1h9Y1KKW63j0qq-U6qHEp0fYYKtrrOwg.7Z59l6dA9_xc8wMrmiMoNl6-gE6OZfcE-r3vHc7bgXgg.JPEG.dongyoon87/kevin-feige-con-iron-man-volevamo-visto-v3-410594.jpg?type=w800",
      ],
    ),
    ThreadModel(
      name: User.BlackWidow.name,
      thumb: User.BlackWidow.thumb,
      images: [
        "https://www.ilovepc.co.kr/news/photo/202009/36308_74437_454.jpg",
      ],
    ),
    ThreadModel(
      name: User.Thor.name,
      thumb: User.Thor.thumb,
      context:
          "I am Thor, son of Odin, and as long as there is life in my breast... I am running out of things to say.",
    ),
  ];

  void _onBarsPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ThreadSettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  leading: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.globe,
                    ),
                  ),
                  actions: [
                    const FaIcon(
                      FontAwesomeIcons.instagram,
                      size: Sizes.size32,
                    ),
                    Gaps.h12,
                    IconButton(
                      onPressed: _onBarsPressed,
                      icon: const FaIcon(FontAwesomeIcons.barsStaggered),
                    )
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Jane",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size28,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "jane_mobbin",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: Sizes.size18,
                                      ),
                                    ),
                                    Gaps.h8,
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: Sizes.size10,
                                          vertical: Sizes.size6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(Sizes.size16),
                                          ),
                                        ),
                                        child: Text(
                                          "threads.net",
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: Sizes.size12,
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              radius: Sizes.size36,
                              foregroundImage: NetworkImage(
                                "https://blisgo.com/wp-content/uploads/2020/10/%ED%99%94%EB%B6%84.jpg",
                              ),
                            )
                          ],
                        ),
                        Gaps.v12,
                        const Text(
                          "Plant enthusiast!",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.v16,
                        Row(
                          children: [
                            SizedBox(
                              width: 40,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Sizes.size16,
                                      ),
                                      border: Border.all(
                                        color: isDarkMode(context) ? Colors.black : Colors.white,
                                        width: Sizes.size1,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: Sizes.size12,
                                      foregroundImage: NetworkImage(
                                        User.SpiderMain.thumb,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 15,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Sizes.size16,
                                        ),
                                        border: Border.all(
                                          color: isDarkMode(context) ? Colors.black : Colors.white,
                                          width: Sizes.size1,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius: Sizes.size12,
                                        foregroundImage: NetworkImage(
                                          User.BlackWidow.thumb,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gaps.h10,
                            Text(
                              "2 followers",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: Sizes.size16,
                              ),
                            )
                          ],
                        ),
                        Gaps.v16,
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size12,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(Sizes.size16),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    )),
                                child: const Text(
                                  'Edit profile',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.size16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Gaps.h16,
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size12,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(Sizes.size16),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    )),
                                child: const Text(
                                  'Share profile',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.size16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gaps.v16,
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: ThreadPersistentTabBar(),
                  pinned: true,
                )
              ];
            },
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final model = items[index];
                    return Thread(
                      model: model,
                      isShowBottomView: false,
                    );
                  },
                ),
                const Center(
                  child: Text("Second page"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
