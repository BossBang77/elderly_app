import 'package:flutter_bloc/flutter_bloc.dart';

class TokenExpiredCubit extends Cubit<bool> {
  TokenExpiredCubit({bool expired = false}) : super(expired);

  isExpired(bool expired) {
    emit(expired);
  }
}
