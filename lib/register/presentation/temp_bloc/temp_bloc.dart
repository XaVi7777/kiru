import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TempState {
  
}

class TempStateData extends TempState {
  final int count;
  final String? lastAction;
  TempStateData({required this.count, required this.lastAction});
}

abstract class TempEvent{}

class TempStateIncrement extends TempEvent{}
class TempStateDecrement extends TempEvent{}
class TempStateClear extends TempEvent{}

class TempBloc  extends Bloc<TempEvent, TempState>{
  TempBloc(): super(TempStateData(count: 0, lastAction: null));
}