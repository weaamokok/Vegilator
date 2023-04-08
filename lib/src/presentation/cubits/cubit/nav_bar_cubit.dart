import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vegilator/src/utils/constants/enums.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarState(NavbarItem.dailyRecord, 0));
  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.dailyRecord:
        emit(NavBarState(NavbarItem.dailyRecord, 0));
        break;
      case NavbarItem.inventory:
        emit(NavBarState(NavbarItem.inventory, 1));
        break;
      case NavbarItem.expenses:
        emit(NavBarState(NavbarItem.expenses, 2));
        break;
      case NavbarItem.reports:
        emit(NavBarState(NavbarItem.reports, 3));
        break;
      case NavbarItem.profile:
        emit(NavBarState(NavbarItem.profile, 4));
        break;
    }
  }
}
