import 'dart:async';
import 'package:sc_clean_architecture/domain/entities/wish.dart';
import 'package:sc_clean_architecture/domain/repositories/wishlist_repo.dart';

/// Use-case to get the wish list.
class GetWishlist {
  /// Default constructor.
  GetWishlist(this._repo);

  final WishlistRepo _repo;

  /// Use-case caller.
  Future<List<Wish>> call() async {
    return _repo.getWishlist();
  }
}
