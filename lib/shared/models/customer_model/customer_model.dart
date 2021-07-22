class CustomerModel {
  CustomerModel({
    required this.id,
    this.createdDate,
    this.dateOfBirth,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.updatedDate,
  });

  final String? createdDate;
  final String? dateOfBirth;
  final String? email;
  final String? firstName;
  final int id;
  final String? lastName;
  final String? phone;
  final String? updatedDate;
}
