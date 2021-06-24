class Food {
  String idFood;
  String name;
  String image;
  String location;
  String describe;
  String ingredients;
  double rating;

  Food(
      {this.idFood,
      this.name,
      this.image,
      this.location,
      this.describe,
      this.ingredients,
      this.rating});

  Food.fromJson(Map<String, dynamic> json) {
    idFood = json['idFood'];
    name = json['name'];
    image = json['image'];
    location = json['location'];
    describe = json['describe'];
    ingredients = json['ingredients'];
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
    data['rating'] = this.rating;
    return data;
  }
}
