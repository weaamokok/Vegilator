part of 'nav_bar_cubit.dart';

class NavBarState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  NavBarState(this.navbarItem, this.index);

  @override
  List<Object> get props => [this.index, this.navbarItem];
}

// class NavBarInitial extends NavBarState {
//   NavBarInitial(super.navbarItem, super.index);
// }
