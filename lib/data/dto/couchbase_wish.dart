import 'package:deep_pick/deep_pick.dart';
import 'package:sc_clean_architecture/domain/entities/wish.dart';

/// Data Transfer object for a wish, purchase on wish.com.
class CouchbaseWish {
  /// Default constructor.
  CouchbaseWish({
    this.price,
    this.id,
    this.name,
    this.icon,
  });

  /// Constructs a [CouchbaseWish] from a map.
  CouchbaseWish.fromMap(Map<String, dynamic> map)
      : name = pick(map, 'name').asStringOrNull(),
        price = pick(map, 'price').asDoubleOrNull(),
        id = pick(map, 'id').asIntOrNull(),
        icon = pick(map, 'icon').asStringOrNull();

  final double price;

  final int id;

  final String name;

  final String icon;

  Wish toEntity() {
    return Wish(
      name: name,
      icon: icon,
      id: id,
      price: price,
    );
  }
}