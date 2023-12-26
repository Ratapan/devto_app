import 'package:devto_app/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class QuickFloatingActionBtn extends StatefulWidget {
  const QuickFloatingActionBtn({super.key});

  @override
  State<QuickFloatingActionBtn> createState() => _QuickFloatingActionBtnState();
}

bool toggle = true;

class _QuickFloatingActionBtnState extends State<QuickFloatingActionBtn> {
  @override
  Widget build(BuildContext context) {
    bool floatingButtonLeft =
        Provider.of<BtnPositionProvider>(context, listen: false)
            .currentPosition;
    print('floatingButtonLeft: $floatingButtonLeft');

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: 200.0,
          width: 200.0,
          color: Colors.amber,
          child: const Stack(
            children: [
              MainOptions(),
              ActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}

//Box de opciones

class MainOptions extends StatefulWidget {
  const MainOptions({
    super.key,
  });

  @override
  State<MainOptions> createState() => _MainOptionsState();
}

class _MainOptionsState extends State<MainOptions> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: toggle
          ? const Duration(milliseconds: 200)
          : const Duration(milliseconds: 400),
      curve: toggle ? Curves.easeOut : Curves.easeIn,
    );
  }
}

//Boton de opciones

class ActionButton extends StatefulWidget {
  const ActionButton({
    super.key,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  Alignment alignmentA = const Alignment(0.0, 0.0);
  Alignment alignmentB = const Alignment(0.0, 0.0);
  Alignment alignmentC = const Alignment(0.0, 0.0);

  double size1 = 50.0;
  double size2 = 50.0;

  @override
  Widget build(BuildContext context) {
    var buttonBoxDecoration = BoxDecoration(
      color: Colors.deepPurple[100],
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .3),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 2),
        )
      ],
    );

    return Align(
      alignment: Alignment.center,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        height: toggle ? 40 : 38,
        width: toggle ? 40 : 38,
        decoration: buttonBoxDecoration,
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            padding: EdgeInsets.zero,
            splashColor: Colors.deepPurple[100],
            splashRadius: 16,
            icon: Icon(
              toggle ? Icons.grain_outlined : Icons.close_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                toggle = !toggle;
              });
            },
          ),
        ),
      ),
    );
  }
}
