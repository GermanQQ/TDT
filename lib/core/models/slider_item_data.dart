class SliderItemData {
  late String image;
  late String title;
  late String text;

  SliderItemData(
      {required this.image, required this.title, required this.text});

  SliderItemData.fromJson(Map data) {
    image = data['image'];
    title = data['title'];
    text = data['text'];
  }
}
