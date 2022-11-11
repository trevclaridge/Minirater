part of view;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MRAppBar(
        appBar: AppBar(),
      ),
      body: FooterView(
        footer: MiniraterFooter._getFooter(),
        flex: 3,
        children: const <Widget>[
          Text('Scrollable View'),
        ],
      ),
    );
  }
}
