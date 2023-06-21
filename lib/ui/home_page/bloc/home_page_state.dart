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
      {this.menus = menuType.mainPage, this.role = '', this.loading = false, this.tdeeModel = const TDEEModel()});
  final menuType menus;
  final String role;
  final bool loading;
  final TDEEModel tdeeModel;

  HomePageState copyWith({menuType? menus, String? role, bool? loading, TDEEModel? tdeeModel}) {
    return HomePageState(
        menus: menus ?? this.menus,
        role: role ?? this.role,
        loading: loading ?? this.loading,
        tdeeModel: tdeeModel ?? this.tdeeModel
        );
  }

  @override
  List<Object> get props => [menus, role, loading, tdeeModel];
}

class HomePageInitial extends HomePageState {}
