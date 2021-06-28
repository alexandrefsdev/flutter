class MyModel {
  int? id;
  String? title;
  String? body;

  MyModel({
    this.id,
    this.title,
    this.body,
  });

  factory MyModel.fromJson(Map<String, dynamic> json) => MyModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
