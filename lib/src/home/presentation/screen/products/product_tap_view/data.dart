class TypeOfRent {
  final String imageSrc;
  final String typeName;
  final String location;
  final String sizeRent;
  final String priceOfRent;

  const TypeOfRent(
      {required this.imageSrc,
      required this.typeName,
      required this.location,
      required this.priceOfRent,
      required this.sizeRent});
}

class CategoriesItem {
  final String iconSrc;
  final String iconName;
  const CategoriesItem({required this.iconName, required this.iconSrc});
}
