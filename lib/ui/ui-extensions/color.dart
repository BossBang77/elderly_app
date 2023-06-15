import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

var color = ColorTheme();

class ColorTheme {
  final Color Primary = HexColor("#479DC5").withOpacity(1.0);
  final Color PrimaryVariant = HexColor("#394EBA").withOpacity(1.0);
  final Color Secondary = HexColor("#385BB1").withOpacity(0.9);
  final Color SecondaryVariant = HexColor("#2C4784").withOpacity(1.0);
  final Color Background1 = HexColor("#FFFFFF").withOpacity(1.0);
  final Color Background2 = HexColor("#F8F8F8").withOpacity(1.0);
  final Color Background3 = HexColor("#FFFFFF").withOpacity(1.0);
  final Color Surface = HexColor("#FFFFFF").withOpacity(1.0);
  final Color Error = HexColor("#FF4040").withOpacity(1.0);
  final Color OnBackground1 = HexColor("#C3C3C3").withOpacity(1.0);
  final Color OnBackground2 = HexColor("#0D1B3D").withOpacity(1.0);
  final Color OnBackground3 = HexColor("#E8E8E8").withOpacity(1.0);
  final Color Background4 = HexColor("#FFE3F4").withOpacity(1.0);
  final Color Background5 = HexColor("#FFFFFF").withOpacity(0.2);
  final Color Background6 = HexColor("#FFFFFF").withOpacity(0);
  final Color OnPrimary = HexColor("#FFFFFF").withOpacity(1.0);
  final Color Complete = HexColor("#01D116").withOpacity(1.0);
  final Color Warning = HexColor("#FF4040").withOpacity(1.0);
  final Color ButtonBackground1 = HexColor("#E5F1FF").withOpacity(1.0);

  final Color BlueDark = HexColor("#437ECB");
  final Color Blue = HexColor("#4AB4C0");
  final Color Blue2 = HexColor("#4F80E2");

  final Color BlueBackGround = HexColor("#4797C6").withOpacity(0.1);
  final Color GreyBackGround = HexColor("#343434").withOpacity(0.1);
  final Color GreyBorder = HexColor("#343434").withOpacity(0.04);

  final Color BlueFade = HexColor("#4797C6").withOpacity(1.0);
  final Color black87 = Colors.black87;
  final Color white = Colors.white;
  final Color whiteBackground = HexColor("#FCFCFC").withOpacity(1.0);
  final Color grey50 = Colors.grey.withOpacity(0.5);
  final Color grey10 = Colors.grey.withOpacity(0.1);

  final Color greybackground5 = HexColor("#343434").withOpacity(0.05);
  final Color blueText = HexColor("#0267D0");
  final Color BlueFade2 = HexColor('#0C81E4');
  final Color BackgroundWhite = HexColor('#FCFCFC');
  final Color BlueDark2 = HexColor('#3E54D3');
  final Color Orange1 = HexColor('#F8763E');

  final Color greyText = Colors.grey.withOpacity(0.7);
  final Color DartBlue = HexColor('#0267D0');
  final Color DarkRed = HexColor('#C84032');
  final Color scaffoldGreyBackground = HexColor('#F5F5F5');
  final Color lightBlue = HexColor('#F3F7F9');
  final Color emergency = HexColor('#E9605B');
}

class StyleBorder {
  BoxDecoration greyDecoration({double radius = 20, bool isBorder = true}) {
    return BoxDecoration(
        color: color.grey10.withOpacity(0.05),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: isBorder ? Border.all(color: color.GreyBorder) : null);
  }

  BoxDecoration blueDecoration({double radius = 20}) {
    return BoxDecoration(
        color: color.blueText.withOpacity(0.12),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: Border.all(color: color.blueText));
  }

  BoxDecoration buttomSheet({double radius = 20}) {
    return BoxDecoration(
      color: color.whiteBackground,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }
}
