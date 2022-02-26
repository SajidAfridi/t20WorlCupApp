class VenuesModel {
  String country;
  String stadium;
  String city;
  String image;

  VenuesModel({
    required this.country,
    required this.stadium,
    required this.city,
    required this.image,
  });

  static VenuesModel fromJSON(Map<String, dynamic> map) {
    return VenuesModel(
        country: map['country'],
        stadium: map['stadium'],
        city: map['city'],
        image: map['image']);
  }
}
