class Product {
  String title;
  String description;
  String image;
  double priceYear;
  double priceMonth;
  double price;

  Product.inyear(this.title, this.description, this.image,this.priceYear);
  Product.inmonth(this.title, this.description, this.image,this.priceMonth);
  Product.price(this.title, this.description, this.image,this.price);


  Product.fromJson(Map<String, dynamic> json)
      : title=json['title'],
        description = json['description'],
        image = json['image'],
        priceYear = double.parse(json['priceYear']),
        priceMonth = double.parse(json['priceMonth']),
        price = double.parse(json['price']);

  Map<String, String> toJson() =>
      {
        'title':title,
        'description':description,
        'image': image,
        'priceYear': priceYear.toString(),
        'priceMonth': priceMonth.toString(),
        'price': price.toString(),
      };



}