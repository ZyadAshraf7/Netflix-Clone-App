class MovieModel {
  String? id;
  String? name;
  String? description;
  List<String>? starring;
  String? director;
  String? image;
  String? releaseYear;
  String? releaseDate;
  String? runtime;
  String? age;
  String? trailer;
  List<String>? genres;
  int? totalViews;
  int? weeklyViews;

  MovieModel(
      {this.id,
      this.name,
      this.description,
      this.starring,
      this.director,
      this.image,
      this.releaseYear,
      this.releaseDate,
      this.runtime,
      this.age,
      this.trailer,
      this.genres,
      this.totalViews,
      this.weeklyViews});
    MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    starring = json['starring'].cast<String>();
    director = json['director'];
    image = json['image'];
    releaseYear = json['releaseYear'];
    releaseDate = json['releaseDate']??"";
    runtime = json['runtime']??"";
    age = json['age'];
    trailer = json['trailer'];
    genres = json['genres'].cast<String>();
    totalViews = json['totalViews']??0;
    weeklyViews = json['weeklyViews']??0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['starring'] = starring;
    data['director'] = director;
    data['image'] = image;
    data['releaseYear'] = releaseYear??"";
    data['runtime'] = runtime??"";
    data['age'] = age;
    data['trailer'] = trailer;
    data['genres'] = genres;
    data['totalViews'] = totalViews??0;
    data['weeklyViews'] = weeklyViews??0;
    return data;
  }
}
