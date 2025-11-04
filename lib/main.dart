import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',

      home: const MyHomePage(title: 'BMI Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String gender = "";
  int height = 150;
  int weight = 40;
  int age = 15;
  double bmi = 0;

  void info(){
    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("INFOS"),
              content: Text(
                "Gender: $gender\nHeight: $height cm\nWeight: $weight kg\nAge: $age years\n"
              )
          );
        }
    );
  }

  void _showBMI(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("BMI RESULT"),
          content: Text(bmi.toStringAsFixed(2), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
          actions: [
            TextButton(
              onPressed: () {
                info();
              },
              child: Text("INFOS"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            )
          ]
        );
      }
    );
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI APPLICATION"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 8,
        shadowColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: gender == "MALE" ? Colors.blue : Colors.grey,
                      ),
                      height: 150,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            gender = "MALE";
                          });
                        },
                        iconSize: 50,
                        color: Colors.white,
                        icon: Icon(Icons.male_outlined),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: gender == "FEMALE" ? Colors.pink : Colors.grey, // ← Couleur conditionnelle
                      ),
                      height: 150,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            gender = "FEMALE";
                          });
                        },
                        iconSize: 50,
                        color: Colors.white,
                        icon: Icon(Icons.female_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              height: 150,
              width: double.infinity,
              child: Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("HEIGHT", style: TextStyle(fontSize: 20)),
                      Text("${height.toStringAsFixed(0)}cm", style: TextStyle(fontSize: 20)),
                      Slider(
                        label: height.toString(),
                        onChanged: (value){
                          setState(() {
                            height = value.toInt();
                          });
                        },
                        value: height.toDouble(),
                        divisions: 300,
                        max: 300,
                      )
                    ]
                  ),
              )
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                          ),
                          height: 150,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.fitness_center_outlined, size: 20),
                                Text("WEIGHT", style: TextStyle(fontSize: 20)),
                                Text("${weight}KG", style: TextStyle(fontSize: 20)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    FloatingActionButton(onPressed: (){
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                      child: Icon(Icons.add),
                                    ),
                                    FloatingActionButton(onPressed: (){
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                      child: Icon(Icons.remove),
                                    )
                                  ]
                                )
                              ]
                          )
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue,
                            ),
                            height: 150,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.timeline, size: 20),
                                  Text("AGE", style: TextStyle(fontSize: 20)),
                                  Text("${age}YEARS", style: TextStyle(fontSize: 20)),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        FloatingActionButton(onPressed: (){
                                          setState(() {
                                            age++;
                                          });
                                        },
                                          child: Icon(Icons.add),
                                        ),
                                        FloatingActionButton(onPressed: (){
                                          setState(() {
                                            age--;
                                          });
                                        },
                                          child: Icon(Icons.remove),
                                        )
                                      ])
                                ]
                            )
                        )
                    )
                  ]
              ),
            ),
            ElevatedButton(
              onPressed: gender.isNotEmpty && weight > 0 && height > 0 ? (){
                setState(() {
                  bmi = weight / ((height / 100) * (height / 100));
                });
                _showBMI();
              }
              : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: gender == "FEMALE" ? Colors.pink : Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                textStyle: TextStyle(fontSize: 20),
                elevation: 5,
                shadowColor: Colors.black,
              ),
              child: Text("CALCULATE BMI"),
            )
          ],
        ),
      ),

    );
  }
}
