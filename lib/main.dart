import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Map<String, String> apps = {
    "acpm": "application configuration",
    "albl": "assembly line balancing",
    "alds": "assembly line and lean design",
    "alpt": "assembly line portal",
    "andb": "andon board performance visualization",
    "aopt": "aerospace operations portal",
    "arch": "archive management",
    "asql": "database administraion",
    "bode": "business relationship profiles",
    "ccmx": "change over component matrix",
    "cmmx": "component matrix",
    "cmod": "cmo dashboard",
    "comg": "constraint management",
    "cpmg": " container and packaging management",
    "ctb": "customizing tables",
    "ddict": "data dictionary",
    "defd": "definition dictionary",
    "ecnd ": "ecn dashboard",
    "ect": "data management E-cell",
    "fimg": "task definition",
    "fira": "fast issue reporting application",
    "fmdb": "production and fabrication operations portal",
    "fscd": "scheduling and model mix sequencing",
    "fwpl ": "flexible workspace planning",
    "glpr": "global preferences",
    "gpmg": "global preferences management",
    "himg": "hierarchy management",
    "ippt": "standartisiertes presentation desing",
    "ipqm": "quality inspection portal",
    "irmg": "action & responsibility management",
    "ispc": "statiscal process control",
    "lamg ": "location access management",
    "lcmg": "license management",
    "maps": " machine position support",
    "mapt": "value stream & operations portal",
    "masm": "multiple assignament management",
    "mdcr": "mass data creation",
    "mdmg": "mass data management",
    "mept": "equipment and machine portal",
    "mhvp": "mobile high volume manufacturing portal",
    "miag": "multiple image assignament",
    "mlvsc": "manufacturing action management",
    "msvn": "supply synchronization",
    "mtmg": "quality & metrics profile management",
    "mtpl": "maintenance planning portal",
    "mtpt": "maintenance portal equipment & machines",
    "papl ": "personnel availability planing",
    "pbtr": " bin and packaging management",
    "pcmg": "process change management",
    "pdgm": "demand capacity monitoring",
    "pedc": "shift performance dashboard",
    "pimg": "personnel issue management",
    "pkbm": " supply kanban board",
    "pllm": "early warning portal line logistics",
    "pmim": "early warning portal machine & equipment",
    "pmqm": "product & process traceability portal",
    "potr": "order completeness & certificate management",
    "pped": "plant performance dashboard",
    "prmg": "personnel & responsibility management",
    "prmp": "process matrix",
    "prpt": "purchase request portal",
    "psim": "technology process control",
    "pstm": "early warning portal system & technology",
    "pswm": "organizational structure management",
    "ptqm": "tqm manufacturing operations",
    "pwim": "early warning portal operations",
    "qfmg ": "qualification management",
    "qfmx": " qualification matrix",
    "qlmg": "qualification level management",
    "rcpt": "receipt management",
    "rmap": "return merchandise portal",
    "rpdb": "report dashboard / key performance indicators",
    "rpmg": "repair management",
    "rwmg": "rework management",
    "rwpdb": "web value stream report dashboard",
    "rwpt": "rework portal",
    "sanb": " supply andon board",
    "scdl": "manufacturing order scheduling",
    "scmg": " supply cycle and kanban /jit management",
    "scmx": "change over process matrix",
    "semg ": "supply equipment management",
    "sgmg": "smart gui management",
    "soed": "process and sequence of event design",
    "sptm": "suppy point portal",
    "task": "issue and event portal",
    "temx": "technology matrix",
    "tgid": "label printing",
    "tqcm": "total quality management reports",
    "trmg": "translation management",
    "tspl": "application & implementation test planning",
    "ttmx": "tact time matrix",
    "vcpt": "material portal",
    "vfpt": "complex manufacturing / visual factory portal",
    "wprmg": "web personnel & responsibility management",
    "wspt": "workstation portal",
    "wtask": "web issue and events portal",
    "wtmg": "work time management",
    "xchg": "data exchange",
  };

  String _word = "";
  int random = 0;
  var arr = ["", "", ""];
  String _optionA = "", _optionB = "", _optionC = "";
  void _incrementCounter() {
    setState(() {
      random = Random().nextInt(apps.length - 1);
      arr[0] = apps.keys.elementAt(random);
      arr[1] = apps.keys.elementAt(Random().nextInt(apps.length - 1));
      arr[2] = apps.keys.elementAt(Random().nextInt(apps.length - 1));
      arr.shuffle();
      _optionA = arr[0];
      _optionB = arr[1];
      _optionC = arr[2];

      _word = apps[apps.keys.elementAt(random)].toString();
      
    });
  }

  _check(String a){
    print(_word + " : " + apps[a].toString());
      if (apps[a]?.compareTo(_word) == 0) {
        _counter++;
        _incrementCounter();
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Score: $_counter"),
            Container(
                padding: EdgeInsets.all(8),
                color: Colors.red,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                margin: EdgeInsets.all(25),
                child: Center(
                    child: Text(
                  _word,
                  style: TextStyle(fontSize: 45),
                ))),
            Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              margin: EdgeInsets.all(25),
              child: Row(
                children: [
                  Container(
                      width: 120,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: _check(_optionA),
                          child: Text(_optionA))),
                  Container(
                      width: 120,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: _check(_optionB),
                          child: Text(_optionB))),
                  Container(
                      width: 120,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: _check(_optionC),
                          child: Text(_optionC))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
