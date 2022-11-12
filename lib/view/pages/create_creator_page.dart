part of view;

class CreatorCreatorPage extends StatelessWidget {
  CreatorCreatorPage({Key? key}) : super(key: key);

  final _ref = FirebaseDatabase.instance.ref('/creators');
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _creatorNameController = TextEditingController();
  final TextEditingController _creatorUrlController = TextEditingController();

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Creator Name'),
                      TextFormField(
                        controller: _creatorNameController,
                        enableInteractiveSelection: true,
                        style: const TextStyle(color: Colors.white),
                        validator: _creatorNameValidator,
                      ),
                      const SizedBox(height: 30.0),
                      const Text('URL'),
                      TextFormField(
                        controller: _creatorUrlController,
                        enableInteractiveSelection: true,
                        style: const TextStyle(color: Colors.white),
                        validator: _creatorNameValidator,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var _creatorName = _creatorNameController.text;
                      var _creatorUrl = _creatorUrlController.text;
                      final Map<String, Map> creator = {
                        _creatorName: {'creator_url': _creatorUrl},
                      };
                      await _ref.update(creator);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Processing Data'),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     await _ref
              //         .update({'test': 'test data', 'another test': 3.6})
              //         .then((_) => ScaffoldMessenger.of(context).showSnackBar(
              //             const SnackBar(content: Text('Data has been sent'))))
              //         .catchError((error) => print('You got an error! $error'));
              //   },
              //   child: const Text('write the data'),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  String? _creatorNameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
