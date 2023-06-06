import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
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
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class FoodView extends StatefulWidget {
  const FoodView({Key? key}): super(key: key);
  
  @override
  State<StatefulWidget> createState()=> _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
  ScrollController _scrollController = ScrollController();

  @override void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onScrollEnd(ScrollController _scrollController) {
    print(_scrollController.offset < 50 && _scrollController.offset > 0);
    if (_scrollController.offset < 64 && _scrollController.offset > 50) {
      Future.delayed(Duration.zero, () {
        _scrollController.animateTo(80, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      });
    } else if (_scrollController.offset < 50 && _scrollController.offset > 0) {
      Future.delayed(Duration.zero, () {
        _scrollController.animateTo(0, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      });
    } 
  }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: ColorTheme().white,
        backgroundColor: ColorTheme().white,
        leading: BackButtonWidget(onClick: () {
          Navigator.pop(context, true);
        }),
        title: textSubtitle2('อาหาร', ColorTheme().black87, false),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<FoodPageBloc, FoodPageState>(
            listener: (context, state) {
            },
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
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                      SearchBoxWidget(
                        isEditable: false,
                        onChanged: (value) {
                          context.read<FoodSearchBloc>().add(FoodSearchTextFieldValueChanged(value: value));
                        },
                        onFilterButtonTapped: () {
                          context.read<FoodSearchBloc>().add(FoodSearchFilterButtonTapped());
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => FoodFilterView(), fullscreenDialog: true));
                        },
                        onSearchBarTapped: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: ((context, animation, secondaryAnimation) => FoodSearchPage(
                                onFoodSelected: (food) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder:(context) => FoodDetailPage(foodCode: food.code))
                                    // PageRouteBuilder(
                                    //   pageBuilder: ((context, animation, secondaryAnimation) => FoodDetailPage(foodCode: food.code)),
                                    //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    //     return CupertinoPageTransition(
                                    //       linearTransition: true,
                                    //       primaryRouteAnimation: animation,
                                    //       secondaryRouteAnimation: secondaryAnimation,
                                    //       child: child
                                    //     );
                                    //   }
                                    // )
                                  );
                                },
                              )),
                              // transitionDuration: Duration(milliseconds: 100),
                              transitionsBuilder:(context, animation, secondaryAnimation, child) {
                                animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
                                return FadeTransition(opacity: animation, child: child);
                                // return CupertinoPageTransition(
                                //   linearTransition: true,
                                //   primaryRouteAnimation: animation,
                                //   secondaryRouteAnimation: secondaryAnimation,
                                //   child: child
                                // );
                              },
                              // reverseTransitionDuration: Duration(milliseconds: 100)
                            )
                          );
                        },
                      ),
                      ListSection(
                        sectionHeaderTitle: "วันนี้, 17 ตุลาคม 2565",
                        children: [
                          NutritionListWidget(nutrients: state.nutrients)
                        ]),
                      ListSection(
                        sectionHeaderTitle: "บันทึกมื้ออาหาร",
                        children: state.meals.map<Widget>((meal) => 
                          MealLogWidget(
                            meal: meal, 
                            onAddButtonTapped: (mealType){
                              meal.foods.map((food) => Food(
                                code: food.code, 
                                name: food.name, 
                                calories: Calories(value: food.calorie), 
                                energy: Calories(value: 0)
                              )).toList();
                              Navigator.of(context).push(MaterialPageRoute(builder:(context) => 
                                FoodLogPage(mealType: meal.mealType),
                                settings: RouteSettings(name: 'FoodLogPage')
                              ));
                            })
                          ).toList()),
                    ]
                  )
                ],
              )
            )
          ),
        )
      )
    );
  }
}




                              