import 'package:flutter/material.dart';
import 'package:quiz_app/utils/database/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int value = 0;
  int? checkvalue;

  void counter() {
    value = value + 1;
    setState(() {});
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(child: Text("${value + 1}/${DataBase.quizdata.length}")),
            SizedBox(
              height: 20,
            ),
            Text(DataBase.quizdata[value]["question"]),
            SizedBox(
              height: 30,
            ),
            ListView.separated(
              itemCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  checkvalue = index;
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  color: checkvalue == index
                      ? checkvalue == DataBase.quizdata[value]['answer']
                          ? Colors.green
                          : Colors.red
                      : Colors.amber,
                  child: Center(
                    child: Text(DataBase.quizdata[value]['options'][index]),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
            ),
            Text(value.toString()),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                counter();
                checkvalue = 5;
                setState(() {});
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
