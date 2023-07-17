import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/rating_res_model.dart';

import '../../../../repository/elderly_appointment_repos.dart';

part 'user_review_event.dart';
part 'user_review_state.dart';

class UserReviewBloc extends Bloc<UserReviewEvent, UserReviewState> {
  ElderlyAppointmentRepository _elderlyAppointmentRepository =
      ElderlyAppointmentRepository();
  UserReviewBloc() : super(UserReviewInitial()) {
    on<UserReviewEvent>((event, emit) async {
      if (event is GetReview) {
        String profileId = await UserSecureStorage().getUID();
        print(profileId);
        var review =
            await _elderlyAppointmentRepository.searchReview(profileId);
        review.fold((err) {
          emit(state.copyWith(
              profileId: profileId,
              registerMol: RatingResModel(),
              isLoading: false));
        }, (res) {
          emit(state.copyWith(
              profileId: profileId, registerMol: res, isLoading: false));
        });
      }

      if (event is ReviewSort) {
        emit(state.copyWith(reviewSort: event.sort));
      }
    });
  }
}
