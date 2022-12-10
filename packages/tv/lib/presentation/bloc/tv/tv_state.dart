part of 'tv_bloc.dart';

abstract class TvState extends Equatable {
  const TvState();

  @override
  List<Object> get props => [];
}

class EmptyData extends TvState {}

class LoadingData extends TvState {}

class ErrorData extends TvState {
  final String message;

  const ErrorData(this.message);

  @override
  List<Object> get props => [message];
}

class LoadedData extends TvState {
  final List<Tv> result;

  const LoadedData(this.result);

  @override
  List<Object> get props => [result];
}
