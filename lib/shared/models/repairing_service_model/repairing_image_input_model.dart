class RepairingImageInputModel {
  RepairingImageInputModel({
    required this.url,
    this.medium,
    this.small,
    this.thumbnail,
  });

  String? medium;
  String? small;
  String? thumbnail;
  String url;
}
