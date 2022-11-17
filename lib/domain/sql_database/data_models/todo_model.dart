
class ToDoModel {
  final int? id;
  final String title;
  final String subTitle;
  late String? time;

  ToDoModel({
    this.id,
    required this.subTitle,
    required this.title,
    this.time,
  });
}
