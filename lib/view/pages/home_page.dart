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
        flex: 4,
        children: <Widget>[
          Column(
            children: [
              DataTable(
                columnSpacing: 30.0,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Creator',
                        style: TextStyle(color: Palette.textGrey),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Once\'s Rating',
                        style: TextStyle(color: Palette.textGrey),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Flexible(
                      child: Text(
                        'Rated On',
                        style: TextStyle(color: Palette.textGrey),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Community Rating',
                        style: TextStyle(color: Palette.textGrey),
                      ),
                    ),
                  ),
                ],
                rows: List<DataRow>.generate(
                  5,
                  (index) => DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text('Row $index'),
                      ),
                      const DataCell(
                        Text('a letter'),
                      ),
                      const DataCell(
                        Text('a date'),
                      ),
                      const DataCell(
                        Text('a letter'),
                      ),
                    ],
                  ),
                ),
              ),
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
}
