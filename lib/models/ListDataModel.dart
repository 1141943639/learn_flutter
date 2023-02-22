class ListDataModel {
  String? title;
  String? image;

  ListDataModel({this.title, this.image});

  ListDataModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}
