// ignore_for_file: avoid_print

part of view;

class CreatorProfilePage extends StatefulWidget {
  const CreatorProfilePage({Key? key}) : super(key: key);

  @override
  State<CreatorProfilePage> createState() => _CreatorProfilePageState();
}

class _CreatorProfilePageState extends State<CreatorProfilePage> {
  final ref = FirebaseDatabase.instance.ref('/creators/Loot Studios');
  Creator? creator;
  // var _displayStream;

  @override
  void initState() {
    super.initState();
    // _activateListeners();
    getCreator();
  }

  // @override
  // void deactivate() {
  //   _displayStream.cancel();
  //   super.deactivate();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MRAppBar(
        appBar: AppBar(),
      ),
      body: FooterView(
        footer: MiniraterFooter._getFooter(),
        flex: 3,
        children: <Widget>[
          Center(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Text(
                  creator?.name ?? 'Loading',
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  creator?.oaissRating ?? 'Loading',
                  style: const TextStyle(fontSize: 20.0),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: creator?.urls.length ?? 0,
                    itemBuilder: (context, index) {
                      return Text(creator?.urls.elementAt(index));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Creator> getCreator() async {
    final snapshot = await ref.get();
    if (snapshot.exists) {
      setState(() {
        creator = Creator.fromRTDB(
            snapshot.value as Map<dynamic, dynamic>, snapshot.key.toString());
      });

      return creator!;
    } else {
      throw 'Could not fetch creator profile';
    }
  }

  // void _activateListeners() {
  //   _displayStream = ref.child('/Codex Universalis').onValue.listen((event) {
  //     final String description = event.snapshot.value.toString();
  //     setState(() {
  //       _displayText = description;
  //     });
  //   });
  // }
}
