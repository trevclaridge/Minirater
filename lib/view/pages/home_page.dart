part of view;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _creatorsRef = FirebaseDatabase.instance.ref('/creators');
  final _numCreatorsRef = FirebaseDatabase.instance.ref('/num_creators');

  List<dynamic> _creators = [];
  var _numCreators = '0';

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MRAppBar(
        appBar: AppBar(),
      ),
      body: FooterView(
        footer: MiniraterFooter._getFooter(),
        flex: 4,
        children: <Widget>[
          Column(
            children: [
              // DataTable(
              //   columnSpacing: 30.0,
              //   columns: const <DataColumn>[
              //     DataColumn(
              //       label: Expanded(
              //         child: Text(
              //           'Creator',
              //           style: TextStyle(color: Palette.textGrey),
              //         ),
              //       ),
              //     ),
              //     DataColumn(
              //       label: Expanded(
              //         child: Text(
              //           'Once\'s Rating',
              //           style: TextStyle(color: Palette.textGrey),
              //         ),
              //       ),
              //     ),
              //     DataColumn(
              //       label: Flexible(
              //         child: Text(
              //           'Rated On',
              //           style: TextStyle(color: Palette.textGrey),
              //         ),
              //       ),
              //     ),
              //     DataColumn(
              //       label: Expanded(
              //         child: Text(
              //           'Community Rating',
              //           style: TextStyle(color: Palette.textGrey),
              //         ),
              //       ),
              //     ),
              //   ],
              //   rows: List<DataRow>.generate(
              //     int.parse(_numCreators),
              //     (index) => const DataRow(
              //       cells: <DataCell>[
              //         DataCell(
              //           Text('idk'),
              //         ),
              //         DataCell(
              //           Text('a letter'),
              //         ),
              //         DataCell(
              //           Text('a date'),
              //         ),
              //         DataCell(
              //           Text('a letter'),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: int.parse(_numCreators),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _creators.elementAt(index).keys.toList().first,
                      style: const TextStyle(color: Palette.textGrey),
                    ),
                    subtitle: Text(
                      _creators
                          .elementAt(index)
                          .values
                          .toList()[0]
                          .values
                          .toList()
                          .elementAt(0),
                    ),
                    onTap: () =>
                        Navigator.pushNamed(context, 'creator_profile'),
                  );
                },
              ),
              Text(
                  'Number of creators registered with Minirater: $_numCreators'),

              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'creator_profile');
                },
                child: const Text('Read'),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'create_creator');
                },
                child: const Text('Add a New Creator'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _getData() async {
    final snapshotCreators = await _creatorsRef.get();
    final snapshotNum = await _numCreatorsRef.get();
    if (snapshotNum.exists && snapshotCreators.exists) {
      setState(() {
        _numCreators = snapshotNum.value.toString();
        final creators = snapshotCreators.value as Map<dynamic, dynamic>;
        creators.forEach(
          (key, value) {
            Map<String, dynamic> creator = {key: value};
            _creators.add(creator);
          },
        );
        print(_creators.elementAt(0).values.toList()[0].values.toList().first);
      });
    } else {
      setState(() {
        print('Error in retrieving data');
      });
    }
  }
}
