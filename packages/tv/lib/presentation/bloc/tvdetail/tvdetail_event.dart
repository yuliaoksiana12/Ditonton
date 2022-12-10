part of 'tvdetail_bloc.dart';

abstract class TvDetailEvent extends Equatable {
  const TvDetailEvent();
}

class FetchTvDetailDataWithId extends TvDetailEvent {
  final int id;
  const FetchTvDetailDataWithId(this.id);

  @override
  List<Object> get props => [id];
}

class AddWatchlist extends TvDetailEvent {
  final TvDetail tvDetail;

  const AddWatchlist(this.tvDetail);

  @override
  List<Object> get props => [tvDetail];
}

class RemoveWatchlist extends TvDetailEvent {
  final TvDetail tvDetail;

  const RemoveWatchlist(this.tvDetail);

  @override
  List<Object> get props => [tvDetail];
}

class LoadWatchlistStatus extends TvDetailEvent {
  final int id;
  const LoadWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}
