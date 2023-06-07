import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/elderly/exercise/search_exercise/all_events.dart';
import 'package:health_application/ui/elderly/exercise/search_exercise/filter_event.dart';
import 'package:health_application/ui/elderly/exercise/search_exercise/recently_searched.dart';
import 'package:health_application/ui/home_page/home_page.dart';

import '../../../base/widget/text_field_widget.dart';
import '../../../ui-extensions/color.dart';

class SearchExerciseWidget extends StatelessWidget {
  const SearchExerciseWidget({super.key, required this.state});
  final ExerciseState state;

  @override
  Widget build(BuildContext context) {
    var search = state.searchEx;
    bool isFilter = checkIsFilter(search);
    return Scaffold(
      backgroundColor: color.whiteBackground,
      appBar: appBar(
          onBack: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomePage()),
                (Route<dynamic> route) => false);
          },
          title: 'ออกกำลังกาย',
          showNotification: false),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Flexible(
                  flex: 5,
                  child: TextFieldWidget.enable(
                    text: search.keyword,
                    maxLength: 100,
                    hintText: 'ค้นหาการออกกำลังกาย',
                    prefix: true,
                    imagePathPrefix: 'assets/images/search_icon.png',
                    onChanged: (value) {
                      context.read<ExerciseBloc>()
                        ..add(OnFilter(type: FilterType.keyWord, value: value));
                    },
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: () {
                      context.read<ExerciseBloc>()..add(SearchExercise());
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: InkWell(
                  onTap: () {
                    onFiter(context);
                  },
                  child: Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                        color: isFilter ? color.DartBlue : color.grey10,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                            color:
                                isFilter ? color.DartBlue : color.GreyBorder)),
                    child: Image.asset(
                      'assets/images/filter_icon.png',
                      scale: 4,
                      color: isFilter ? color.whiteBackground : null,
                    ),
                  ),
                ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            if (!isFilter)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecentlySearched(),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            AllEvent(context, state),
            const SizedBox(
              height: 100,
            ),
          ]),
        ),
      ),
    );
  }
}
