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
    title = json['title'];
    descritrion = json['descritrion'];
    qtyModules = json['modules_qty'];
    time = json['time'];
    price = json['price'];
    imageUrl = json['image'];
  }
}
