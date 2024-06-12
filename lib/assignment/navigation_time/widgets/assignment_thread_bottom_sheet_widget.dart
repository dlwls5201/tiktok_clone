import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

import '../../../constants/sizes.dart';

class AssignmentThreadBottomSheet extends StatefulWidget {
  const AssignmentThreadBottomSheet({super.key});

  @override
  State<AssignmentThreadBottomSheet> createState() => _AssignmentThreadBottomSheetState();
}

class _AssignmentThreadBottomSheetState extends State<AssignmentThreadBottomSheet> {
  final reports = [
    "I just don't like it",
    "It's unlawful content under NetzDG",
    "It's spam",
    "Hate speech or symbols",
    "Nudity or sexual activity",
    "I just don't like it",
    "It's unlawful content under NetzDG",
    "It's spam",
    "Hate speech or symbols",
    "Nudity or sexual activity",
  ];

  var _isReportScreen = false;

  void _onReportTap() {
    setState(() {
      _isReportScreen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              width: 60,
              height: 6,
            ),
          ),
        ),
        body: _isReportScreen ? buildReport() : buildSetting(),
      ),
    );
  }

  Padding buildReport() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size16,
      ),
      child: Column(
        children: [
          const Text(
            "Report",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size20,
            ),
          ),
          Gaps.v16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 1,
                decoration: BoxDecoration(color: Colors.grey.shade300),
              ),
              Gaps.v16,
              const Text(
                "Why are you reporting this thread?",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size20,
                ),
              ),
              Gaps.v8,
              Text(
                "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.normal,
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.v16,
              Container(
                height: 1,
                decoration: BoxDecoration(color: Colors.grey.shade300),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size16,
                    horizontal: Sizes.size10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        report,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.chevronRight,
                        color: Colors.grey.shade400,
                        size: Sizes.size16,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Container(
                height: 1,
                decoration: BoxDecoration(color: Colors.grey.shade300),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding buildSetting() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size32,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            width: double.infinity,
            height: Sizes.size56,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: const Text(
              "Unfollow",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Sizes.size16,
              ),
            ),
          ),
          Container(
            color: Colors.grey.shade300,
            width: double.infinity,
            height: 1,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            width: double.infinity,
            height: Sizes.size56,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: const Text(
              "Mute",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Sizes.size16,
              ),
            ),
          ),
          Gaps.v28,
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            width: double.infinity,
            height: Sizes.size56,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: const Text(
              "Hide",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Sizes.size16,
              ),
            ),
          ),
          Container(
            color: Colors.grey.shade300,
            width: double.infinity,
            height: 1,
          ),
          GestureDetector(
            onTap: _onReportTap,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              width: double.infinity,
              height: Sizes.size56,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: const Text(
                "Report",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
