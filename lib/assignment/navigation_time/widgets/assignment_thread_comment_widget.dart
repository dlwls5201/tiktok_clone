import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/Gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

import '../model/assignment_thread_model.dart';

class AssignmentCommentThread extends StatelessWidget {
  const AssignmentCommentThread({
    super.key,
    required this.model,
  });

  final ThreadModel model;

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
                                color: Colors.black,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                )),
                            child: const FaIcon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
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
                              color: Colors.black,
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                                  color: Colors.black,
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
