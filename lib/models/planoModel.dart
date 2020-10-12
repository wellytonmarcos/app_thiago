class PlanoModel {
  String objectId;
  String name;
  String start;
  String end;
  String theme;
  bool status;

  PlanoModel(
      {this.objectId,
      this.name,
      this.start,
      this.end,
      this.theme,
      this.status});

  PlanoModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    name = json['name'];
    start = json['start'];
    end = json['end'];
    theme = json['theme'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['name'] = this.name;
    data['start'] = this.start;
    data['end'] = this.end;
    data['theme'] = this.theme;
    data['status'] = this.status;
    return data;
  }
}
