import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mymood/services/dbServices.dart';
import 'package:sizer/sizer.dart';
import 'package:unique_identifier/unique_identifier.dart';

class activityWidget extends StatefulWidget {
  const activityWidget({super.key});

  @override
  State<activityWidget> createState() => _activityWidgetState();
}

class _activityWidgetState extends State<activityWidget> {
  final FlutterTts flutterTts = FlutterTts();
  String idPhone = 'Unknown';
  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  String selectedMoodBefore = 'Choose Mood Before';
  String selectedMoodAfter = 'Choose Mood After';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUniqueIdentifierState();
  }

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

  String activity = '';

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
                    'Activities',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                ),
              ),
            ),
            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('activity').where('iduser', isEqualTo: idPhone).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
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
                                      await DatabaseServices.deleteDataFirestore('activity', snapshot.data!.docs[index].id);
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
                            leading: snapshot.data!.docs[index]['activity'].toString() != ''
                                ? Image.asset(
                                    "assets/gif/${snapshot.data!.docs[index]['activity'].toString()}.gif",
                                    fit: BoxFit.fill,
                                    width: 100,
                                  )
                                : CircularProgressIndicator(),
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
                                  'Mood Before           : ${snapshot.data!.docs[index]['moodBefore']}',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Mood After              : ${snapshot.data!.docs[index]['moodAfter']}',
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
            activity = '';
            await showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(
                            'Activities',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 3,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await speak('Walking, jogging, or perform other forms of exercise. Even light physical activity can help you feel more upbeat');
                                Navigator.of(context).pop();
                                activity = 'exercise';
                                selectedMoodAfter = 'Choose Mood After';
                                selectedMoodBefore = 'Choose Mood Before';
                                await addActivity(context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/gif/exercise.gif",
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          'Exercise',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await speak("Contact a friend, Family member, or old friend that you can trust and have a conversation");
                                Navigator.of(context).pop();
                                activity = 'conversation';
                                selectedMoodAfter = 'Choose Mood After';
                                selectedMoodBefore = 'Choose Mood Before';
                                await addActivity(context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/gif/conversation.gif",
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          'Reach Out',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await speak('Spend some time on a hobby that you enjoy or used to enjoy. Set a reasonable goal and try to accomplish it');
                                Navigator.of(context).pop();
                                activity = 'hobby';
                                selectedMoodAfter = 'Choose Mood After';
                                selectedMoodBefore = 'Choose Mood Before';
                                await addActivity(context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/gif/hobby.gif",
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          'Hobby',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await speak('Take 15 minutes to meditate by focusing on your breathing. you may find it helpful to follow a video tutorial');
                                Navigator.of(context).pop();
                                activity = 'meditation';
                                selectedMoodAfter = 'Choose Mood After';
                                selectedMoodBefore = 'Choose Mood Before';
                                await addActivity(context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/gif/meditation.gif",
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          'Mindfulness Meditation',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await speak('Volunteer in your community, go outside and greet someone with a smile, help a friend with a favor. Focusing on helping others can provide you with benefits as well');
                                Navigator.of(context).pop();
                                activity = 'help';
                                selectedMoodAfter = 'Choose Mood After';
                                selectedMoodBefore = 'Choose Mood Before';
                                await addActivity(context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/gif/help.gif",
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          'Help Others',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await speak('Make a list of everything you are grateful for or write a letter of gratitude to someone');
                                Navigator.of(context).pop();
                                activity = 'gratitude';
                                selectedMoodAfter = 'Choose Mood After';
                                selectedMoodBefore = 'Choose Mood Before';
                                await addActivity(context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/gif/gratitude.gif",
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          'Practice Grattitude',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await speak('Go to a social activity or participate in a support group');
                                Navigator.of(context).pop();
                                activity = 'socialize';
                                selectedMoodAfter = 'Choose Mood After';
                                selectedMoodBefore = 'Choose Mood Before';
                                await addActivity(context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/gif/socialize.gif",
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          'Socialize',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await speak('Take care of some small tasks you have been putting off. For Example, clean something or somewhere. Set a reasonable goal and try to accomplish it');
                                Navigator.of(context).pop();
                                activity = 'chores';
                                selectedMoodAfter = 'Choose Mood After';
                                selectedMoodBefore = 'Choose Mood Before';
                                await addActivity(context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/gif/chores.gif",
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          'Chores',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await speak('Take 15 minutes to relax using whatever technique you prefer. You may find it helpful to follow a video tutorial');
                                Navigator.of(context).pop();
                                activity = 'relax';
                                selectedMoodAfter = 'Choose Mood After';
                                selectedMoodBefore = 'Choose Mood Before';
                                await addActivity(context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/gif/relax.gif",
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          'Relax',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await speak('Watch a funny TV show, movie, or youtube clip! Laughter can help improve your mood');
                                Navigator.of(context).pop();
                                activity = 'comedy';
                                selectedMoodAfter = 'Choose Mood After';
                                selectedMoodBefore = 'Choose Mood Before';
                                await addActivity(context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/gif/comedy.gif",
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          'Watch a comedy',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await speak('Read a few chapters of an interesting book. Set a reasonable goal and try to accomplish it. A self-help book for depression may help improve your mood');
                                Navigator.of(context).pop();
                                activity = 'readbook';
                                selectedMoodAfter = 'Choose Mood After';
                                selectedMoodBefore = 'Choose Mood Before';
                                await addActivity(context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/gif/readbook.gif",
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          'Read a book',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await speak('Watch a helpful TED talk or some other video relating to depression on Youtube');
                                Navigator.of(context).pop();
                                activity = 'therapeutic';
                                selectedMoodAfter = 'Choose Mood After';
                                selectedMoodBefore = 'Choose Mood Before';
                                await addActivity(context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/gif/therapeutic.gif",
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          'Watch a therapeutic video',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await speak('Bathe in the sunshine outside! if you live in place with little sunshine, consider using a light therapy box');
                                Navigator.of(context).pop();
                                activity = 'sunlight';
                                selectedMoodAfter = 'Choose Mood After';
                                selectedMoodBefore = 'Choose Mood Before';
                                await addActivity(context);
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/gif/sunlight.gif",
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          'Get Sunlight',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.redAccent,
          child: Icon(
            Icons.add,
          )),
    );
  }

  Future<dynamic> addActivity(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose your Mood'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StatefulBuilder(
                  builder: (context, setState) {
                    return DropdownButton(
                      isExpanded: true,
                      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                      value: selectedMoodBefore,
                      onChanged: (String? Value) {
                        setState(() {
                          selectedMoodBefore = Value!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Choose Mood Before',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: 'Choose Mood Before',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '0 - Horrible',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '0 - Horrible',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '1 - Extremely Sad',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '1 - Extremely Sad',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '2 - Very Sad',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '2 - Very Sad',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '3 - Sad',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '3 - Sad',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '4 - Slightly Sad',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '4 - Slightly Sad',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '5 - Neutral',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '5 - Neutral',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '6 - Slightly Happy',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '6 - Slightly Happy',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '7 - Happy',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '7 - Happy',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '8 - Very Happy',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '8 - Very Happy',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '9 - Extremely Happy',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '9 - Extremely Happy',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '10 - Ecstatic',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '10 - Ecstatic',
                        ),
                      ],
                    );
                  },
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    return DropdownButton(
                      isExpanded: true,
                      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                      value: selectedMoodAfter,
                      onChanged: (String? Value) {
                        setState(() {
                          selectedMoodAfter = Value!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Choose Mood After',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: 'Choose Mood After',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '0 - Horrible',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '0 - Horrible',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '1 - Extremely Sad',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '1 - Extremely Sad',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '2 - Very Sad',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '2 - Very Sad',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '3 - Sad',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '3 - Sad',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '4 - Slightly Sad',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '4 - Slightly Sad',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '5 - Neutral',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '5 - Neutral',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '6 - Slightly Happy',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '6 - Slightly Happy',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '7 - Happy',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '7 - Happy',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '8 - Very Happy',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '8 - Very Happy',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '9 - Extremely Happy',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '9 - Extremely Happy',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            '10 - Ecstatic',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          value: '10 - Ecstatic',
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  if (selectedMoodBefore != 'Choose Mood Before' && selectedMoodAfter != 'Choose Mood After') {
                    Map<String, String> input = {};
                    input['iduser'] = idPhone;
                    input['date'] = DateTime.now().toString().substring(0, 10);
                    input['activity'] = activity;
                    input['moodBefore'] = selectedMoodBefore;
                    input['moodAfter'] = selectedMoodAfter;
                    String tanggal = DateTime.now().toString();
                    //1992-12-23
                    String tahun = tanggal.substring(0, 4);
                    String bulan = tanggal.substring(5, 7);
                    String hari = tanggal.substring(8, 10);
                    String jam = tanggal.substring(11, 13);
                    String menit = tanggal.substring(14, 16);
                    String detik = tanggal.substring(17, 19);

                    String docId = tahun + bulan + hari + jam + menit + detik;

                    await DatabaseServices.createDataWithDocId('activity', docId, input);
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Save')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'))
          ],
        );
      },
    );
  }
}
