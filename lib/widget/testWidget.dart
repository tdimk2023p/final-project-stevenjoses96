import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mymood/services/dataServices.dart';
import 'package:mymood/services/dbServices.dart';
import 'package:sizer/sizer.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:unique_identifier/unique_identifier.dart';

class testWidget extends StatefulWidget {
  const testWidget({super.key});

  @override
  State<testWidget> createState() => _testWidgetState();
}

class _testWidgetState extends State<testWidget> {
  bool dengarQ1 = false;
  bool dengarQ2 = false;
  bool dengarQ3 = false;
  bool dengarQ4 = false;
  bool dengarQ5 = false;
  bool dengarQ6 = false;
  bool dengarQ7 = false;
  bool dengarQ8 = false;
  bool dengarQ9 = false;
  stt.SpeechToText? bicara;

  TextEditingController q1Text = TextEditingController(text: '');
  TextEditingController q2Text = TextEditingController(text: '');
  TextEditingController q3Text = TextEditingController(text: '');
  TextEditingController q4Text = TextEditingController(text: '');
  TextEditingController q5Text = TextEditingController(text: '');
  TextEditingController q6Text = TextEditingController(text: '');
  TextEditingController q7Text = TextEditingController(text: '');
  TextEditingController q8Text = TextEditingController(text: '');
  TextEditingController q9Text = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bicara = stt.SpeechToText();
    initUniqueIdentifierState();
  }

  bersihkanText() {
    q1Text.text = '';
    q2Text.text = '';
    q3Text.text = '';
    q4Text.text = '';
    q5Text.text = '';
    q6Text.text = '';
    q7Text.text = '';
    q8Text.text = '';
    q9Text.text = '';
  }

  String idPhone = 'Unknown';

  Future<void> initUniqueIdentifierState() async {
    String identifier;
    try {
      identifier = (await UniqueIdentifier.serial)!;
    } on PlatformException {
      identifier = 'Failed to get Unique Identifier';
    }

    if (!mounted) return;

    setState(() {
      idPhone = identifier;
      print(idPhone);
    });
  }

  final FlutterTts flutterTts = FlutterTts();

  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  void dengarinQ1() async {
    if (!dengarQ1) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarQ1 = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              q1Text.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarQ1 = false);
      bicara!.stop();
    }
  }

  void dengarinQ2() async {
    if (!dengarQ2) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarQ2 = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              q2Text.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarQ2 = false);
      bicara!.stop();
    }
  }

  void dengarinQ3() async {
    if (!dengarQ3) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarQ3 = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              q3Text.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarQ3 = false);
      bicara!.stop();
    }
  }

  void dengarinQ4() async {
    if (!dengarQ4) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarQ4 = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              q4Text.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarQ4 = false);
      bicara!.stop();
    }
  }

  void dengarinQ5() async {
    if (!dengarQ5) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarQ5 = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              q5Text.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarQ5 = false);
      bicara!.stop();
    }
  }

  void dengarinQ6() async {
    if (!dengarQ6) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarQ6 = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              q6Text.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarQ6 = false);
      bicara!.stop();
    }
  }

  void dengarinQ7() async {
    if (!dengarQ7) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarQ7 = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              q7Text.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarQ7 = false);
      bicara!.stop();
    }
  }

  void dengarinQ8() async {
    if (!dengarQ8) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarQ8 = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              q8Text.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarQ8 = false);
      bicara!.stop();
    }
  }

  void dengarinQ9() async {
    if (!dengarQ9) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarQ9 = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              q9Text.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarQ9 = false);
      bicara!.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  child: Text(
                    'Test Result Patient Health Questionnaire\n(PHQ-9)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('testScore').where('iduser', isEqualTo: idPhone).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Delete Data'),
                                content: Text('Are you sure delete this?'),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      await DatabaseServices.deleteDataFirestore('testScore', snapshot.data!.docs[index].id);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Cancel',
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.teal,
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp, color: Colors.white),
                              ),
                            ),
                            title: Center(
                              child: Text(
                                '${snapshot.data!.docs[index]['date']}',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Score           : ${snapshot.data!.docs[index]['score']}',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Description : ${snapshot.data!.docs[index]['desc']}',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bersihkanText();
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Question 1'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                        onPressed: () async {
                          await speak('Little interest or pleasure in doing things. A. Not at all. B. Several days. C. More than half the days. D. Nearly every day.');
                        },
                        child: Text('Play the Questions'),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                        onPressed: dengarinQ1,
                        icon: Icon(dengarQ1 ? Icons.mic : Icons.mic_none),
                        label: Text('Alfa, Bravo, Charlie or Delta'),
                      ),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            label: Text('Answer Question 1'),
                            border: OutlineInputBorder(),
                          ),
                          controller: q1Text,
                          keyboardType: TextInputType.text,
                        );
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () async {
                        q1Text.text = q1Text.text.toString().toLowerCase();
                        if ((q1Text.text == 'alfa') || (q1Text.text == 'bravo') || (q1Text.text == 'charlie') || (q1Text.text == 'delta')) {
                          Navigator.of(context).pop();

                          await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Question 2'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                        onPressed: () async {
                                          await speak('Feeling down, depressed, or hopeless. A. Not at all. B. Several days. C. More than half the days. D. Nearly every day.');
                                        },
                                        child: Text('Play the Questions'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                        onPressed: dengarinQ2,
                                        icon: Icon(dengarQ2 ? Icons.mic : Icons.mic_none),
                                        label: Text('Alfa, Bravo, Charlie or Delta'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.sp,
                                    ),
                                    StatefulBuilder(
                                      builder: (context, setState) {
                                        return TextField(
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            label: Text('Answer Question 2'),
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: q2Text,
                                          keyboardType: TextInputType.text,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        q2Text.text = q2Text.text.toString().toLowerCase();
                                        if ((q2Text.text == 'alfa') || (q2Text.text == 'bravo') || (q2Text.text == 'charlie') || (q2Text.text == 'delta')) {
                                          Navigator.of(context).pop();

                                          await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Question 3'),
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                        onPressed: () async {
                                                          await speak('Trouble falling or staying asleep, or sleeping too much. A. Not at all. B. Several days. C. More than half the days. D. Nearly every day.');
                                                        },
                                                        child: Text('Play the Questions'),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: ElevatedButton.icon(
                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                        onPressed: dengarinQ3,
                                                        icon: Icon(dengarQ3 ? Icons.mic : Icons.mic_none),
                                                        label: Text('Alfa, Bravo, Charlie or Delta'),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.sp,
                                                    ),
                                                    StatefulBuilder(
                                                      builder: (context, setState) {
                                                        return TextField(
                                                          readOnly: true,
                                                          decoration: InputDecoration(
                                                            label: Text('Answer Question 3'),
                                                            border: OutlineInputBorder(),
                                                          ),
                                                          controller: q3Text,
                                                          keyboardType: TextInputType.text,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () async {
                                                        q3Text.text = q3Text.text.toString().toLowerCase();
                                                        if ((q3Text.text == 'alfa') || (q3Text.text == 'bravo') || (q3Text.text == 'charlie') || (q3Text.text == 'delta')) {
                                                          Navigator.of(context).pop();

                                                          await showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                title: Text('Question 4'),
                                                                content: Column(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context).size.width,
                                                                      child: ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                                        onPressed: () async {
                                                                          await speak('Feeling tired or having little energy. A. Not at all. B. Several days. C. More than half the days. D. Nearly every day.');
                                                                        },
                                                                        child: Text('Play the Questions'),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context).size.width,
                                                                      child: ElevatedButton.icon(
                                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                                        onPressed: dengarinQ4,
                                                                        icon: Icon(dengarQ4 ? Icons.mic : Icons.mic_none),
                                                                        label: Text('Alfa, Bravo, Charlie or Delta'),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5.sp,
                                                                    ),
                                                                    StatefulBuilder(
                                                                      builder: (context, setState) {
                                                                        return TextField(
                                                                          readOnly: true,
                                                                          decoration: InputDecoration(
                                                                            label: Text('Answer Question 4'),
                                                                            border: OutlineInputBorder(),
                                                                          ),
                                                                          controller: q4Text,
                                                                          keyboardType: TextInputType.text,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                      onPressed: () async {
                                                                        q4Text.text = q4Text.text.toString().toLowerCase();
                                                                        if ((q4Text.text == 'alfa') || (q4Text.text == 'bravo') || (q4Text.text == 'charlie') || (q4Text.text == 'delta')) {
                                                                          Navigator.of(context).pop();

                                                                          await showDialog(
                                                                            context: context,
                                                                            builder: (context) {
                                                                              return AlertDialog(
                                                                                title: Text('Question 5'),
                                                                                content: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width,
                                                                                      child: ElevatedButton(
                                                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                                                        onPressed: () async {
                                                                                          await speak('Poor appetite or overeating. A. Not at all. B. Several days. C. More than half the days. D. Nearly every day.');
                                                                                        },
                                                                                        child: Text('Play the Questions'),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width,
                                                                                      child: ElevatedButton.icon(
                                                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                                                        onPressed: dengarinQ5,
                                                                                        icon: Icon(dengarQ5 ? Icons.mic : Icons.mic_none),
                                                                                        label: Text('Alfa, Bravo, Charlie or Delta'),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 5.sp,
                                                                                    ),
                                                                                    StatefulBuilder(
                                                                                      builder: (context, setState) {
                                                                                        return TextField(
                                                                                          readOnly: true,
                                                                                          decoration: InputDecoration(
                                                                                            label: Text('Answer Question 5'),
                                                                                            border: OutlineInputBorder(),
                                                                                          ),
                                                                                          controller: q5Text,
                                                                                          keyboardType: TextInputType.text,
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                actions: [
                                                                                  TextButton(
                                                                                      onPressed: () async {
                                                                                        q5Text.text = q5Text.text.toString().toLowerCase();

                                                                                        if ((q5Text.text == 'alfa') || (q5Text.text == 'bravo') || (q5Text.text == 'charlie') || (q5Text.text == 'delta')) {
                                                                                          Navigator.of(context).pop();

                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return AlertDialog(
                                                                                                title: Text('Question 6'),
                                                                                                content: Column(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  children: [
                                                                                                    SizedBox(
                                                                                                      width: MediaQuery.of(context).size.width,
                                                                                                      child: ElevatedButton(
                                                                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                                                                        onPressed: () async {
                                                                                                          await speak('Feeling bad about yourself – or that you are a failure or have let yourself or your family down. A. Not at all. B. Several days. C. More than half the days. D. Nearly every day.');
                                                                                                        },
                                                                                                        child: Text('Play the Questions'),
                                                                                                      ),
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      width: MediaQuery.of(context).size.width,
                                                                                                      child: ElevatedButton.icon(
                                                                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                                                                        onPressed: dengarinQ6,
                                                                                                        icon: Icon(dengarQ6 ? Icons.mic : Icons.mic_none),
                                                                                                        label: Text('Alfa, Bravo, Charlie or Delta'),
                                                                                                      ),
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      height: 5.sp,
                                                                                                    ),
                                                                                                    StatefulBuilder(
                                                                                                      builder: (context, setState) {
                                                                                                        return TextField(
                                                                                                          readOnly: true,
                                                                                                          decoration: InputDecoration(
                                                                                                            label: Text('Answer Question 6'),
                                                                                                            border: OutlineInputBorder(),
                                                                                                          ),
                                                                                                          controller: q6Text,
                                                                                                          keyboardType: TextInputType.text,
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                actions: [
                                                                                                  TextButton(
                                                                                                      onPressed: () async {
                                                                                                        q6Text.text = q6Text.text.toString().toLowerCase();

                                                                                                        if ((q6Text.text == 'alfa') || (q6Text.text == 'bravo') || (q6Text.text == 'charlie') || (q6Text.text == 'delta')) {
                                                                                                          Navigator.of(context).pop();

                                                                                                          await showDialog(
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return AlertDialog(
                                                                                                                title: Text('Question 7'),
                                                                                                                content: Column(
                                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                                  children: [
                                                                                                                    SizedBox(
                                                                                                                      width: MediaQuery.of(context).size.width,
                                                                                                                      child: ElevatedButton(
                                                                                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                                                                                        onPressed: () async {
                                                                                                                          await speak(
                                                                                                                              'Trouble concentrating on things, such as reading the newspaper or watching television. A. Not at all. B. Several days. C. More than half the days. D. Nearly every day.');
                                                                                                                        },
                                                                                                                        child: Text('Play the Questions'),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    SizedBox(
                                                                                                                      width: MediaQuery.of(context).size.width,
                                                                                                                      child: ElevatedButton.icon(
                                                                                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                                                                                        onPressed: dengarinQ7,
                                                                                                                        icon: Icon(dengarQ7 ? Icons.mic : Icons.mic_none),
                                                                                                                        label: Text('Alfa, Bravo, Charlie or Delta'),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    SizedBox(
                                                                                                                      height: 5.sp,
                                                                                                                    ),
                                                                                                                    StatefulBuilder(
                                                                                                                      builder: (context, setState) {
                                                                                                                        return TextField(
                                                                                                                          readOnly: true,
                                                                                                                          decoration: InputDecoration(
                                                                                                                            label: Text('Answer Question 7'),
                                                                                                                            border: OutlineInputBorder(),
                                                                                                                          ),
                                                                                                                          controller: q7Text,
                                                                                                                          keyboardType: TextInputType.text,
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                actions: [
                                                                                                                  TextButton(
                                                                                                                      onPressed: () async {
                                                                                                                        q7Text.text = q7Text.text.toString().toLowerCase();

                                                                                                                        if ((q7Text.text == 'alfa') || (q7Text.text == 'bravo') || (q7Text.text == 'charlie') || (q7Text.text == 'delta')) {
                                                                                                                          Navigator.of(context).pop();

                                                                                                                          await showDialog(
                                                                                                                            context: context,
                                                                                                                            builder: (context) {
                                                                                                                              return AlertDialog(
                                                                                                                                title: Text('Question 8'),
                                                                                                                                content: Column(
                                                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                                                  children: [
                                                                                                                                    SizedBox(
                                                                                                                                      width: MediaQuery.of(context).size.width,
                                                                                                                                      child: ElevatedButton(
                                                                                                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                                                                                                        onPressed: () async {
                                                                                                                                          await speak(
                                                                                                                                              'Moving or speaking so slowly that other people could have noticed? Or the opposite – being so fidgety or restless that you have been moving around a lot more than usual. A. Not at all. B. Several days. C. More than half the days. D. Nearly every day.');
                                                                                                                                        },
                                                                                                                                        child: Text('Play the Questions'),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    SizedBox(
                                                                                                                                      width: MediaQuery.of(context).size.width,
                                                                                                                                      child: ElevatedButton.icon(
                                                                                                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                                                                                                        onPressed: dengarinQ8,
                                                                                                                                        icon: Icon(dengarQ8 ? Icons.mic : Icons.mic_none),
                                                                                                                                        label: Text('Alfa, Bravo, Charlie or Delta'),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    SizedBox(
                                                                                                                                      height: 5.sp,
                                                                                                                                    ),
                                                                                                                                    StatefulBuilder(
                                                                                                                                      builder: (context, setState) {
                                                                                                                                        return TextField(
                                                                                                                                          readOnly: true,
                                                                                                                                          decoration: InputDecoration(
                                                                                                                                            label: Text('Answer Question 8'),
                                                                                                                                            border: OutlineInputBorder(),
                                                                                                                                          ),
                                                                                                                                          controller: q8Text,
                                                                                                                                          keyboardType: TextInputType.text,
                                                                                                                                        );
                                                                                                                                      },
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                                actions: [
                                                                                                                                  TextButton(
                                                                                                                                      onPressed: () async {
                                                                                                                                        q8Text.text = q8Text.text.toString().toLowerCase();

                                                                                                                                        if ((q8Text.text == 'alfa') || (q8Text.text == 'bravo') || (q8Text.text == 'charlie') || (q8Text.text == 'delta')) {
                                                                                                                                          Navigator.of(context).pop();

                                                                                                                                          await showDialog(
                                                                                                                                            context: context,
                                                                                                                                            builder: (context) {
                                                                                                                                              return AlertDialog(
                                                                                                                                                title: Text('Question 9'),
                                                                                                                                                content: Column(
                                                                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                                                                  children: [
                                                                                                                                                    SizedBox(
                                                                                                                                                      width: MediaQuery.of(context).size.width,
                                                                                                                                                      child: ElevatedButton(
                                                                                                                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                                                                                                                        onPressed: () async {
                                                                                                                                                          await speak(
                                                                                                                                                              'Thoughts that you would be better off dead or of hurting yourself insome way. A. Not at all. B. Several days. C. More than half the days. D. Nearly every day.');
                                                                                                                                                        },
                                                                                                                                                        child: Text('Play the Questions'),
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                    SizedBox(
                                                                                                                                                      width: MediaQuery.of(context).size.width,
                                                                                                                                                      child: ElevatedButton.icon(
                                                                                                                                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                                                                                                                                        onPressed: dengarinQ9,
                                                                                                                                                        icon: Icon(dengarQ9 ? Icons.mic : Icons.mic_none),
                                                                                                                                                        label: Text('Alfa, Bravo, Charlie or Delta'),
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                    SizedBox(
                                                                                                                                                      height: 5.sp,
                                                                                                                                                    ),
                                                                                                                                                    StatefulBuilder(
                                                                                                                                                      builder: (context, setState) {
                                                                                                                                                        return TextField(
                                                                                                                                                          readOnly: true,
                                                                                                                                                          decoration: InputDecoration(
                                                                                                                                                            label: Text('Answer Question 9'),
                                                                                                                                                            border: OutlineInputBorder(),
                                                                                                                                                          ),
                                                                                                                                                          controller: q9Text,
                                                                                                                                                          keyboardType: TextInputType.text,
                                                                                                                                                        );
                                                                                                                                                      },
                                                                                                                                                    ),
                                                                                                                                                  ],
                                                                                                                                                ),
                                                                                                                                                actions: [
                                                                                                                                                  TextButton(
                                                                                                                                                      onPressed: () async {
                                                                                                                                                        q9Text.text = q9Text.text.toString().toLowerCase();

                                                                                                                                                        if ((q9Text.text == 'alfa') || (q9Text.text == 'bravo') || (q9Text.text == 'charlie') || (q9Text.text == 'delta')) {
                                                                                                                                                          Navigator.of(context).pop();
                                                                                                                                                          int hasil = 0;
                                                                                                                                                          String kata = '';
                                                                                                                                                          if (q1Text.text == 'alfa') {
                                                                                                                                                            hasil = hasil + 0;
                                                                                                                                                          } else if (q1Text.text == 'bravo') {
                                                                                                                                                            hasil = hasil + 1;
                                                                                                                                                          } else if (q1Text.text == 'charlie') {
                                                                                                                                                            hasil = hasil + 2;
                                                                                                                                                          } else if (q1Text.text == 'delta') {
                                                                                                                                                            hasil = hasil + 3;
                                                                                                                                                          }

                                                                                                                                                          if (q2Text.text == 'alfa') {
                                                                                                                                                            hasil = hasil + 0;
                                                                                                                                                          } else if (q2Text.text == 'bravo') {
                                                                                                                                                            hasil = hasil + 1;
                                                                                                                                                          } else if (q2Text.text == 'charlie') {
                                                                                                                                                            hasil = hasil + 2;
                                                                                                                                                          } else if (q2Text.text == 'delta') {
                                                                                                                                                            hasil = hasil + 3;
                                                                                                                                                          }

                                                                                                                                                          if (q3Text.text == 'alfa') {
                                                                                                                                                            hasil = hasil + 0;
                                                                                                                                                          } else if (q3Text.text == 'bravo') {
                                                                                                                                                            hasil = hasil + 1;
                                                                                                                                                          } else if (q3Text.text == 'charlie') {
                                                                                                                                                            hasil = hasil + 2;
                                                                                                                                                          } else if (q3Text.text == 'delta') {
                                                                                                                                                            hasil = hasil + 3;
                                                                                                                                                          }

                                                                                                                                                          if (q4Text.text == 'alfa') {
                                                                                                                                                            hasil = hasil + 0;
                                                                                                                                                          } else if (q4Text.text == 'bravo') {
                                                                                                                                                            hasil = hasil + 1;
                                                                                                                                                          } else if (q4Text.text == 'charlie') {
                                                                                                                                                            hasil = hasil + 2;
                                                                                                                                                          } else if (q4Text.text == 'delta') {
                                                                                                                                                            hasil = hasil + 3;
                                                                                                                                                          }

                                                                                                                                                          if (q5Text.text == 'alfa') {
                                                                                                                                                            hasil = hasil + 0;
                                                                                                                                                          } else if (q5Text.text == 'bravo') {
                                                                                                                                                            hasil = hasil + 1;
                                                                                                                                                          } else if (q5Text.text == 'charlie') {
                                                                                                                                                            hasil = hasil + 2;
                                                                                                                                                          } else if (q5Text.text == 'delta') {
                                                                                                                                                            hasil = hasil + 3;
                                                                                                                                                          }

                                                                                                                                                          if (q6Text.text == 'alfa') {
                                                                                                                                                            hasil = hasil + 0;
                                                                                                                                                          } else if (q6Text.text == 'bravo') {
                                                                                                                                                            hasil = hasil + 1;
                                                                                                                                                          } else if (q6Text.text == 'charlie') {
                                                                                                                                                            hasil = hasil + 2;
                                                                                                                                                          } else if (q6Text.text == 'delta') {
                                                                                                                                                            hasil = hasil + 3;
                                                                                                                                                          }

                                                                                                                                                          if (q7Text.text == 'alfa') {
                                                                                                                                                            hasil = hasil + 0;
                                                                                                                                                          } else if (q7Text.text == 'bravo') {
                                                                                                                                                            hasil = hasil + 1;
                                                                                                                                                          } else if (q7Text.text == 'charlie') {
                                                                                                                                                            hasil = hasil + 2;
                                                                                                                                                          } else if (q7Text.text == 'delta') {
                                                                                                                                                            hasil = hasil + 3;
                                                                                                                                                          }

                                                                                                                                                          if (q8Text.text == 'alfa') {
                                                                                                                                                            hasil = hasil + 0;
                                                                                                                                                          } else if (q8Text.text == 'bravo') {
                                                                                                                                                            hasil = hasil + 1;
                                                                                                                                                          } else if (q8Text.text == 'charlie') {
                                                                                                                                                            hasil = hasil + 2;
                                                                                                                                                          } else if (q8Text.text == 'delta') {
                                                                                                                                                            hasil = hasil + 3;
                                                                                                                                                          }

                                                                                                                                                          if (q1Text.text == 'alfa') {
                                                                                                                                                            hasil = hasil + 0;
                                                                                                                                                          } else if (q9Text.text == 'bravo') {
                                                                                                                                                            hasil = hasil + 1;
                                                                                                                                                          } else if (q9Text.text == 'charlie') {
                                                                                                                                                            hasil = hasil + 2;
                                                                                                                                                          } else if (q9Text.text == 'delta') {
                                                                                                                                                            hasil = hasil + 3;
                                                                                                                                                          }

                                                                                                                                                          if (hasil > 19) {
                                                                                                                                                            kata = 'Severe Depression';
                                                                                                                                                          } else if (hasil > 14) {
                                                                                                                                                            kata = 'Moderately Severe Depression';
                                                                                                                                                          } else if (hasil > 9) {
                                                                                                                                                            kata = 'Moderate Depression';
                                                                                                                                                          } else if (hasil > 4) {
                                                                                                                                                            kata = 'Mild Depression';
                                                                                                                                                          } else {
                                                                                                                                                            kata = 'None-minimal Depression';
                                                                                                                                                          }

                                                                                                                                                          await showDialog(
                                                                                                                                                            context: context,
                                                                                                                                                            builder: (context) {
                                                                                                                                                              return AlertDialog(
                                                                                                                                                                title: Text('Your PHQ-9 Scores : $hasil'),
                                                                                                                                                                content: Column(
                                                                                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                                                                                  children: [
                                                                                                                                                                    Container(
                                                                                                                                                                        child: hasil > 19
                                                                                                                                                                            ? Text('Depression Severity: Severe')
                                                                                                                                                                            : hasil > 14
                                                                                                                                                                                ? Text('Depression Severity: Moderately severe')
                                                                                                                                                                                : hasil > 9
                                                                                                                                                                                    ? Text('Depression Severity: Moderate')
                                                                                                                                                                                    : hasil > 4
                                                                                                                                                                                        ? Text('Depression Severity: Mild')
                                                                                                                                                                                        : Text('Depression Severity: None-minimal')),
                                                                                                                                                                    ElevatedButton(
                                                                                                                                                                        onPressed: () async {
                                                                                                                                                                          if (hasil > 19) {
                                                                                                                                                                            await speak('Treat using antidepressants with or without psychotherapy.');
                                                                                                                                                                          } else if (hasil > 14) {
                                                                                                                                                                            await speak('Treat using antidepressants, psychotherapy or a combination of treatment.');
                                                                                                                                                                          } else if (hasil > 9) {
                                                                                                                                                                            await speak('Use clinical judgment about treatment, based on patients duration of symptoms and functional impairment.');
                                                                                                                                                                          } else if (hasil > 4) {
                                                                                                                                                                            await speak('Use clinical judgment about treatment, based on patient’s duration of symptoms and functional impairment');
                                                                                                                                                                          } else {
                                                                                                                                                                            await speak('Patient may not need depression treatment.');
                                                                                                                                                                          }
                                                                                                                                                                        },
                                                                                                                                                                        child: Text('Action')),
                                                                                                                                                                  ],
                                                                                                                                                                ),
                                                                                                                                                                actions: [
                                                                                                                                                                  TextButton(
                                                                                                                                                                      onPressed: () async {
                                                                                                                                                                        Map<String, String> input = {};
                                                                                                                                                                        input['iduser'] = idPhone;
                                                                                                                                                                        input['score'] = hasil.toString();
                                                                                                                                                                        input['date'] = DateTime.now().toString().substring(0, 10);
                                                                                                                                                                        input['desc'] = kata;
                                                                                                                                                                        String tanggal = DateTime.now().toString();
                                                                                                                                                                        //1992-12-23
                                                                                                                                                                        String tahun = tanggal.substring(0, 4);
                                                                                                                                                                        String bulan = tanggal.substring(5, 7);
                                                                                                                                                                        String hari = tanggal.substring(8, 10);
                                                                                                                                                                        String jam = tanggal.substring(11, 13);
                                                                                                                                                                        String menit = tanggal.substring(14, 16);
                                                                                                                                                                        String detik = tanggal.substring(17, 19);

                                                                                                                                                                        String docId = tahun + bulan + hari + jam + menit + detik;
                                                                                                                                                                        await DatabaseServices.createDataWithDocId('testScore', docId, input);
                                                                                                                                                                        Navigator.of(context).pop();
                                                                                                                                                                      },
                                                                                                                                                                      child: Text(
                                                                                                                                                                        'Save Result',
                                                                                                                                                                        style: TextStyle(color: Colors.teal),
                                                                                                                                                                      )),
                                                                                                                                                                  TextButton(
                                                                                                                                                                      onPressed: () {
                                                                                                                                                                        Navigator.of(context).pop();
                                                                                                                                                                      },
                                                                                                                                                                      child: Text(
                                                                                                                                                                        'Back',
                                                                                                                                                                        style: TextStyle(color: Colors.red),
                                                                                                                                                                      )),
                                                                                                                                                                ],
                                                                                                                                                              );
                                                                                                                                                            },
                                                                                                                                                          );
                                                                                                                                                        }
                                                                                                                                                      },
                                                                                                                                                      child: Text(
                                                                                                                                                        'Show Answer',
                                                                                                                                                        style: TextStyle(color: Colors.teal),
                                                                                                                                                      )),
                                                                                                                                                  TextButton(
                                                                                                                                                      onPressed: () {
                                                                                                                                                        Navigator.of(context).pop();
                                                                                                                                                      },
                                                                                                                                                      child: Text(
                                                                                                                                                        'Back',
                                                                                                                                                        style: TextStyle(color: Colors.red),
                                                                                                                                                      )),
                                                                                                                                                ],
                                                                                                                                              );
                                                                                                                                            },
                                                                                                                                          );
                                                                                                                                        }
                                                                                                                                      },
                                                                                                                                      child: Text(
                                                                                                                                        'Next',
                                                                                                                                        style: TextStyle(color: Colors.teal),
                                                                                                                                      )),
                                                                                                                                  TextButton(
                                                                                                                                      onPressed: () {
                                                                                                                                        Navigator.of(context).pop();
                                                                                                                                      },
                                                                                                                                      child: Text(
                                                                                                                                        'Back',
                                                                                                                                        style: TextStyle(color: Colors.red),
                                                                                                                                      )),
                                                                                                                                ],
                                                                                                                              );
                                                                                                                            },
                                                                                                                          );
                                                                                                                        }
                                                                                                                      },
                                                                                                                      child: Text(
                                                                                                                        'Next',
                                                                                                                        style: TextStyle(color: Colors.teal),
                                                                                                                      )),
                                                                                                                  TextButton(
                                                                                                                      onPressed: () {
                                                                                                                        Navigator.of(context).pop();
                                                                                                                      },
                                                                                                                      child: Text(
                                                                                                                        'Back',
                                                                                                                        style: TextStyle(color: Colors.red),
                                                                                                                      )),
                                                                                                                ],
                                                                                                              );
                                                                                                            },
                                                                                                          );
                                                                                                        }
                                                                                                      },
                                                                                                      child: Text(
                                                                                                        'Next',
                                                                                                        style: TextStyle(color: Colors.teal),
                                                                                                      )),
                                                                                                  TextButton(
                                                                                                      onPressed: () {
                                                                                                        Navigator.of(context).pop();
                                                                                                      },
                                                                                                      child: Text(
                                                                                                        'Back',
                                                                                                        style: TextStyle(color: Colors.red),
                                                                                                      )),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                      child: Text(
                                                                                        'Next',
                                                                                        style: TextStyle(color: Colors.teal),
                                                                                      )),
                                                                                  TextButton(
                                                                                      onPressed: () {
                                                                                        Navigator.of(context).pop();
                                                                                      },
                                                                                      child: Text(
                                                                                        'Back',
                                                                                        style: TextStyle(color: Colors.red),
                                                                                      )),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        }
                                                                      },
                                                                      child: Text(
                                                                        'Next',
                                                                        style: TextStyle(color: Colors.teal),
                                                                      )),
                                                                  TextButton(
                                                                      onPressed: () {
                                                                        Navigator.of(context).pop();
                                                                      },
                                                                      child: Text(
                                                                        'Back',
                                                                        style: TextStyle(color: Colors.red),
                                                                      )),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        }
                                                      },
                                                      child: Text(
                                                        'Next',
                                                        style: TextStyle(color: Colors.teal),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text(
                                                        'Back',
                                                        style: TextStyle(color: Colors.red),
                                                      )),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: Text(
                                        'Next',
                                        style: TextStyle(color: Colors.teal),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Back',
                                        style: TextStyle(color: Colors.red),
                                      )),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.teal),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              );
            },
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.teal,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
