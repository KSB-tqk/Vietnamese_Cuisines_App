class Food {
  String idFood;
  String name;
  String image;
  String location;
  String describe;
  String ingredients;
  String recipe;
  String searchName;
  double rating;

  Food(
      {this.idFood,
      this.name,
      this.image,
      this.location,
      this.describe,
      this.ingredients,
      this.recipe,
      this.searchName,
      this.rating});

  Food.fromJson(Map<String, dynamic> json) {
    idFood = json['idFood'];
    name = json['name'];
    image = json['image'];
    location = json['location'];
    describe = json['describe'];
    ingredients = json['ingredients'];
    recipe = json['recipe'];
    searchName = json['searchName'];
    rating = json['rating'] * (1.0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.idFood;
    data['name'] = this.name;
    data['image'] = this.image;
    data['location'] = this.location;
    data['describe'] = this.describe;
    data['ingredients'] = this.ingredients;
    data['recipe'] = this.recipe;
    data['searchName'] = this.searchName;
    data['rating'] = this.rating;
    return data;
  }
}
