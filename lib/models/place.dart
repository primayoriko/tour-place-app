class Place{
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String ticketPrice;
  String imageAsset;
  List<String> imageUrls;
  bool isFavourite;
  double rating;

  Place({
    this.name,
    this.location,
    this.description,
    this.openDays,
    this.openTime,
    this.ticketPrice,
    this.imageAsset,
    this.imageUrls,
    this.isFavourite,
    this.rating,
  });
}