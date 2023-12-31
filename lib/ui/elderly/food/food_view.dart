import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/elderly/food/bloc/food_page/food_page_event.dart';
import 'package:health_application/ui/elderly/food/food_page.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/calories.dart';
import 'package:health_application/ui/elderly/food_detail/food_detail_page.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/food_filter_bloc.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/food_filter_state.dart';
import 'package:health_application/ui/elderly/food/bloc/food_page/food_page_bloc.dart';
import 'package:health_application/ui/elderly/food/bloc/food_page/food_page_state.dart';
import 'package:health_application/ui/elderly/food_log/food_log_page.dart';
import 'package:health_application/ui/elderly/food_search/bloc/food_search/food_search_bloc.dart';
import 'package:health_application/ui/elderly/food_search/bloc/food_search/food_search_event.dart';
import 'package:health_application/ui/elderly/food_filter/food_filter.dart';
import 'package:health_application/ui/elderly/food/views/list_section/list_section.dart';
import 'package:health_application/ui/elderly/food/views/meal_log/meal_log_widget.dart';
import 'package:health_application/ui/elderly/food/views/nutrition_list/nutriltion_list.dart';
import 'package:health_application/ui/elderly/food/views/search_box/search_box.dart';
import 'package:health_application/ui/elderly/food_search/food_search_page.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import '../../home_page/bloc/home_page_bloc.dart';

class FoodView extends StatefulWidget {
  const FoodView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onScrollEnd(ScrollController _scrollController) {
      if (_scrollController.offset < 64 && _scrollController.offset > 50) {
        Future.delayed(Duration.zero, () {
          _scrollController.animateTo(80,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        });
      } else if (_scrollController.offset < 50 &&
          _scrollController.offset > 0) {
        Future.delayed(Duration.zero, () {
          _scrollController.animateTo(0,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        });
      }
    }

    return Scaffold(
        appBar: appBar(
            onBack: () {
              context
                  .read<HomePageBloc>()
                  .add(ChangeMenu(menus: menuType.mainPage));
            },
            title: 'อาหาร'),
        body: MultiBlocListener(
            listeners: [
              BlocListener<FoodPageBloc, FoodPageState>(
                listener: (context, state) {},
              )
            ],
            child: BlocBuilder<FoodPageBloc, FoodPageState>(
              builder: (context, state) => Container(
                  padding: EdgeInsets.zero,
                  color: ColorTheme().white,
                  child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification) {
                          onScrollEnd(_scrollController);
                        }
                        return true;
                      },
                      child: ListView(
                        controller: _scrollController,
                        physics: BouncingScrollPhysics(),
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SearchBoxWidget(
                                  isEditable: false,
                                  hintText: 'ค้นหาอาหาร',
                                  onChanged: (value) {
                                    context.read<FoodSearchBloc>().add(
                                        FoodSearchTextFieldValueChanged(
                                            value: value));
                                  },
                                  onFilterButtonTapped: () {
                                    context
                                        .read<FoodSearchBloc>()
                                        .add(FoodSearchFilterButtonTapped());
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FoodFilterView(),
                                            fullscreenDialog: true));
                                  },
                                  onSearchBarTapped: () {
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: ((context, animation,
                                              secondaryAnimation) =>
                                          FoodSearchPage(
                                            onFoodSelected: (food) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          FoodDetailPage(
                                                              foodCode:
                                                                  food.code)));
                                            },
                                          )),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        animation = CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeInOut);
                                        return FadeTransition(
                                            opacity: animation, child: child);
                                      },
                                    ));
                                  },
                                ),
                                ListSection(
                                    sectionHeaderTitle:
                                        'วันนี้, ${DateTime.now().toDisplayFullBuddishDate(locale: 'th')}',
                                    children: [
                                      NutritionListWidget(
                                          nutrients: state.nutrients)
                                    ]),
                                ListSection(
                                    sectionHeaderTitle: "บันทึกมื้ออาหาร",
                                    children: state.meals
                                        .map<Widget>((meal) => MealLogWidget(
                                            meal: meal,
                                            summaryCalorie:
                                                state.summaryCalorie,
                                            onAddButtonTapped:
                                                (mealType) async {
                                              meal.foods
                                                  .map((food) => Food(
                                                      code: food.code,
                                                      name: food.name,
                                                      calories: Calories(
                                                          value: food.calorie),
                                                      energy:
                                                          Calories(value: 0)))
                                                  .toList();

                                              bool res = await Navigator.of(
                                                          context)
                                                      .push(MaterialPageRoute(
                                                          builder: (context) =>
                                                              FoodLogPage(
                                                                  mealType: meal
                                                                      .mealType),
                                                          settings: RouteSettings(
                                                              name:
                                                                  'FoodLogPage')))
                                                  as bool;

                                              if (res) {
                                                context.read<FoodPageBloc>().add(
                                                    FoodPageMealRecordFetched());
                                              }
                                            }))
                                        .toList()),
                                const SizedBox(
                                  height: 90,
                                )
                              ])
                        ],
                      ))),
            )));
  }
}
