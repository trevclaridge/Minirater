part of view;

class FooterItem extends StatefulWidget {
  const FooterItem({Key? key, required this.text, required this.uri})
      : super(key: key);

  final String text;
  final String uri;

  @override
  State<FooterItem> createState() => _FooterItemState();
}

class _FooterItemState extends State<FooterItem> {
  Color _textColor = Colors.white54;

  void _onHover(PointerEvent details) {
    setState(() {
      _textColor = Colors.white;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _textColor = Colors.white54;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: _onHover,
      onExit: _onExit,
      child: GestureDetector(
        onTap: () {
          _launchUrl();
        },
        child: Text(
          widget.text,
          style: TextStyle(color: _textColor),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(widget.uri))) {
      throw 'Could not launch ${widget.uri}';
    }
  }
}
