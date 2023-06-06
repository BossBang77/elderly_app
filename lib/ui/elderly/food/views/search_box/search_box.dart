import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

class SearchBoxWidget extends StatefulWidget {
  const SearchBoxWidget({
    Key? key, 
    this.controller,
    this.value = '',
    this.onChanged, 
    this.onFilterButtonTapped,
    this.onSearchBarTapped,
    this.onSubmit,
    this.isEditable = true,
    this.focusNode,
    this.shouldDisplayFilterButton = false,
    this.shouldHighLightFilterButton = false
  }): super(key: key);

  final TextEditingController? controller;
  final String value;
  final Function(String)? onChanged;
  final Function()? onFilterButtonTapped;
  final Function()? onSearchBarTapped;
  final Function(String)? onSubmit;
  final bool isEditable;
  final FocusNode? focusNode;
  final bool shouldDisplayFilterButton;
  final bool shouldHighLightFilterButton;

  @override
  State<StatefulWidget> createState() => _SearchBoxWidgetState();
}

class _SearchBoxWidgetState extends State<SearchBoxWidget> {
  bool _hasText = false;
  bool _hasFocus = false;

  bool _shouldDisplayFilterButton(
    bool hasText,
    bool hasFocus
  ) {
    return hasText || hasFocus;
  }

  @override 
  Widget build(BuildContext context) {
    final double padding = 32;
    final double filterButtonSpace = 64;
    final double expandedWidth = MediaQuery.of(context).size.width - padding;
    final double hideWidth = expandedWidth - filterButtonSpace;

    return Container(
      color: ColorTheme().white,
      padding: EdgeInsets.all(16),
      height: 80,
      child: OverflowBox(
        alignment: Alignment.centerLeft,
        maxWidth: double.infinity,
        child: IntrinsicHeight(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastLinearToSlowEaseIn,
                height: 48,
                width: _shouldDisplayFilterButton(_hasText, _hasFocus) ? hideWidth : expandedWidth,
                child: Focus(
                    onFocusChange: (hasFocus) {
                      if (!widget.isEditable) { return; }
                      setState(() {
                        _hasFocus = true;
                      });
                    },
                    child: GestureDetector(
                      onTap: () {
                        widget.onSearchBarTapped?.call();
                      },
                      child: TextField(
                        controller: widget.controller,
                        focusNode: widget.focusNode,
                        enabled: widget.isEditable,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: ColorTheme().GreyBackGround)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: ColorTheme().GreyBackGround)
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: ColorTheme().GreyBackGround)
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12),
                            child: Image.asset('assets/images/search_icon.png')
                          )
                        ),
                        onChanged: (value) {
                          if (!widget.isEditable) { return; }
                          _hasText = !value.isEmpty;
                          widget.onChanged?.call(value);
                        },
                        onSubmitted: (value) {
                          widget.onSubmit?.call(value);
                        },
                      ),
                    )
                  )
              ),

              SizedBox(width: 16),

              SizedBox(
                width: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: widget.shouldHighLightFilterButton ? ColorTheme().blueText : ColorTheme().white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(color: ColorTheme().GreyBackGround),
                  ),
                  onPressed: () { widget.onFilterButtonTapped?.call(); }, 
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      widget.shouldHighLightFilterButton ? 'assets/images/filter_icon_white.png' : 'assets/images/filter_icon.png', 
                      width: 24, 
                      height: 24, 
                      fit: BoxFit.cover
                    ),
                  )
                  
                )
              )
            ],
          ),
        )
      )
      
    );
  }
}