import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants/Gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

import '../../model/thread_model.dart';
import '../camera/thread_camera_screen.dart';

class NewCommentThread extends StatefulWidget {
  const NewCommentThread({
    super.key,
    required this.model,
  });

  final ThreadModel model;

  @override
  State<NewCommentThread> createState() => _NewCommentThreadState();
}

class _NewCommentThreadState extends State<NewCommentThread> {
  XFile? _selectedFile;

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
                                widget.model.thumb,
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
                            widget.model.name,
                            style: const TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      widget.model.context.isNotEmpty
                          ? Container(
                              margin: const EdgeInsets.only(
                                top: Sizes.size6,
                              ),
                              child: Text(
                                widget.model.context,
                                style: const TextStyle(
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            )
                          : Container(),
                      widget.model.images.isNotEmpty
                          ? Container(
                              margin: const EdgeInsets.only(
                                top: Sizes.size16,
                              ),
                              child: SizedBox(
                                height: 150,
                                child: PageView.builder(
                                  controller: PageController(viewportFraction: 0.85),
                                  itemCount: widget.model.images.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                        right: Sizes.size10,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          widget.model.images[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          : Container(),
                      Gaps.v16,
                      _selectedFile == null
                          ? GestureDetector(
                              onTap: () async {
                                final result = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ThreadCameraScreen(),
                                  ),
                                );

                                if (result != null && result is XFile) {
                                  setState(() {
                                    _selectedFile = result;
                                  });
                                }
                              },
                              child: const FaIcon(
                                FontAwesomeIcons.paperclip,
                              ),
                            )
                          : Image.file(File(_selectedFile!.path))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
