import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Basically, this abstracted generic-based class help us to determine whether our cubit is busy or not and also holds the data being processed. The “S” type represents the state of the cubit, and the “T” type represents the internal data that maybe used. This way, the cubit class will has less code and we can easily check if our cubit is currently running a process inside or not.
abstract class BaseCubit<S, T> extends Cubit<S> {
  BaseCubit(S initalState, this._data) : super(initalState);
  T _data;
  @protected
  T get data => _data;
  bool _isBusy = false;
  bool get isBusy => _isBusy;

  @protected
  Future<void> run(Future<void> Function() process) async {
    if (!_isBusy) {
      _isBusy = true;
      await process();
      _isBusy = false;
    }
  }
}
