class PolicyModel {
  PolicyModel({
    required this.id,
    this.createdDate,
    this.description,
    this.name,
    this.updatedDate,
  });

  final String? createdDate;
  final String? description;
  final int? id;
  final String? name;
  final String? updatedDate;
}
