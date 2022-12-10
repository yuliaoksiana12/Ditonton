import 'package:flutter_test/flutter_test.dart';
import 'package:tv/presentation/bloc/tv/tv_bloc.dart';

void main() {
  test('Cek if props same with the input', () {
    expect([], const FetchTvData().props);
    expect([1], const FetchTvDataWithId(1).props);
  });
}
