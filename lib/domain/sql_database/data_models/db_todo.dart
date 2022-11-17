import 'package:intl/intl.dart';

class DBTodo {
  int? id;
  String? title;
  String? subTitle;
  String? time;
  DBTodo({
    this.id = 0,
    this.title = '',
    this.subTitle = '',
    this.time = '',
  });

  factory DBTodo.fromJson(Map<String, dynamic> json) {
    final nowTime = DateTime.now();
    final setTime = DateFormat('dd.MM.yyyy hh:mm:ss').format(nowTime);
    return DBTodo(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Error',
      subTitle: json['subTitle'] ?? 'Error',
      time: setTime,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subTitle': subTitle,
        'time': time,
      };
}
