part of view;

class MiniraterFooter {
  static Footer _getFooter() {
    return Footer(
      backgroundColor: Colors.black54,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const SizedBox(height: 35.0),
              Image.asset('assets/images/once_logo_justdice_nobackground.png'),
              const SizedBox(height: 15.0),
              const Text('© 2022', style: TextStyle(color: Colors.white54))
            ],
          ),
          Container(color: Colors.black26, width: 1.0, height: 150.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Column(
                  children: const [
                    Text(
                      'Minirater',
                      style: TextStyle(
                          color: Palette.accentYellow, fontSize: 17.0),
                    ),
                    SizedBox(height: 12.0),
                    FooterItem(text: 'Help', uri: ''),
                    SizedBox(height: 10.0),
                    FooterItem(
                        text: 'About',
                        uri:
                            'https://drive.google.com/file/d/1SMQgKEQ92M39wVSH61QO7wYyf1dD3yMt/view'),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Column(
              children: const [
                Text(
                  'Once In a Six Side',
                  style: TextStyle(color: Palette.accentYellow, fontSize: 17.0),
                ),
                SizedBox(height: 12.0),
                FooterItem(
                    text: 'YouTube',
                    uri: 'https://www.youtube.com/c/OnceinaSixSide'),
                SizedBox(height: 10.0),
                FooterItem(
                    text: 'Cults3D',
                    uri: 'https://cults3d.com/en/users/Once/creations'),
                SizedBox(height: 10.0),
                FooterItem(
                    text: 'Buy Me A Coffee',
                    uri: 'https://www.buymeacoffee.com/onceinasixside'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Column(
              children: const [
                Text(
                  'Other Projects',
                  style: TextStyle(color: Palette.accentYellow, fontSize: 17.0),
                ),
                SizedBox(height: 10.0),
                FooterItem(
                    text: '3DPrintProfile',
                    uri: 'https://github.com/trevclaridge/3DPrintProfile'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
