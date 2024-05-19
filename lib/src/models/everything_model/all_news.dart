class AllNewsResponse {
  String? status;
  int? totalResults;
  List<AllArticals>? allArticals;

  AllNewsResponse({
    this.allArticals,
    this.totalResults,
    this.status,
  });
  AllNewsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      allArticals = <AllArticals>[];
      json['articles'].forEach((v) {
        allArticals!.add(AllArticals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (allArticals != null) {
      data['articles'] = allArticals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllArticals {
  List<AllSource>? allSource;
  String? author;
  String? title;
  String? description;
  String? newsUrl;
  String? imageUrl;
  String? publishedAt;
  String? content;

  AllArticals({
    this.allSource,
    this.author,
    this.title,
    this.description,
    this.newsUrl,
    this.imageUrl,
    this.publishedAt,
    this.content,
  });

  AllArticals.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    newsUrl = json['url'];
    imageUrl = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
    if (json['source'] != null) {
      allSource = <AllSource>[];
      json['source'].forEach((v) {
        allSource!.add(AllSource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = newsUrl;
    data['urlToImage'] = imageUrl;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    if (allSource != null) {
      data['source'] = allSource!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllSource {
  String? id;
  String? name;

  AllSource({this.id, this.name});

  AllSource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    return data;
  }
}
