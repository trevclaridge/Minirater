// ignore_for_file: use_build_context_synchronously

part of view;

class CreatorCreatorPage extends StatefulWidget {
  const CreatorCreatorPage({Key? key}) : super(key: key);

  @override
  State<CreatorCreatorPage> createState() => _CreatorCreatorPageState();
}

class _CreatorCreatorPageState extends State<CreatorCreatorPage> {
  final _refCreator = FirebaseDatabase.instance.ref('/creators');
  final _refAttributes = FirebaseDatabase.instance.ref('/creators_attributes');
  final _refNumCreators = FirebaseDatabase.instance.ref('/num_creators');

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _creatorNameController = TextEditingController();
  final TextEditingController _creatorUrlController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  bool? _noCloudBackup = false;
  bool? _minorErrors = false;
  bool? _unorganizedFiles = false;
  bool? _noRenders = false;
  bool? _noSlicerFiles = false;
  bool? _unsupportedIslands = false;
  bool? _unsupportedFiles = false;
  bool? _printFailures = false;
  bool? _majorErrors = false;
  String? _rating = 'N/A';

  @override
  Widget build(BuildContext context) {
    var isScreenWide = MediaQuery.of(context).size.width > 720;
    return Scaffold(
      appBar: MRAppBar(
        appBar: AppBar(),
      ),
      body: FooterView(
        footer: MiniraterFooter._getFooter(),
        flex: 4,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: Text('Creator Name'),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'ex. Cyber-Forge Miniatures',
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: Colors.black26),
                          fillColor: Colors.white70,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                        controller: _creatorNameController,
                        enableInteractiveSelection: true,
                        validator: _creatorNameValidator,
                      ),
                      const SizedBox(height: 30.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: Text('URL'),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText:
                              'ex. https://www.patreon.com/cyberforgeminis',
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: Colors.black26),
                          fillColor: Colors.white70,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                        controller: _creatorUrlController,
                        enableInteractiveSelection: true,
                        validator: _creatorURLValidator,
                      ),
                      const SizedBox(height: 30.0),
                      isScreenWide
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 300.0,
                                  child: Column(
                                    children: [
                                      CheckboxListTile(
                                        title: const Text(
                                          'No Cloud Backups',
                                          style: TextStyle(
                                              color: Palette.textGrey),
                                        ),
                                        checkColor: Palette.aTierBlue,
                                        value: _noCloudBackup,
                                        onChanged: (bool? value) {
                                          setState(
                                            () {
                                              _noCloudBackup = value;
                                            },
                                          );
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text(
                                          'Minor Errors',
                                          style: TextStyle(
                                              color: Palette.textGrey),
                                        ),
                                        checkColor: Palette.aTierBlue,
                                        value: _minorErrors,
                                        onChanged: (bool? value) {
                                          setState(
                                            () {
                                              _minorErrors = value;
                                            },
                                          );
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text(
                                          'Unorganized Files',
                                          style: TextStyle(
                                              color: Palette.textGrey),
                                        ),
                                        checkColor: Palette.aTierBlue,
                                        value: _unorganizedFiles,
                                        onChanged: (bool? value) {
                                          setState(
                                            () {
                                              _unorganizedFiles = value;
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 300.0,
                                  child: Column(
                                    children: [
                                      CheckboxListTile(
                                        title: const Text(
                                          'No Renders',
                                          style: TextStyle(
                                              color: Palette.textGrey),
                                        ),
                                        checkColor: Palette.aTierBlue,
                                        value: _noRenders,
                                        onChanged: (bool? value) {
                                          setState(
                                            () {
                                              _noRenders = value;
                                            },
                                          );
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text(
                                          'No Slicer Files',
                                          style: TextStyle(
                                              color: Palette.textGrey),
                                        ),
                                        checkColor: Palette.aTierBlue,
                                        value: _noSlicerFiles,
                                        onChanged: (bool? value) {
                                          setState(
                                            () {
                                              _noSlicerFiles = value;
                                            },
                                          );
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text(
                                          'Unsupported Islands',
                                          style: TextStyle(
                                              color: Palette.textGrey),
                                        ),
                                        checkColor: Palette.aTierBlue,
                                        value: _unsupportedIslands,
                                        onChanged: (bool? value) {
                                          setState(
                                            () {
                                              _unsupportedIslands = value;
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          : Column(
                              children: [
                                Column(
                                  children: [
                                    CheckboxListTile(
                                      title: const Text(
                                        'No Cloud Backups',
                                        style:
                                            TextStyle(color: Palette.textGrey),
                                      ),
                                      checkColor: Palette.aTierBlue,
                                      value: _noCloudBackup,
                                      onChanged: (bool? value) {
                                        setState(
                                          () {
                                            _noCloudBackup = value;
                                          },
                                        );
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text(
                                        'Minor Errors',
                                        style:
                                            TextStyle(color: Palette.textGrey),
                                      ),
                                      checkColor: Palette.aTierBlue,
                                      value: _minorErrors,
                                      onChanged: (bool? value) {
                                        setState(
                                          () {
                                            _minorErrors = value;
                                          },
                                        );
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text(
                                        'Unorganized Files',
                                        style:
                                            TextStyle(color: Palette.textGrey),
                                      ),
                                      checkColor: Palette.aTierBlue,
                                      value: _unorganizedFiles,
                                      onChanged: (bool? value) {
                                        setState(
                                          () {
                                            _unorganizedFiles = value;
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                    'No Renders',
                                    style: TextStyle(color: Palette.textGrey),
                                  ),
                                  checkColor: Palette.aTierBlue,
                                  value: _noRenders,
                                  onChanged: (bool? value) {
                                    setState(
                                      () {
                                        _noRenders = value;
                                      },
                                    );
                                  },
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                    'No Slicer Files',
                                    style: TextStyle(color: Palette.textGrey),
                                  ),
                                  checkColor: Palette.aTierBlue,
                                  value: _noSlicerFiles,
                                  onChanged: (bool? value) {
                                    setState(
                                      () {
                                        _noSlicerFiles = value;
                                      },
                                    );
                                  },
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                    'Unsupported Islands',
                                    style: TextStyle(color: Palette.textGrey),
                                  ),
                                  checkColor: Palette.aTierBlue,
                                  value: _unsupportedIslands,
                                  onChanged: (bool? value) {
                                    setState(
                                      () {
                                        _unsupportedIslands = value;
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                      const SizedBox(height: 30.0),
                      CheckboxListTile(
                        title: const Text(
                          'Unsupported Files',
                          style: TextStyle(color: Palette.bTierRed),
                        ),
                        checkColor: Palette.bTierRed,
                        value: _unsupportedFiles,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              _unsupportedFiles = value;
                            },
                          );
                        },
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Print Failures',
                          style: TextStyle(color: Palette.bTierRed),
                        ),
                        value: _printFailures,
                        checkColor: Palette.bTierRed,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              _printFailures = value;
                            },
                          );
                        },
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Major Errors',
                          style: TextStyle(color: Palette.bTierRed),
                        ),
                        checkColor: Palette.bTierRed,
                        value: _majorErrors,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              _majorErrors = value;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Once\'s Rating'),
                      ),
                      const SizedBox(height: 5.0),
                      DropdownButtonFormField<String>(
                        isDense: true,
                        dropdownColor: Colors.black,
                        style: const TextStyle(color: Palette.textGrey),
                        value: _rating,
                        items: const [
                          DropdownMenuItem(
                            value: 'N/A',
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Not ready to rate this one',
                                style: TextStyle(color: Palette.textGrey),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'S',
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'S Tier',
                                style: TextStyle(
                                  color: Palette.sTierGreen,
                                ),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'A',
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'A Tier',
                                style: TextStyle(color: Palette.aTierBlue),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'B',
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'B Tier',
                                style: TextStyle(color: Palette.bTierRed),
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _rating = value;
                          });
                        },
                      ),
                      const SizedBox(height: 30.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: Text('Once\'s Notes'),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'optional blah blah blahs',
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: Colors.black26),
                          fillColor: Colors.white70,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                        controller: _notesController,
                        enableInteractiveSelection: true,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var creatorName = _creatorNameController.text;
                      var creatorUrl = _getUrls(_creatorUrlController.text);
                      var oncesNotes = _notesController.text;
                      var date =
                          (_rating != 'N/A') ? DateTime.now().toString() : null;
                      final Map<String, Map> creator = {
                        creatorName: {
                          'creator_urls': creatorUrl,
                          'oaiss_rating': _rating,
                          'oaiss_rating_date': date,
                          'oaiss_notes': oncesNotes
                        },
                      };
                      final Map<String, Map> creatorAttributes = {
                        creatorName: {
                          'attributes': {
                            'creator_urls': creatorUrl,
                            'no_cloud_backup': _noCloudBackup,
                            'minor_errors': _minorErrors,
                            'unorganized_files': _unorganizedFiles,
                            'no_renders': _noRenders,
                            'no_slicer_files': _noSlicerFiles,
                            'unsupported_islands': _unsupportedIslands,
                            'unsupported_files': _unsupportedFiles,
                            'print_failures': _printFailures,
                            'major_errors': _majorErrors,
                            'date_added': DateTime.now().toString(),
                            'oaiss_rating': _rating,
                            'oaiss_rating_date': date,
                            'oaiss_notes': oncesNotes
                          }
                        }
                      };
                      await _refCreator.update(creator);
                      await _refAttributes.update(creatorAttributes);
                      await _refNumCreators.set(ServerValue.increment(1));
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
            ],
          ),
        ],
      ),
    );
  }

  List<String> _getUrls(String? text) {
    List<String> urls = [];
    var splitText = text!.split(',');
    for (var url in splitText) {
      urls.add(url);
    }
    return urls;
  }

  String? _creatorNameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name for this creator';
    }
    return null;
  }

  String? _creatorURLValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter at least one URL for this creator';
    }
    for (var url in _getUrls(value)) {
      if (!url.toString().contains("http")) {
        return 'One of your URLs does not include http or https';
      }
    }
    return null;
  }
}
