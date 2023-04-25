import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegilator/src/presentation/views/profile_view.dart';
import 'package:vegilator/src/presentation/views/reports_view.dart';
import 'package:vegilator/src/utils/constants/colors.dart';
import 'package:vegilator/src/utils/constants/enums.dart';
import '../cubits/cubit/nav_bar_cubit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'daily_record.dart';
import 'expenses_view.dart';
import 'inventory/inventory_view.dart';

@RoutePage()
class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,backgroundColor: Colors.white,
      body: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.dailyRecord) {
            return DailyRecord();
          } else if (state.navbarItem == NavbarItem.inventory) {
            return Inventory();
          } else if (state.navbarItem == NavbarItem.expenses) {
            return Expenses();
          } else if (state.navbarItem == NavbarItem.reports) {
            return Reports();
          } else if (state.navbarItem == NavbarItem.profile) {
            return profile();
          }
          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return Container(
            height: 80,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Black.withOpacity(.2),
                  offset: Offset(10, 10),
                  blurRadius: 18)
            ]),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              backgroundColor: Color(0xff57BA4F),
              elevation: 20,
              selectedItemColor: PrimaryGreen,
              unselectedItemColor: PrimaryGreen.withOpacity(.5),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(MdiIcons.bookOpenPageVariant),
                    label: 'السجل اليومي'),
                BottomNavigationBarItem(
                    icon: Icon(MdiIcons.carrot), label: 'المخزن'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.payments), label: 'المصروفات'),
                BottomNavigationBarItem(
                    icon: Icon(MdiIcons.fileDocument), label: 'التقارير'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'الملف الشخصي'),
              ],
              currentIndex: state.index,
              showUnselectedLabels: false,
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavBarCubit>(context)
                      .getNavBarItem(NavbarItem.dailyRecord);
                } else if (index == 1) {
                  BlocProvider.of<NavBarCubit>(context)
                      .getNavBarItem(NavbarItem.inventory);
                } else if (index == 2) {
                  BlocProvider.of<NavBarCubit>(context)
                      .getNavBarItem(NavbarItem.expenses);
                } else if (index == 3) {
                  BlocProvider.of<NavBarCubit>(context)
                      .getNavBarItem(NavbarItem.reports);
                } else if (index == 4) {
                  BlocProvider.of<NavBarCubit>(context)
                      .getNavBarItem(NavbarItem.profile);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
