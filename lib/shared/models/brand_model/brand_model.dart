class BrandModel {
  BrandModel({
    this.bikeId,
    this.bikeName,
  });

  String? bikeId;
  String? bikeName;

  @override
  String toString() {
    return '$bikeName';
  }
}
