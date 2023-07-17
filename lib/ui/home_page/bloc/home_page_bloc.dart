import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/ui/home_page/model/tdee_model.dart';
import 'package:health_application/ui/home_page/model/tdee_response.dart';
import 'package:health_application/ui/home_page/repository/tdee_repository.dart';

import '../../base/user_secure_storage.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc(TDEERepositoryProtocol tdeeRepository)
      : _tdeeRepository = tdeeRepository,
        super(HomePageInitial()) {}

  final TDEERepositoryProtocol _tdeeRepository;

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is ChangeMenu) {
      if (event.menus == menuType.mainPage) {
        add(TDEEDataFetched());
      }
      yield state.copyWith(menus: event.menus);
    }
    if (event is Initstate) {
      yield state.copyWith(loading: true, role: '');
      add(TDEEDataFetched());
      String role = await getRole();
      yield state.copyWith(role: role, loading: false);
    }
    if (event is TDEEDataFetched) {
      final response = await _tdeeRepository.getTdee();
      yield* response.fold((error) async* {
        yield state.copyWith(tdeeModel: TDEEModel());
      }, (response) async* {
        yield state.copyWith(tdeeModel: response.data);
      });
    }
    if (event is ShowLoading) {
      yield state.copyWith(loading: true);
    }

    if (event is HideLoading) {
      yield state.copyWith(loading: false);
    }
  }

  Future<String> getRole() async {
    var roleList = await UserSecureStorage().getRole();
    return roleList[0].role;
  }
}
