import 'package:sc_clean_architecture/couchbase/couchbase.dart';
import 'package:sc_clean_architecture/data/data_sources/couchbase_data_source.dart';
import 'package:sc_clean_architecture/domain/entities/wish.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockCouchbaseDb extends Mock implements CouchbaseDb {}

void main() {
  MockCouchbaseDb mockCouchbaseDb;
  CouchbaseDataSource dataSource;

  setUp(() {
    mockCouchbaseDb = MockCouchbaseDb();
    dataSource = CouchbaseDataSource(mockCouchbaseDb);
  });

  test('test couchbase data source', () {
    when(mockCouchbaseDb.query()).thenReturn({
      'products': [{
        'id': 9,
        'icon': 'icon_name',
        'name': 'Wishlist name',
        'price': 99,
      }]
    });
    dataSource.getWishlist().then((list) {
      expect(list.length, 1);
      expect(list[0].id, 9);
      expect(list[0].icon, 'icon_name');
      expect(list[0].name, 'Wishlist name');
      expect(list[0].price, 99);
    });
  });

  test('test couchbase data source emtpy wishlist', () {
    when(mockCouchbaseDb.query()).thenReturn({
      'products': [],
    });
    dataSource.getWishlist().then((list) {
      expect(list, isEmpty);
    });
  });
}
