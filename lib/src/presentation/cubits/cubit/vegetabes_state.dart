part of 'vegetabes_cubit.dart';

abstract class VegetabesState extends Equatable {
  final List<Vegetable> vegetables;
  const VegetabesState({this.vegetables = const []});

  @override
  List<Object> get props => [vegetables];
}

class VegetablesLoading extends VegetabesState {
  const VegetablesLoading();
}

class VegetablesSuccess extends VegetabesState {
  const VegetablesSuccess({super.vegetables});
}
