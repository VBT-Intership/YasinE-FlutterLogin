import 'package:flutter/material.dart';
import 'package:login_app/core/ui_helper.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBuildWelcomeIcon(context),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            UIHelper.singSuccess,
            style: buildBuildSignSuccessTextStyle(context),
          ),
        ),
        buildWelcomeText(context),
        SizedBox(height: 20),
      ],
    ));
  }

  buildBuildSignSuccessTextStyle(BuildContext context) =>
      TextStyle(fontSize: 16, color: Colors.black54);

  buildWelcomeText(BuildContext context) => Container(
        child: Text(
          "Welcome to App",
          style: welcomeTextStyle(context),
        ),
      );

  _buildBuildWelcomeIcon(BuildContext context) => Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.14,
          width: MediaQuery.of(context).size.width * 0.22,
          decoration: buildBoxDecoration,
          child: buildSuccessIcon(),
        ),
      );
  BoxDecoration get buildBoxDecoration => BoxDecoration(
      color: Colors.white, shape: BoxShape.circle, boxShadow: [buildBoxShadow]);

  BoxShadow get buildBoxShadow =>
      BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5));
  Image buildSuccessIcon() =>
      Image(image: AssetImage('assets/success_icon.png'));

  RadialGradient get buildRadialGradient {
    return RadialGradient(
      center: Alignment.topRight,
      radius: 0.45,
      colors: <Color>[Color(0xFF5DACED), Color(0xFF351398)],
      tileMode: TileMode.mirror,
    );
  }

  TextStyle welcomeTextStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .headline4
      .copyWith(color: Colors.black, fontWeight: FontWeight.w300);
}
