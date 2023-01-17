class SearchData {
  Search? search;

  SearchData({this.search});

  SearchData.fromJson(Map<String, dynamic> json) {
    search = json['search'] != null ? Search.fromJson(json['search']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (search != null) {
      data['search'] = search!.toJson();
    }
    return data;
  }
}

class Search {
  String? query;
  int? totalResults;
  int? currentPage;
  int? totalPages;
  List<Results>? results;

  Search(
      {this.query,
      this.totalResults,
      this.currentPage,
      this.totalPages,
      this.results});

  Search.fromJson(Map<String, dynamic> json) {
    query = json['query'];
    totalResults = json['total_results'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['query'] = query;
    data['total_results'] = totalResults;
    data['current_page'] = currentPage;
    data['total_pages'] = totalPages;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? verseKey;
  int? verseId;
  String? text;
  Null? highlighted;
  List<Words>? words;
  List<Translations>? translations;

  Results(
      {this.verseKey,
      this.verseId,
      this.text,
      this.highlighted,
      this.words,
      this.translations});

  Results.fromJson(Map<String, dynamic> json) {
    verseKey = json['verse_key'];
    verseId = json['verse_id'];
    text = json['text'];
    highlighted = json['highlighted'];
    if (json['words'] != null) {
      words = <Words>[];
      json['words'].forEach((v) {
        words!.add(Words.fromJson(v));
      });
    }
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['verse_key'] = verseKey;
    data['verse_id'] = verseId;
    data['text'] = text;
    data['highlighted'] = highlighted;
    if (words != null) {
      data['words'] = words!.map((v) => v.toJson()).toList();
    }
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Words {
  String? charType;
  String? text;

  Words({this.charType, this.text});

  Words.fromJson(Map<String, dynamic> json) {
    charType = json['char_type'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['char_type'] = charType;
    data['text'] = text;
    return data;
  }
}

class Translations {
  String? text;
  int? resourceId;
  String? name;
  String? languageName;

  Translations({this.text, this.resourceId, this.name, this.languageName});

  Translations.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    resourceId = json['resource_id'];
    name = json['name'];
    languageName = json['language_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = text;
    data['resource_id'] = resourceId;
    data['name'] = name;
    data['language_name'] = languageName;
    return data;
  }
}
