import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/food_filter_bloc.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/food_filter_event.dart';
import 'package:health_application/ui/elderly/food_search/bloc/food_search/food_search_bloc.dart';
import 'package:health_application/ui/elderly/food_search/bloc/food_search/food_search_event.dart';
import 'package:health_application/ui/elderly/food_search/bloc/food_search/food_search_state.dart';
import 'package:health_application/ui/elderly/food_filter/food_filter.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/calories.dart';
import 'package:health_application/ui/elderly/food/views/list_section/list_section.dart';
import 'package:health_application/ui/elderly/food/views/search_box/search_box.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_search_item.dart';
import 'package:health_application/ui/elderly/food_search/view/search_result_view.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class FoodSearchView extends StatefulWidget {
  const FoodSearchView(
      {this.onFoodSelected,
      this.onItemTrailingIconTap,
      this.isToggleItemSelectable = false});

  final Function(FoodSearchItem)? onFoodSelected;
  final Function(FoodSearchItem)? onItemTrailingIconTap;
  final bool isToggleItemSelectable;

  @override
  State<StatefulWidget> createState() => _FoodSearchViewState();
}

class _FoodSearchViewState extends State<FoodSearchView> {
  final FocusNode _focusNode = FocusNode();
  final _searchTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _focusNode.requestFocus();

    return Scaffold(
        appBar: appBar(
            onBack: () {
              Navigator.pop(context, true);
            },
            title: 'อาหาร'),
        body: MultiBlocListener(
            listeners: [
              BlocListener<FoodSearchBloc, FoodSearchState>(
                listenWhen: (previous, current) =>
                    previous.searchValue != current.searchValue,
                listener: (context, state) {
                  print(state);
                },
              ),
            ],
            child: BlocBuilder<FoodSearchBloc, FoodSearchState>(
              builder: ((context, state) => Container(
                  color: ColorTheme().white,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      SearchBoxWidget(
                        shouldHighLightFilterButton:
                            state.searchFilter.isNotEmpty,
                        controller: _searchTextController,
                        focusNode: _focusNode,
                        hintText: 'ค้นหาอาหาร',
                        onChanged: (value) {
                          context.read<FoodSearchBloc>().add(
                              FoodSearchTextFieldValueChanged(value: value));
                        },
                        onFilterButtonTapped: () {
                          context
                              .read<FoodSearchBloc>()
                              .add(FoodSearchFilterButtonTapped());
                          context
                              .read<FoodFilterBloc>()
                              .add(FoodFilterSnapshotCreated());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => BlocProvider.value(
                                  value:
                                      BlocProvider.of<FoodFilterBloc>(context),
                                  child: FoodFilterView(
                                    isToggleItemSelectable:
                                        widget.isToggleItemSelectable,
                                    onFilterApplied: () {
                                      Map<String, dynamic> filter =
                                          BlocProvider.of<FoodFilterBloc>(
                                                  context)
                                              .state
                                              .getMappedFilter();
                                      context.read<FoodSearchBloc>().add(
                                          FoodSearchFilterApplied(
                                              filter: filter));
                                      context.read<FoodSearchBloc>().add(
                                          FoodSearchSubmitted(
                                              value: state.searchValue));
                                    },
                                  )),
                              fullscreenDialog: true));
                        },
                        onSearchBarTapped: () {},
                        onSubmit: (value) {
                          context
                              .read<FoodSearchBloc>()
                              .add(FoodSearchSubmitted(value: value));
                        },
                      ),
                      state.searchValue.isEmpty
                          ? ListSection(
                              sectionHeaderTitle: 'รายการที่ค้นหาล่าสุด',
                              children: [
                                state.recentSearchValues.isEmpty
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 80,
                                        child: Center(
                                            child: textSubtitle1(
                                                'ไม่พบรายการค้นหาล่าสุด',
                                                ColorTheme().grey50)),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Wrap(
                                          spacing: 8,
                                          children: state.recentSearchValues
                                              .map((value) => GestureDetector(
                                                    onTap: () {
                                                      context
                                                          .read<
                                                              FoodSearchBloc>()
                                                          .add(
                                                              FoodSearchRecentSearchSelected(
                                                                  value:
                                                                      value));
                                                      _searchTextController
                                                          .text = value;
                                                      _searchTextController
                                                              .selection =
                                                          TextSelection.collapsed(
                                                              offset:
                                                                  _searchTextController
                                                                      .text
                                                                      .length);
                                                    },
                                                    child: Chip(
                                                        backgroundColor:
                                                            ColorTheme()
                                                                .GreyBorder,
                                                        label: textSubtitle2(
                                                            value,
                                                            ColorTheme()
                                                                .blueText,
                                                            false)),
                                                  ))
                                              .toList(),
                                        ))
                              ],
                            )
                          : SizedBox(),
                      ListSection(
                          sectionHeaderTitle: 'รายการอาหารทั้งหมด',
                          children: state.searchResults
                              .map((result) => FoodListItemView(
                                    image: result.image,
                                    name: result.name,
                                    calories: Calories(value: result.calorie),
                                    onTap: () {
                                      widget.onFoodSelected?.call(result);
                                    },
                                    onTrailingIconTap: () {
                                      widget.onItemTrailingIconTap
                                          ?.call(result);
                                    },
                                  ))
                              .toList())
                    ],
                  ))),
            )));
  }
}
