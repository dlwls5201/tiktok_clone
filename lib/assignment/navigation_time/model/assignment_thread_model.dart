class ThreadModel {
  final String name, thumb, context;
  final List<String> images;

  ThreadModel({
    required this.name,
    required this.thumb,
    this.context = "",
    this.images = const [],
  });
}

enum User {
  SpiderMain("spider_man",
      "https://i.namu.wiki/i/vZaJ79uS0_pnpbIgBxGr3ugr5sSmvSAmXVUBr6av_UD21oefhGwHgP5Rnga3jZZhmL2D1zZgGtPVrXnTf4m4vA.webp"),
  CaptainAmerica("captain_america",
      "https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/no/2020/10/08/SSI_20201008104519.jpg"),
  BlackPanther("black_panther",
      "https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2020%2F09%2Fcomixology-service-black-panther-comics-free-1.jpg?cbr=1&q=90"),
  IronMan("iron_man",
      "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201702/18/htm_20170218114544126552.jpg"),
  BlackWidow("black_widow",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsCaYosPcI4CBrCukGEZ3Fnw4mESulHuRzCA&usqp=CAU"),
  Thor('thor_odinson',
      "https://i.namu.wiki/i/tKJg-PS09hrPRumAurrHtI4sd4saneYEh5aqOJM4S7K3mVSdrNifVoeT_TXydD04s2MJmqhF_IEQlvCBzynG9Q.webp");

  final String name, thumb;

  const User(this.name, this.thumb);
}
