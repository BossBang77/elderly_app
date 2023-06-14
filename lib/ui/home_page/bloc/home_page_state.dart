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
  const HomePageState({this.menus = menuType.mainPage});
  final menuType menus;

  HomePageState copyWith({
    menuType? menus,
  }) {
    return HomePageState(menus: menus ?? this.menus);
  }

  @override
  List<Object> get props => [menus];
}

class HomePageInitial extends HomePageState {}
