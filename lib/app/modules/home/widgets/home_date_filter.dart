part of '../home_page.dart';

class _HomeDateFilter extends StatefulWidget {
  
  const _HomeDateFilter({super.key});

  @override
  State<_HomeDateFilter> createState() => _HomeDateFilterState();
}

class _HomeDateFilterState extends State<_HomeDateFilter> {

  int selectedMonth = DateTime.now().month;

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
              child: const Text(
                '2023 >',
                style: TextStyle(color: Colors.white, fontSize: 15),
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
                      onTap: (){
                        setState(() {
                          selectedMonth = index  + 1;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, right: 10, left: 10),
                        decoration: BoxDecoration(
                            color: selectedMonth == index + 1 ? AppConfig.secondaryColor : AppConfig.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          listMonth[index],
                          style:
                              const TextStyle(color: Colors.white, fontSize: 15),
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
