import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../base/user_secure_storage.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {}
  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is ChangeMenu) {
      yield state.copyWith(menus: event.menus);
    }
    if (event is Initstate) {
      yield state.copyWith(loading: true);
      String role = await getRole();
      yield state.copyWith(role: role, loading: false);
    }
  }

  Future<String> getRole() async {
    var roleList = await UserSecureStorage().getRole();
    return roleList[0].role;
  }
}
