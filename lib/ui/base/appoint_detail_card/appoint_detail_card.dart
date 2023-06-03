import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/elderly/volunteer_appoint_summary/volunteer_appoint_summary_page.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AppointDetailCard extends StatelessWidget {
  const AppointDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => VolunteerAppointSummaryPage()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          width: sized.width,
          decoration: StyleBorder().blueDecoration(radius: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CircleAvatar(
                      backgroundImage: ExactAssetImage(
                          'assets/images/example_volunteer2.png',
                          scale: 4),
                      radius: 30,
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textSubtitle16Blod(
                            'นางบุญญาพร สุวรรณโชติ', ColorTheme().black87),
                        textH7('จิตอาสา (9045)', color.black87)
                      ],
                    ),
                  ),
                  Flexible(
                    child: Image.asset(
                      'assets/images/arrow.png',
                      color: color.BlueDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              textButton1(
                '${DateTime.now().toDisplayFullBuddishDate(locale: 'th')}',
                color.black87,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/appoint_time.png',
                        scale: 4,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      textButton1('08:00-12:00น.', ColorTheme().black87),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/appoint_waiting.png',
                        scale: 4,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      textButton1('รอการยืนยัน', ColorTheme().black87),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
