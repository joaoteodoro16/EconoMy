part of '../home_page.dart';

class _HomeDateFilter extends StatefulWidget {
  final HomeController controller;
  const _HomeDateFilter({super.key, required this.controller});

  @override
  State<_HomeDateFilter> createState() => _HomeDateFilterState();
}

class _HomeDateFilterState extends State<_HomeDateFilter> {
  int selectedMonth = DateTime.now().month;
  String selectedYear = DateTime.now().year.toString();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 37,
        child: Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, right: 10, left: 10),
              decoration: BoxDecoration(
                  color: AppConfig.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<String>(
                elevation: 16,
                underline: Container(
                  height: 0,
                ),
                dropdownColor: AppConfig.primaryColor,
                value: selectedYear,
                icon: const Icon(Icons.arrow_right, size: 15,color: Colors.white,),
                onChanged: (value) {
                  setState(() {
                    selectedYear = value!;
                  });
                  widget.controller.setDateFilter(year: int.parse(selectedYear));
                },
                items: listYears.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                itemCount: listMonth.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          selectedMonth = index + 1;
                        });
                        widget.controller.setDateFilter(month: selectedMonth);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, right: 10, left: 10),
                        decoration: BoxDecoration(
                            color: selectedMonth == index + 1
                                ? AppConfig.secondaryColor
                                : AppConfig.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          listMonth[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
