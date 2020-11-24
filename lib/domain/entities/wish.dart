/// Entity for a wish, purchase on wish.com.
class Wish {
  /// Default constructor.
  Wish({
    this.id, this.icon, this.name, this.price,
  });

  // The id of the wish.
  final int id;

  // The icon of the wish.
  final String icon;

  // The name of the wish.
  final String name;

  // The price of the wish.
  final double price;
}
