
class HomeDataModel {
  List<ResualtModel> results = [];


  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['results'].forEach((element) {
      results.add(ResualtModel.fromJson(element));
    });


  }
}

class ResualtModel {
  int? id;
  String? title;
  List<AuthorsModel> authors = [] ;
  List<ImagUrl> imageUrl = [];

  ResualtModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];

    json['authors'].forEach((element) {
      authors.add(AuthorsModel.fromJson(element));
    });
    json['imageUrl'].forEach((element) {
      imageUrl.add(ImagUrl.fromJson(element));
    });

  }
}

class AuthorsModel {

  String? name;

  AuthorsModel.fromJson(Map<String, dynamic> json) {

    name = json['name'];

  }


  }
class ImagUrl{
  String? image;

  ImagUrl.fromJson(Map<String, dynamic> json) {

    image = json['image/jpeg'];

  }
}
