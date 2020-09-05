class UserFirebase {

  String uid;
  String fullName;
  String phone;
  String email;
  String city;
  String ownerImage;
  String petName;
  String petType;
  String petSubType;
  int petBirth;
  String petMedicalHistory;
  String petImage;
  String shopName;

  UserFirebase(
      this.uid,
      this.fullName,
      this.phone,
      this.email,
      this.city,
      this.petName,
      this.petType,
      this.petSubType,
      this.petBirth,
      this.petMedicalHistory,
      this.shopName);


  Map<String, String> toJson() =>
      {
        'uid': uid,
        'city':city,
        'email': email,
        'full_name':fullName,
        'pet_birth':petBirth.toString(),
        'pet_medical_history':petMedicalHistory,
        'pet_name':petName,
        'pet_sub_type':petSubType,
        'pet_type':petType,
        'phone':phone,
        'shop_name':shopName,
        'image': ownerImage,
        'pet_image':petImage
      };
  UserFirebase.fromJson(Map<String, dynamic> json)
      :
        uid=json['uid'],
        city=json['city'],
        email= json['email'],
        fullName=json['full_name'],
        petBirth=int.parse(json['pet_birth']),
        petMedicalHistory=json['pet_medical_history'],
        petName=json['pet_name'],
        petSubType=json['pet_sub_type'],
        petType=json['pet_type'],
        phone=json['phone'],
        shopName=json[':shop_name'],
        ownerImage= json['image'],
        petImage=json['pet_image'];




}