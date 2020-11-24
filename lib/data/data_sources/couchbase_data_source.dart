import 'package:deep_pick/deep_pick.dart';
import 'package:sc_clean_architecture/couchbase/couchbase.dart';
import 'package:sc_clean_architecture/data/data_sources/wish_data_source.dart';
import 'package:sc_clean_architecture/data/dto/couchbase_wish.dart';
import 'package:sc_clean_architecture/domain/entities/wish.dart';

class CouchbaseDataSource extends WishDataSource {
  CouchbaseDataSource(this._couchbaseDb);

  final CouchbaseDb _couchbaseDb;

  @override
  Future<List<Wish>> getWishlist() async {
    final map = _couchbaseDb.query();
    return pick(map, 'products').asListOrEmpty((_pick) {
      return CouchbaseWish.fromMap(_pick.required().asMap()).toEntity();
    });
  }
}