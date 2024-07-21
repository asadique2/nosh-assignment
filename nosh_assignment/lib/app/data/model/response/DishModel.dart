class DishModel {
  DishModel({
      this.dishName, 
      this.dishId, 
      this.imageUrl, 
      this.isPublished,});

  DishModel.fromJson(dynamic json) {
    dishName = json['dishName'];
    dishId = json['dishId'];
    imageUrl = json['imageUrl'];
    isPublished = json['isPublished'];
  }
  String? dishName;
  String? dishId;
  String? imageUrl;
  bool? isPublished;


  static List<DishModel> fromList(List<dynamic> jsonList) {
    return jsonList.map((json) => DishModel.fromJson(json)).toList();
  }

}