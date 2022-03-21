class Course {
  late String title, descritrion;
  late String imageUrl;
  late int qtyModules, time;
  late num price;
  Course({
    required this.title,
    required this.descritrion,
    required this.qtyModules,
    required this.time,
    required this.price,
    required this.imageUrl,
  });

  Course.fromJson(Map json){
    this.title = json['title'];
    this.descritrion = json['descritrion'];
    this.qtyModules = json['modules_qty'];
    this.time = json['time'];
    this.price = json['price'];
    this.imageUrl = json['image'];
  }
}
