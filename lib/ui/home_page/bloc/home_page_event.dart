part of 'home_page_bloc.dart';

class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class ChangeMenu extends HomePageEvent {
  final menuType menus;
  const ChangeMenu({required this.menus});
  @override
  List<Object> get props => [menus];
}

class Initstate extends HomePageEvent {
  const Initstate();
  @override
  List<Object> get props => [];
}

class TDEEDataFetched extends HomePageEvent {
  const TDEEDataFetched();

  @override
  List<Object> get props => [];
}

class ShowLoading extends HomePageEvent {
  const ShowLoading();
}

class HideLoading extends HomePageEvent {
  const HideLoading();
}
