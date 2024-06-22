import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../model/thread_model.dart';
import 'new_comment.dart';

class NewThreadBottomSheet extends StatefulWidget {
  const NewThreadBottomSheet({super.key});

  @override
  State<NewThreadBottomSheet> createState() => _NewThreadBottomSheetState();
}

class _NewThreadBottomSheetState extends State<NewThreadBottomSheet> {
  final TextEditingController _postController = TextEditingController();

  bool _isWriting = false;

  XFile? _selectedFile = null;

  @override
  void initState() {
    super.initState();
    _postController.addListener(
      () {
        setState(
          () {
            _isWriting = _postController.text.isNotEmpty;
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.75,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size14,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          scrolledUnderElevation: 0,
          title: const Text(
            "New thread",
            style: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leadingWidth: 100,
          leading: TextButton(
            onPressed: _onClosePressed,
            child: const Text(
              "Cancel",
              style: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          child: Column(
            children: [
              Container(
                height: 1,
                color: Colors.grey.shade200,
              ),
              Expanded(
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        NewCommentThread(
                          model: ThreadModel(
                            name: "kiki",
                            thumb:
                                "https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/duLL/image/ab5WFfaaivwUBcC7HyPUz6mYg28.jpg",
                            context: "I love STUDIO GHIBLI",
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      width: size.width,
                      child: BottomAppBar(
                        elevation: 0,
                        padding: const EdgeInsets.all(0),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: Sizes.size48,
                                child: TextField(
                                  controller: _postController,
                                  expands: true,
                                  minLines: null,
                                  maxLines: null,
                                  textInputAction: TextInputAction.newline,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: InputDecoration(
                                    hintText: "Anyone can replay",
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: Sizes.size10,
                                      horizontal: Sizes.size12,
                                    ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                        right: Sizes.size36,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Post",
                                            style: TextStyle(
                                              fontSize: Sizes.size20,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  _isWriting ? Colors.blue : Colors.grey.shade400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
