import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiru/features/home/data/profile_data_repository.dart';
import 'package:kiru/features/home/models/user_profile_model.dart';

abstract class ProfileDataState {}

class ProfileDataStateLoading extends ProfileDataState {}

class ProfileDataStateLoaded extends ProfileDataState {
  final UserProfileModel user;

  ProfileDataStateLoaded({required this.user});
}

class ProfileDataStateError extends ProfileDataState {}

abstract class ProfileDataEvent {}

class ProfileDataFetchEvent extends ProfileDataEvent {}

class ProfileDataBloc extends Bloc<ProfileDataEvent, ProfileDataState> {
  final ProfileDataRepository profileDataRepository;
  ProfileDataBloc(this.profileDataRepository)
    : super(ProfileDataStateLoading()) {
    on<ProfileDataFetchEvent>(_onFetchData);
  }

  FutureOr<void> _onFetchData(
    ProfileDataFetchEvent event,
    Emitter<ProfileDataState> emit,
  ) async {
    final response = await profileDataRepository.fetchProfileData();

    emit(ProfileDataStateLoaded(user: response));
  }
}

// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kiru/features/home/data/profile_data_repository.dart';
// import 'package:kiru/features/home/models/user_profile_model.dart';

// abstract class ProfileDataEvent {}

// class ProfileDataFetchEvent extends ProfileDataEvent {}

// abstract class ProfileDataState {}

// class ProfileDataLoadedState extends ProfileDataState {
//   final UserProfileModel userData;

//   ProfileDataLoadedState(this.userData);
// }

// class ProfileDataLoadingState extends ProfileDataState {}

// class ProfileDataBloc extends Bloc<ProfileDataEvent, ProfileDataState> {
//   final ProfileDataRepository profileDataRepository;

//   ProfileDataBloc(this.profileDataRepository)
//     : super(ProfileDataLoadingState()) {
//     on<ProfileDataFetchEvent>(_onFetchData);
//   }

//   FutureOr<void> _onFetchData(
//     ProfileDataFetchEvent event,
//     Emitter<ProfileDataState> emit,
//   ) async {
//     final response = await profileDataRepository.fetchProfileData();
//     emit(ProfileDataLoadedState(response));
//   }
// }
