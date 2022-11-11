part of view;

class MRAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MRAppBar({
    Key? key,
    required this.appBar,
  }) : super(key: key);

  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text.rich(
        TextSpan(
          text: 'MINI',
          style: TextStyle(
              color: Palette.miniraterOrange, fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
              text: 'RATER',
              style: TextStyle(
                  color: Palette.textGrey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
