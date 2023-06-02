import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:health_application/ui/elderly/food_search/view/search_result_view.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class FoodSearchView extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=> _FoodSearchViewState();
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
      appBar: AppBar(
        elevation: 0,
        shadowColor: ColorTheme().white,
        backgroundColor: ColorTheme().white,
        leading: BackButtonWidget(onClick: () {
          Navigator.pop(context, true);
        }),
        actions: [],
        title: textSubtitle2('อาหาร', ColorTheme().black87, false),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<FoodSearchBloc, FoodSearchState>(
            listenWhen: (previous, current) => previous.searchValue != current.searchValue,
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
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                SearchBoxWidget(
                  shouldHighLightFilterButton: state.searchFilter.isNotEmpty ,
                  controller: _searchTextController,
                  focusNode: _focusNode,
                  onChanged: (value) {
                    context.read<FoodSearchBloc>().add(FoodSearchTextFieldValueChanged(value: value));
                  },
                  onFilterButtonTapped: () {
                    context.read<FoodSearchBloc>().add(FoodSearchFilterButtonTapped());
                    context.read<FoodFilterBloc>().add(FoodFilterSnapshotCreated());
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (c) => 
                      BlocProvider.value(
                        value: BlocProvider.of<FoodFilterBloc>(context),
                        child: FoodFilterView(
                          onFilterApplied: () {
                            Map<String, dynamic> filter = BlocProvider.of<FoodFilterBloc>(context).state.getMappedFilter();
                            context.read<FoodSearchBloc>().add(FoodSearchFilterApplied(filter: filter));
                          },
                        )
                      ), 
                      fullscreenDialog: true
                    ));
                  },
                  onSearchBarTapped: () {
                  },
                  onSubmit: (value) {
                    context.read<FoodSearchBloc>().add(FoodSearchSubmitted(value: value));
                  },
                ),

                state.searchValue.isEmpty ?
                ListSection(
                  sectionHeaderTitle: 'รายการที่ค้นหาล่าสุด',
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Wrap(
                        spacing: 8,
                        children: state.recentSearchValues.map((value) => 
                          GestureDetector(
                            onTap: () {
                              context.read<FoodSearchBloc>().add(FoodSearchRecentSearchSelected(value: value));
                              _searchTextController.text = value;
                              _searchTextController.selection = TextSelection.collapsed(offset: _searchTextController.text.length);
                            },
                            child: Chip(
                              backgroundColor: ColorTheme().GreyBorder,
                              label:  textSubtitle2(value, ColorTheme().blueText, false)),
                          )
                        ).toList(),
                      )
                    )
                  ],
                ) : SizedBox(),

                ListSection(
                  sectionHeaderTitle: 'รายการอาหารทั้งหมด',
                  children: [
                    //TODO: Display real search item list
                    SearchResultItemView(
                      food: Food(
                        name: 'SDPFISJPDIFS',
                        categories: [],
                        calories: Calories(value: 375.8),
                        nutrients: [],
                        durationMin: '',
                        durationMax: '',
                        description: 'description',
                        ingredients: [],
                        methods: []
                      ),
                    )
                  ],
                )
              ],
            )
          )),
        )
      )
    );
  }
}