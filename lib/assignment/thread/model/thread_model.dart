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
