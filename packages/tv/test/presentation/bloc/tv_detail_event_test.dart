import 'package:flutter_test/flutter_test.dart';
import 'package:tv/presentation/bloc/tvdetail/tvdetail_bloc.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('Cek if props same with the input', () {
    expect([1], const FetchTvDetailDataWithId(1).props);
    expect([testTvDetail], const AddWatchlist(testTvDetail).props);
    expect([testTvDetail], const RemoveWatchlist(testTvDetail).props);
    expect([1], const LoadWatchlistStatus(1).props);
  });
}
