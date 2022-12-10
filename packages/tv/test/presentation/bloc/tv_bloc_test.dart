import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/domain/usecases/get_now_playing_tv.dart';
import 'package:tv/presentation/bloc/tv/tv_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingTv])
void main() {
  late MockGetNowPlayingTv mockGetNowPlayingTv;
  late TvBloc tvBloc;

  setUp(
    () {
      mockGetNowPlayingTv = MockGetNowPlayingTv();
      tvBloc = TvBloc(mockGetNowPlayingTv);
    },
  );

  test('initial state should be empty', () {
    expect(tvBloc.state, EmptyData());
  });

  blocTest<TvBloc, TvState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetNowPlayingTv.execute())
          .thenAnswer((_) async => Right(testTvList));
      return tvBloc;
    },
    act: (bloc) => bloc.add(const FetchTvData()),
    expect: () => [
      LoadingData(),
      LoadedData(testTvList),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTv.execute());
    },
  );

  blocTest<TvBloc, TvState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetNowPlayingTv.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return tvBloc;
    },
    act: (bloc) => bloc.add(const FetchTvData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTv.execute());
    },
  );

  blocTest<TvBloc, TvState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetNowPlayingTv.execute()).thenAnswer(
          (_) async => const Left(ConnectionFailure('Connection Failure')));
      return tvBloc;
    },
    act: (bloc) => bloc.add(const FetchTvData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Connection Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTv.execute());
    },
  );

  blocTest<TvBloc, TvState>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetNowPlayingTv.execute()).thenAnswer(
          (_) async => const Left(DatabaseFailure('Database Failure')));
      return tvBloc;
    },
    act: (bloc) => bloc.add(const FetchTvData()),
    expect: () => [
      LoadingData(),
      const ErrorData('Database Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTv.execute());
    },
  );
}
