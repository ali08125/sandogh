import 'package:flutter/material.dart';
import 'package:sandogh/constants/screens.dart';
import 'package:sandogh/theme.dart';
import 'package:sandogh/ui/widgets/search_field.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class CustomPage extends StatelessWidget {
  final List<dynamic> info;
  final List<String> headers;
  final String title;
  final String screen;
  final Function(String value) search;
  const CustomPage({
    super.key,
    required this.info,
    required this.title,
    required this.headers,
    required this.screen,
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style:
                        themeData.textTheme.titleMedium!.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          child: Row(
                            children: [
                              const Text('+'),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                'ایجاد حساب',
                                style: themeData.textTheme.labelMedium!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
            Container(
              height: 4,
              color: LightThemeColor.backGroundColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SearchField(
                search: search,
              ),
            ),
            Expanded(
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: DataTable(
                        showBottomBorder: true,
                        dividerThickness: 1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        headingRowColor:
                            const MaterialStatePropertyAll(Color(0xffF9F9FC)),
                        headingTextStyle: themeData.textTheme.bodyMedium,
                        columns: headers
                            .map((element) => DataColumn(label: Text(element)))
                            .toList(),
                        rows: info.map((element) {
                          switch (screen) {
                            case Screens.userScreen:
                              return DataRow(cells: [
                                DataCell(Text(element.phoneNumber)),
                                DataCell(Text(element.name)),
                                DataCell(Text(element.fatherName)),
                                DataCell(Text(element.amount.toString()))
                              ]);
                            case Screens.accountScreen:
                              return DataRow(cells: [
                                DataCell(
                                    Text(element.accountNumber.toString())),
                                DataCell(Text(element.name)),
                                DataCell(Text(element.owner.toString())),
                                DataCell(Text(element.amount.toString()))
                              ]);
                            case Screens.loanScreen:
                              final date = Gregorian(2002, 08, 23);
                              return DataRow(cells: [
                                DataCell(
                                    Text(element.accountNumber.toString())),
                                DataCell(Text(
                                    Jalali.fromGregorian(date).toString())),
                                DataCell(Text(element.debt.toString()))
                              ]);
                            default:
                              return const DataRow(cells: []);
                          }
                        }).toList(),
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
