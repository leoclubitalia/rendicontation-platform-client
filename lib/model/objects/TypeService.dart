class TypeService {
  int id;
  String title;


  TypeService({this.id, this.title});

  factory TypeService.fromJson(Map<String, dynamic> json) {
    return TypeService(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
  };


}