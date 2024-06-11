import 'package:flutter/material.dart';

import '../model/assignment_thread_model.dart';
import '../widgets/assignment_thread_widget.dart';

class AssignmentThreadHomeScreen extends StatelessWidget {
  AssignmentThreadHomeScreen({super.key});

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
      context: "In my culture, death is not the end. It's more of a stepping-off point. You reach out with both hands and Bast and Sekhmet, they lead you into the green veld where you can run forever.",
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
      context: "I am Thor, son of Odin, and as long as there is life in my breast... I am running out of things to say.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final model = items[index];
          return AssignmentThread(
            model: model,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.grey.shade200,
            width: double.infinity,
            height: 1,
          );
        },
      ),
    );
  }
}
