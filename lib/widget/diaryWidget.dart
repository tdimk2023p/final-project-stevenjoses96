import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:mymood/services/dbServices.dart';
import 'package:sizer/sizer.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:unique_identifier/unique_identifier.dart';

class diaryWidget extends StatefulWidget {
  const diaryWidget({super.key});

  @override
  State<diaryWidget> createState() => _diaryWidgetState();
}

class _diaryWidgetState extends State<diaryWidget> {
  TextEditingController titleText = TextEditingController();
  TextEditingController descText = TextEditingController(text: '');
  TextEditingController negText = TextEditingController(text: '');
  TextEditingController chaText = TextEditingController(text: '');
  TextEditingController alterText = TextEditingController(text: '');

  stt.SpeechToText? bicara;
  bool dengarDesc = false;
  bool dengarTitle = false;
  bool dengarNeg = false;
  bool dengarCha = false;
  bool dengarAlter = false;

  String selectedLevelStress = 'Choose Distress Level';
  String selectedCognitiveDist = 'Choose Cognitive Distortions';
  String selectedLevelStress2 = 'Choose Distress Level';

  final FlutterTts flutterTts = FlutterTts();

  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  bool cbAll = false;
  bool cbOver = false;
  bool cbFilter = false;
  bool cbJump = false;
  bool cbMind = false;
  bool cbFortune = false;
  bool cbMagni = false;
  bool cbMini = false;
  bool cbCata = false;
  bool cbEmot = false;
  bool cbShould = false;
  bool cbLabel = false;
  bool cbSelf = false;
  bool cbOther = false;

  bool cbangry = false;
  bool cbanxious = false;
  bool cbashamed = false;
  bool cbdisgusted = false;
  bool cbempty = false;
  bool cbguilty = false;
  bool cbhopeless = false;
  bool cbover = false;
  bool cbsad = false;
  bool cbscared = false;
  bool cbworthless = false;

  void bersihkan() {
    cbAll = false;
    cbOver = false;
    cbFilter = false;
    cbJump = false;
    cbMind = false;
    cbFortune = false;
    cbMagni = false;
    cbMini = false;
    cbCata = false;
    cbEmot = false;
    cbShould = false;
    cbLabel = false;
    cbSelf = false;
    cbOther = false;
  }

  void bersihkan2() {
    cbangry = false;
    cbanxious = false;
    cbashamed = false;
    cbdisgusted = false;
    cbempty = false;
    cbguilty = false;
    cbhopeless = false;
    cbover = false;
    cbsad = false;
    cbscared = false;
    cbworthless = false;
  }

  @override
  void initState() {
    super.initState();
    bicara = stt.SpeechToText();
    initUniqueIdentifierState();
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

  void dengarinDesc() async {
    if (!dengarDesc) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarDesc = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              descText.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarDesc = false);
      bicara!.stop();
    }
  }

  void dengarinAlter() async {
    if (!dengarAlter) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarAlter = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              alterText.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarAlter = false);
      bicara!.stop();
    }
  }

  void dengarinCha() async {
    if (!dengarCha) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarCha = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              chaText.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarCha = false);
      bicara!.stop();
    }
  }

  void dengarinTitle() async {
    if (!dengarTitle) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarTitle = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              titleText.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarTitle = false);
      bicara!.stop();
    }
  }

  void dengarinNeg() async {
    if (!dengarNeg) {
      bool tersedia = await bicara!.initialize(
        onStatus: (status) => print(status),
        onError: (errorNotification) => print(errorNotification),
      );
      if (tersedia) {
        setState(() => dengarNeg = false);
        bicara!.listen(
          onResult: (result) => setState(
            () {
              negText.text = result.recognizedWords;
            },
          ),
        );
      }
    } else {
      setState(() => dengarNeg = false);
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
                    'Thought Diary',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                ),
              ),
            ),
            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('diary').where('iduser', isEqualTo: idPhone).snapshots(),
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
                                      await DatabaseServices.deleteDataFirestore('diary', snapshot.data!.docs[index].id);
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
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Title',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${snapshot.data!.docs[index]['title']}',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Initial Distress Level',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${snapshot.data!.docs[index]['beforeDistress']}',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Text(
                                    'Emotions',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${snapshot.data!.docs[index]['emotions']}',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Situation',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${snapshot.data!.docs[index]['situation']}',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Negative Thought',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${snapshot.data!.docs[index]['negText']}',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Text(
                                    'Cognitive Distortions',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${snapshot.data!.docs[index]['cogDis']}',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Challange',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${snapshot.data!.docs[index]['challange']}',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Alternative Thought',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${snapshot.data!.docs[index]['alterText']}',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Final Distress Level',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${snapshot.data!.docs[index]['afterDistress']}',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.cyan,
        onPressed: () async {
          titleText.text = '';
          descText.text = '';
          negText.text = '';
          chaText.text = '';
          alterText.text = '';

          bersihkan();
          bersihkan2();

          await showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Add Diary',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            label: Text('Title Diary'),
                            prefixIcon: IconButton(
                                onPressed: () async {
                                  await speak('Enter Title Here');
                                },
                                icon: Icon(Icons.question_mark)),
                            suffixIcon: IconButton(
                              onPressed: dengarinTitle,
                              icon: Icon(dengarTitle ? Icons.mic : Icons.mic_none),
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: titleText,
                          keyboardType: TextInputType.text,
                        );
                      },
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Choose Emotions'),
                              content: Container(
                                height: 300.sp,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Angry',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Checkbox(
                                                  value: cbangry,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbangry = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Anxious',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Checkbox(
                                                  value: cbanxious,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbanxious = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Ashamed',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Checkbox(
                                                  value: cbashamed,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbashamed = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Disgusted',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Checkbox(
                                                  value: cbdisgusted,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbdisgusted = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Empty',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Checkbox(
                                                  value: cbempty,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbempty = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Guilty',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Checkbox(
                                                  value: cbguilty,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbguilty = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Hopeless',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Checkbox(
                                                  value: cbhopeless,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbhopeless = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Overwhelmed',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Checkbox(
                                                  value: cbover,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbover = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Sad',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Checkbox(
                                                  value: cbsad,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbsad = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Scared',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Checkbox(
                                                  value: cbscared,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbscared = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Worthless',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Checkbox(
                                                  value: cbworthless,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbworthless = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Choose'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    bersihkan2();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Emotions'),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return DropdownButton(
                          isExpanded: true,
                          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                          value: selectedLevelStress,
                          onChanged: (String? Value) {
                            setState(() {
                              selectedLevelStress = Value!;
                            });
                          },
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Choose Distress Level',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: 'Choose Distress Level',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '0 - No Distress',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '0',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '1',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '1',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '2 - Mild Distress',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '2',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '3',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '3',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '4',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '4',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '5 - Moderate Distress',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '5',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '6',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '6',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '7',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '7',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '8 - Severe Distress',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '8',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '9',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '9',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '10 - Extreme Distress',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '10',
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    TextField(
                      readOnly: true,
                      minLines: 4,
                      maxLines: 6,
                      decoration: InputDecoration(
                        label: Text('Situation'),
                        prefixIcon: IconButton(
                            onPressed: () async {
                              await speak('Describe the situation');
                            },
                            icon: Icon(Icons.question_mark)),
                        suffixIcon: IconButton(
                          onPressed: dengarinDesc,
                          icon: Icon(dengarDesc ? Icons.mic : Icons.mic_none),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      controller: descText,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    TextField(
                      readOnly: true,
                      minLines: 4,
                      maxLines: 6,
                      decoration: InputDecoration(
                        label: Text('Negative Thoughts'),
                        prefixIcon: IconButton(
                            onPressed: () async {
                              await speak('Enter the negative thoughts you had about the situation');
                            },
                            icon: Icon(Icons.question_mark)),
                        suffixIcon: IconButton(
                          onPressed: dengarinNeg,
                          icon: Icon(dengarNeg ? Icons.mic : Icons.mic_none),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      controller: negText,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Choose Cognitive Distortions'),
                              content: Container(
                                height: 300.sp,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak('Thinking in black or white, thinking in extremes. Uisng words such as "always" or "never" to describe yourself or situations. Examples No one likes me; i am always a bother to other people; i never win anything');
                                                },
                                                child: Text(
                                                  'All-or-nothing thinking',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbAll,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbAll = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak('Making a very broad conclusion based on one event; taking one situation and expecting the same result to happen in all future situations. Examples she cannot meet me for lunch today. This means she is not reliable at all');
                                                },
                                                child: Text(
                                                  'Overgeneralization',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbOver,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbOver = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak(
                                                      'Only focusing on the negative aspects of an experience while ignoring the positives. Focusing only on information that confirms what you already believe in. Examples He did not like the chicken i made for dinner but loved the vegetables and dessert. i feel that my cooking skills are terrible because the chicken was bad');
                                                },
                                                child: Text(
                                                  'Filtering out the positive',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbFilter,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbFilter = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak('Reaching a hasty conclusion or judging something without having enough facts. Examples she came home with a frown on her face, so she must be angry with me');
                                                },
                                                child: Text(
                                                  'Jumping to conclusions',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbJump,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbJump = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak(
                                                      'Assuming or inferring another persons thoughts or expecting for the worst possible scenario without actually confirming with the person or having solid evidence. Examples my friend did not wave back at me when i waved to her from across the street. She must be angry with me right now');
                                                },
                                                child: Text(
                                                  'Mind reading',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbMind,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbMind = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak('Predicting a negative outcome before the event happens. Examples the boss will definitely not like my presentation; my boyfriend will definitely hate my new haircut');
                                                },
                                                child: Text(
                                                  'Fortune-telling',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbFortune,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbFortune = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak(
                                                      'Putting greater emphasis on possible failures, weakness, or threats. Examples During my class presentation i made a couple of mistakes while talking. My teacher and peers complimented me on good presentation afterwards, but i continued to feel embarrased about the things i messed up on');
                                                },
                                                child: Text(
                                                  'Magnification of the negative',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbMagni,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbMagni = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak('Putting greater emphasis on possible success, strength or opportunity. Examples When someone compliments me, instead of feeling proud of my achievement i discount their compliments as simply being polite');
                                                },
                                                child: Text(
                                                  'Minimization of the positive',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbMini,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbMini = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak(
                                                      'Over-exaggerating; believing in the worse case scenario or thinking something is extremely unbearable or impossible when it actually is not that bad. Examples i knocked over that glass bottle and i feel mortified that everyone who is staring at me must think that i am a clumsy and useless person');
                                                },
                                                child: Text(
                                                  'Catastrophizing',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbCata,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbCata = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak('Believing that if you feel that something is true it must be true. Examples i feel so dumb and useless, therefore i must be dumb and useless');
                                                },
                                                child: Text(
                                                  'Emotional reasoning',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbEmot,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbEmot = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak('Thinking that you are obligated to do things; using "should" or "must" statements. Examples i should never feel angry. i should feel very guilty');
                                                },
                                                child: Text(
                                                  'Should / must statements',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbShould,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbShould = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak(
                                                      'Attributing a persons behaviors to his/her character or personality ("this is who she is all the time") rather than thinking its temporary or just for one event ("she just made a mistake"). Examples that driver honked at me at the intersection so he must be an angry person in general');
                                                },
                                                child: Text(
                                                  'Labeling',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbLabel,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbLabel = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak('Blaming yourself or thinking you are personally responsible for a situation that you actually have little control ever. Examples i was late to work because of a road accident, but i should have known that in advance');
                                                },
                                                child: Text(
                                                  'Self-blaming',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbSelf,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbSelf = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await speak('Blaming others  or holding other people responsible for things done to you that they may have little control over. Examples she should have been more careful when she knocked over that glass bottle');
                                                },
                                                child: Text(
                                                  'Other-blaming',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Checkbox(
                                                  value: cbOther,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      cbOther = newValue!;
                                                    });
                                                    // const Text('Remember me');
                                                  }),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Choose'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    bersihkan();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Cognitive Distortions'),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    TextField(
                      readOnly: true,
                      minLines: 4,
                      maxLines: 6,
                      decoration: InputDecoration(
                        label: Text('Challenge'),
                        prefixIcon: IconButton(
                            onPressed: () async {
                              await speak('Weigh the evidence in favor and against your interpretation of the situation. Challenge your negative thoughts and the distortions within them');
                            },
                            icon: Icon(Icons.question_mark)),
                        suffixIcon: IconButton(
                          onPressed: dengarinCha,
                          icon: Icon(dengarCha ? Icons.mic : Icons.mic_none),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      controller: chaText,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    TextField(
                      readOnly: true,
                      minLines: 4,
                      maxLines: 6,
                      decoration: InputDecoration(
                        label: Text('Alternative Thought'),
                        prefixIcon: IconButton(
                            onPressed: () async {
                              await speak('Having challenged your initial negative thought, write an alternative interpretation of the situation');
                            },
                            icon: Icon(Icons.question_mark)),
                        suffixIcon: IconButton(
                          onPressed: dengarinAlter,
                          icon: Icon(dengarAlter ? Icons.mic : Icons.mic_none),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      controller: alterText,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return DropdownButton(
                          isExpanded: true,
                          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                          value: selectedLevelStress2,
                          onChanged: (String? Value) {
                            setState(() {
                              selectedLevelStress2 = Value!;
                            });
                          },
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Choose Distress Level',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: 'Choose Distress Level',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '0 - No Distress',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '0',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '1',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '1',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '2 - Mild Distress',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '2',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '3',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '3',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '4',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '4',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '5 - Moderate Distress',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '5',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '6',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '6',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '7',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '7',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '8 - Severe Distress',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '8',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '9',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '9',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                '10 - Extreme Distress',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              value: '10',
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                        onPressed: () async {
                          var emotions = '';

                          Map<String, String> input = {};
                          input['iduser'] = idPhone;
                          input['title'] = titleText.text;
                          input['date'] = DateTime.now().toString().substring(0, 10);

                          if (cbangry == true) {
                            if (emotions == '') {
                              emotions = emotions + 'Angry';
                            } else {
                              emotions = emotions + ' , ' + 'Angry';
                            }
                          }
                          if (cbanxious == true) {
                            if (emotions == '') {
                              emotions = emotions + 'Anxious';
                            } else {
                              emotions = emotions + ' , ' + 'Anxious';
                            }
                          }
                          if (cbashamed == true) {
                            if (emotions == '') {
                              emotions = emotions + 'Ashamed';
                            } else {
                              emotions = emotions + ' , ' + 'Ashamed';
                            }
                          }
                          if (cbdisgusted == true) {
                            if (emotions == '') {
                              emotions = emotions + 'Disgusted';
                            } else {
                              emotions = emotions + ' , ' + 'Disgusted';
                            }
                          }
                          if (cbempty == true) {
                            if (emotions == '') {
                              emotions = emotions + 'Empty';
                            } else {
                              emotions = emotions + ' , ' + 'Empty';
                            }
                          }
                          if (cbguilty == true) {
                            if (emotions == '') {
                              emotions = emotions + 'Guilty';
                            } else {
                              emotions = emotions + ' , ' + 'Guilty';
                            }
                          }
                          if (cbhopeless == true) {
                            if (emotions == '') {
                              emotions = emotions + 'Hopeless';
                            } else {
                              emotions = emotions + ' , ' + 'Hopeless';
                            }
                          }
                          if (cbover == true) {
                            if (emotions == '') {
                              emotions = emotions + 'Overwhelmed';
                            } else {
                              emotions = emotions + ' , ' + 'Overwhelmed';
                            }
                          }
                          if (cbsad == true) {
                            if (emotions == '') {
                              emotions = emotions + 'Sad';
                            } else {
                              emotions = emotions + ' , ' + 'Sad';
                            }
                          }
                          if (cbscared == true) {
                            if (emotions == '') {
                              emotions = emotions + 'Scared';
                            } else {
                              emotions = emotions + ' , ' + 'Scared';
                            }
                          }
                          if (cbworthless == true) {
                            if (emotions == '') {
                              emotions = emotions + 'Worthless';
                            } else {
                              emotions = emotions + ' , ' + 'Worthless';
                            }
                          }

                          input['emotions'] = emotions;
                          input['beforeDistress'] = selectedLevelStress;
                          input['situation'] = descText.text;
                          input['negText'] = negText.text;
                          String cogDis = '';

                          if (cbAll == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'All-or-nothing thinking';
                            } else {
                              cogDis = cogDis + ' , ' + 'All-or-nothing thinking';
                            }
                          }
                          if (cbOver == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'Overgeneralization';
                            } else {
                              cogDis = cogDis + ' , ' + 'Overgeneralization';
                            }
                          }
                          if (cbFilter == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'Filtering out the positive';
                            } else {
                              cogDis = cogDis + ' , ' + 'Filtering out the positive';
                            }
                          }
                          if (cbJump == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'Jumping to conclusions';
                            } else {
                              cogDis = cogDis + ' , ' + 'Jumping to conclusions';
                            }
                          }
                          if (cbMind == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'Mind reading';
                            } else {
                              cogDis = cogDis + ' , ' + 'Mind reading';
                            }
                          }
                          if (cbFortune == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'Fortune-telling';
                            } else {
                              cogDis = cogDis + ' , ' + 'Fortune-telling';
                            }
                          }
                          if (cbMagni == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'Magnification of the negative';
                            } else {
                              cogDis = cogDis + ' , ' + 'Magnification of the negative';
                            }
                          }
                          if (cbMini == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'Minimization of the positive';
                            } else {
                              cogDis = cogDis + ' , ' + 'Minimization of the positive';
                            }
                          }
                          if (cbCata == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'Catastrophizing';
                            } else {
                              cogDis = cogDis + ' , ' + 'Catastrophizing';
                            }
                          }
                          if (cbEmot == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'Emotional reasoning';
                            } else {
                              cogDis = cogDis + ' , ' + 'Emotional reasoning';
                            }
                          }
                          if (cbShould == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'Should / must statements';
                            } else {
                              cogDis = cogDis + ' , ' + 'Should / must statements';
                            }
                          }
                          if (cbLabel == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'Labeling';
                            } else {
                              cogDis = cogDis + ' , ' + 'Labeling';
                            }
                          }
                          if (cbSelf == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'Self-blaming';
                            } else {
                              cogDis = cogDis + ' , ' + 'Self-blaming';
                            }
                          }
                          if (cbOther == true) {
                            if (cogDis == '') {
                              cogDis = cogDis + 'Other-blaming';
                            } else {
                              cogDis = cogDis + ' , ' + 'Other-blaming';
                            }
                          }

                          input['cogDis'] = cogDis;
                          input['challange'] = chaText.text;
                          input['alterText'] = alterText.text;
                          input['afterDistress'] = selectedLevelStress2;

                          String tanggal = DateTime.now().toString();
                          //1992-12-23
                          String tahun = tanggal.substring(0, 4);
                          String bulan = tanggal.substring(5, 7);
                          String hari = tanggal.substring(8, 10);
                          String jam = tanggal.substring(11, 13);
                          String menit = tanggal.substring(14, 16);
                          String detik = tanggal.substring(17, 19);

                          String docId = tahun + bulan + hari + jam + menit + detik;

                          await DatabaseServices.createDataWithDocId('diary', docId, input);
                          Navigator.of(context).pop();
                        },
                        child: Text('Add Diary'),
                      ),
                    )
                  ]),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
