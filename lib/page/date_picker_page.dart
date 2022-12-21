import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:age_calculator/utils.dart';
import 'package:age_calculator/widget/Button_widget.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:age_calculator/ad_service.dart';
import 'package:url_launcher/url_launcher.dart';

class DatePickerPage extends StatefulWidget {
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  var format = NumberFormat.currency(
    locale: "HI",
    symbol: "",
    decimalDigits: 0,
  );

  DateTime dateTime = DateTime.now();
  int days1 = 0;
  int month1 = 0;
  int year1 = 0;
  int age_in_months = 12;
  int age_in_days = 365;
  int month_in_days = 30;
  int age_in_hours = 24;
  int age_in_minutes = 60;
  int age_in_seconds = 60;
  double oxygen = 2.0273;
  int oxygen_released_by_trees = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SafeArea(
      child: Column(
        children: [
          ButtonWidget(
              onClicked: () => Utils.showSheet(
                    context,
                    child: buildDatePicker(),
                    onClicked: () {
                      final value = DateFormat('dd/MM/yyyy').format(dateTime);

                      Navigator.pop(context);
                    },
                  )),
          SizedBox(
            width: 10,
            height: 10,
          ),
          Text(
              year1.toString() +
                  " Years  " +
                  month1.toString() +
                  " Months  " +
                  days1.toString() +
                  " Days",
              style: TextStyle(fontSize: 20)),
          SizedBox(
            width: 10,
            height: 10,
          ),
          Center(
            child: Row(
              children: <Widget>[
                Text(
                  "  Your age in Months: ",
                  style: TextStyle(fontSize: 15),
                ),
                Container(
                  width: 182,
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      (format
                          .format((year1 * age_in_months + month1))
                          .toString()),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Text(
                  "  Your age in Days: ",
                  style: TextStyle(fontSize: 15),
                ),
                Container(
                  width: 193,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      (format
                          .format(((year1 * age_in_days) +
                              (month1 * month_in_days) +
                              days1))
                          .toString()),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Text(
                  "  Your age in hours: ",
                  style: TextStyle(fontSize: 15),
                ),
                Container(
                  width: 197,
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      (format
                          .format((((year1 * age_in_days) +
                                  (month1 * month_in_days) +
                                  days1) *
                              age_in_hours))
                          .toString()),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Text(
                  "  Your age in minutes: ",
                  style: TextStyle(fontSize: 15),
                ),
                Container(
                  width: 169,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ((format.format((((year1 * age_in_days) +
                                      (month1 * month_in_days) +
                                      days1) *
                                  age_in_hours) *
                              age_in_minutes))
                          .toString()),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Text(
                  "  Your age in seconds: ",
                  style: TextStyle(fontSize: 15),
                ),
                Container(
                  width: 176,
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      (((format.format(((((year1 * age_in_days) +
                                          (month1 * month_in_days) +
                                          days1) *
                                      age_in_hours) *
                                  age_in_minutes) *
                              age_in_seconds))
                          .toString())),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Text(
                  "  Total oxygen consumed (kg)*: ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Container(
                  width: 106,
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ((format.format(oxygen *
                              ((year1 * age_in_days) +
                                  (month1 * month_in_days) +
                                  days1)))
                          .toString()),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "  * Based on info from ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                        text: "https://bit.ly/2TyfVem",
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url = "https://bit.ly/2TyfVem";
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw "Cannot Load Link";
                            }
                          }),
                  ]),
                ),
                SizedBox(
                  width: 10,
                  height: 20,
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Did You know?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "You need 8 trees for your personal oxygen needs. Have you planted them?",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )));
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 1900,
          maximumYear: 2050,
          initialDateTime: dateTime,
          maximumDate: DateTime.now(),
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (_dateTime) => setState(() {
            this.dateTime = _dateTime;
            int day = finddays(DateTime.now().month, DateTime.now().year);
            int m1 = DateTime.now().month;
            int y1 = DateTime.now().year;
            int m = dateTime.month;

            if (DateTime.now().day - dateTime.day >= 0)
              days1 = (DateTime.now().day - dateTime.day);
            else {
              days1 = (DateTime.now().day + day - dateTime.day);
              m1 = DateTime.now().month - 1;
            }

            if (m1 - dateTime.month >= 0)
              month1 = (m1 - dateTime.month);
            else {
              month1 = (m1 + 12 - dateTime.month);
              y1 = DateTime.now().year - 1;
            }

            year1 = (y1 - dateTime.year);
          }),
        ),
      );

  int finddays(int m2, int y2) {
    int day2;
    if (m2 == 1 ||
        m2 == 3 ||
        m2 == 5 ||
        m2 == 7 ||
        m2 == 8 ||
        m2 == 10 ||
        m2 == 12)
      day2 = 31;
    else if (m2 == 4 || m2 == 6 || m2 == 9 || m2 == 11)
      day2 = 30;
    else {
      if (y2 % 4 == 0)
        day2 = 29;
      else {
        day2 = 28;
      }
    }
    return day2;
  }
}
