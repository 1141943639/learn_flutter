class ListDataModel {
  String? title;
  String? image;
  bool? checked;

  ListDataModel({this.title, this.image, this.checked});

  ListDataModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['checked'] = checked;
    return data;
  }
}
