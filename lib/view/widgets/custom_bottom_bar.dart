import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/constants/constans.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _BottomItem(
              icon: Icons.language,
              label: 'POOL OF EXPERT',
              index: Routes.poolExpert),
          _BottomItem(
              icon: Icons.dashboard, label: 'COURSES', index: Routes.courses),
          _BottomItem(
              icon: Icons.person, label: 'PROFILE', index: Routes.profile)
        ],
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final int index;
  const _BottomItem(
      {required this.label, required this.icon, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<Routes>().currentIndex == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: () => context.read<Routes>().currentIndex = index,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.translate(
              offset: Offset(0, isSelected ? -30 : 0),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  MaterialButton(
                    onPressed: () => context.read<Routes>().currentIndex = index,
                    elevation: isSelected ? 1 : 0,
                    shape: const CircleBorder(),
                    color: isSelected ? accentColor : Colors.white,
                    highlightElevation: 0,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Icon(icon,
                          size: isSelected ? 30 : 25,
                          color: isSelected ? Colors.white : accentColor),
                    ),
                  ),
                  Transform.translate(
                      offset: Offset(0, isSelected ? 25 : 0),
                      child: Text(
                        label,
                        style: GoogleFonts.workSans(
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            color: mediumGrey),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
