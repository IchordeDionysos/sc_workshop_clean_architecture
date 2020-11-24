import 'package:sc_clean_architecture/data/data_sources/wish_data_source.dart';
import 'package:sc_clean_architecture/domain/entities/wish.dart';
import 'package:sc_clean_architecture/domain/repositories/wishlist_repo.dart';

class WishlistRepoImpl extends WishlistRepo {
  WishlistRepoImpl(this._dataSource);

  final WishDataSource _dataSource;

  @override
  Future<List<Wish>> getWishlist() {
    return _dataSource.getWishlist();
  }
}