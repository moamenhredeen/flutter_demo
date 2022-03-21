class TodoItem {
  int? id;
  String? header;
  String? body;
  String? status;
  int? priority;
  String? createdAt;
  String? updatedAt;

  TodoItem(
      {this.id,
        this.header,
        this.body,
        this.status,
        this.priority,
        this.createdAt,
        this.updatedAt});

  TodoItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    body = json['body'];
    status = json['status'];
    priority = json['priority'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['header'] = this.header;
    data['body'] = this.body;
    data['status'] = this.status;
    data['priority'] = this.priority;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}