class ChaptersListModel {
  List<ChaptersModel>? chapters;

  ChaptersListModel({this.chapters});

  ChaptersListModel.fromJson(Map<String, dynamic> json) {
    if (json['chapters'] != null) {
      chapters = <ChaptersModel>[];
      json['chapters'].forEach((chapter) {
        chapters!.add(ChaptersModel.fromJson(chapter));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chapters != null) {
      data['chapters'] = chapters!.map((chapter) => chapter.toJson()).toList();
    }
    return data;
  }
}

class ChaptersModel {
  int? id;
  String? revelationPlace;
  int? revelationOrder;
  bool? bismillahPre;
  String? nameSimple;
  String? nameComplex;
  String? nameArabic;
  int? versesCount;
  List<int>? pages;
  TranslatedNameModel? translatedName;

  ChaptersModel(
      {this.id,
      this.revelationPlace,
      this.revelationOrder,
      this.bismillahPre,
      this.nameSimple,
      this.nameComplex,
      this.nameArabic,
      this.versesCount,
      this.pages,
      this.translatedName});

  ChaptersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    revelationPlace = json['revelation_place'];
    revelationOrder = json['revelation_order'];
    bismillahPre = json['bismillah_pre'];
    nameSimple = json['name_simple'];
    nameComplex = json['name_complex'];
    nameArabic = json['name_arabic'];
    versesCount = json['verses_count'];
    pages = json['pages'].cast<int>();
    translatedName = json['translated_name'] != null
        ? TranslatedNameModel.fromJson(json['translated_name'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['revelation_place'] = revelationPlace;
    data['revelation_order'] = revelationOrder;
    data['bismillah_pre'] = bismillahPre;
    data['name_simple'] = nameSimple;
    data['name_complex'] = nameComplex;
    data['name_arabic'] = nameArabic;
    data['verses_count'] = versesCount;
    data['pages'] = pages;
    if (translatedName != null) {
      data['translated_name'] = translatedName!.toJson();
    }
    return data;
  }
}

class TranslatedNameModel {
  String? languageName;
  String? name;

  TranslatedNameModel({this.languageName, this.name});

  TranslatedNameModel.fromJson(Map<String, dynamic> json) {
    languageName = json['language_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['language_name'] = languageName;
    data['name'] = name;
    return data;
  }
}
