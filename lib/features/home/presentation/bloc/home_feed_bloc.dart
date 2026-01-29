import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiru/features/home/data/feed_data_repository.dart';
import 'package:kiru/features/home/models/app_image.dart';

abstract class HomeFeedEvent {}

class HomeFeedFetchDateEvent extends HomeFeedEvent {}

abstract class HomeFeedState {}

class HomeFeedLoadingState extends HomeFeedState {}

class HomeFeedLoadedState extends HomeFeedState {
  final List<AppImageModel> images;

  HomeFeedLoadedState({required this.images});
  
}


class HomeFeedBloc extends Bloc<HomeFeedEvent, HomeFeedState> {
  final FeedDataRepository feedDataRepository;
  HomeFeedBloc(
    this.feedDataRepository,
  ) : super(HomeFeedLoadingState()) {
    on<HomeFeedFetchDateEvent>(_onFetchData);
  }

  FutureOr<void> _onFetchData(
    HomeFeedFetchDateEvent event,
    Emitter<HomeFeedState> emit,
  ) async {
    final response = await feedDataRepository.fetchData();
    print(response);
    emit(HomeFeedLoadedState(images: response));
  }
}
