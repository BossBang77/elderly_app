part of 'home_page_bloc.dart';

enum menuType {
  mainPage,
  foodPage,
  exercisePage,
  drinkingPage,
  profilePage,
  appointment,
  message
}

class HomePageState extends Equatable {
  const HomePageState(
      {this.menus = menuType.mainPage, this.role = '', this.loading = false});
  final menuType menus;
  final String role;
  final bool loading;

  HomePageState copyWith({menuType? menus, String? role, bool? loading}) {
    return HomePageState(
        menus: menus ?? this.menus,
        role: role ?? this.role,
        loading: loading ?? this.loading);
  }

  @override
  List<Object> get props => [menus, role, loading];
}

class HomePageInitial extends HomePageState {}
