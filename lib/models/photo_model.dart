class PhotoModel {
  final String? srcMedium;
  final String? srcOriginal;
  final String? photographer;
  final String? alt;
  final int? id;

  PhotoModel(
      {required this.srcMedium,
      required this.srcOriginal,
      required this.photographer,
      required this.alt,
      required this.id});

  factory PhotoModel.fromJson(dynamic json) {
    return PhotoModel(
        srcOriginal:
            json['src'] != null ? json['src']['original'] : json['srcOriginal'],
        srcMedium:
            json['src'] != null ? json['src']['medium'] : json['srcMedium'],
        photographer: json['photographer'],
        alt: json['alt'],
        id: json['id']);
  }

  static Map<String, dynamic> toJson(PhotoModel model) => {
        'srcMedium': model.srcMedium,
        'srcOriginal': model.srcOriginal,
        'photographer': model.photographer,
        'alt': model.alt,
        'id': model.id
      };
}
