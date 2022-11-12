part of view;

class CreatorProfilePage extends StatefulWidget {
  CreatorProfilePage({Key? key}) : super(key: key);

  @override
  State<CreatorProfilePage> createState() => _CreatorProfilePageState();
}

class _CreatorProfilePageState extends State<CreatorProfilePage> {
  final ref = FirebaseDatabase.instance.ref();

  String displayText = 'Results go here';

  void getText() async {
    final snapshot = await ref.get();
    if (snapshot.exists) {
      print(snapshot.value);
      setState(() {
        displayText = 'Check the console';
      });
    } else {
      setState(() {
        displayText = 'No data available.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getText();
    return Scaffold(
      appBar: MRAppBar(
        appBar: AppBar(),
      ),
      body: FooterView(
        footer: MiniraterFooter._getFooter(),
        flex: 3,
        children: <Widget>[
          Center(child: Text(displayText)),
        ],
      ),
    );
  }
}
