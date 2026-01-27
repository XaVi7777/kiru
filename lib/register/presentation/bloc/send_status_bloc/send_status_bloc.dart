import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SendStatusEvent {}

class SendStatusPressedEvent extends SendStatusEvent {}

abstract class SendStatusState {}

class SendStatusStateDisabled extends SendStatusState {}

class SendStatusStateLoading extends SendStatusState {}

class SendStatusStateError extends SendStatusState {}

class SendStatusStateSuccess extends SendStatusState {}

class SendStatusBloc extends Bloc<SendStatusEvent, SendStatusState> {
  SendStatusBloc() : super(SendStatusStateDisabled()) {
    on<SendStatusPressedEvent>((event, emit) async {
      emit(SendStatusStateLoading());
      try {
        final response = await _fetchData();
        if (response) {
          emit(SendStatusStateSuccess());
        }
      } catch (e) {
        emit(SendStatusStateError());
      }
    });
  }

  Future<bool> _fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}
