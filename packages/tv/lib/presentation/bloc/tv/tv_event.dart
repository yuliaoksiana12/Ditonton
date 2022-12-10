part of 'tv_bloc.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();
}

class FetchTvData extends TvEvent {
  const FetchTvData();

  @override
  List<Object> get props => [];
}

class FetchTvDataWithId extends TvEvent {
  final int id;
  const FetchTvDataWithId(this.id);

  @override
  List<Object> get props => [id];
}
