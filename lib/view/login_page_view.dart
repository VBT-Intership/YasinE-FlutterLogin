import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/core/ui_helper.dart';
import 'package:login_app/view/welcome.dart';
import 'package:progress_state_button/progress_button.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key, @required String title}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(flex: 1),
          Expanded(flex: 6,child: buildBody(context)),
          Spacer(flex: 3)
        ],
      ),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topBarWidget(),
        buildTextWelcome(),
        _buildEmailField(),
        buildPasswordField(),
        buildSignupButton(context),
      ],
    );
  }

  Padding buildTextWelcome() {
    return Padding(
          padding: EdgeInsets.only(bottom: 15,top: 15),
          child: Card(
        
        child: ListTile(
          title: Text(
            UIHelper.welcome,
            style: _welcomeTextStyle(),
          ),
          subtitle:
              Text(UIHelper.welcomeSubtitle, style: _welcomeSubtitleTextStyle()),
        ),
      ),
    );
  }

  TextStyle _welcomeSubtitleTextStyle() => TextStyle(
      fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black87);

  TextStyle _welcomeTextStyle() {
    return Theme.of(context)
        .textTheme
        .headline4
        .copyWith(color: Colors.black, fontWeight: FontWeight.w300);
  }

  Widget buildSignupButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ProgressButton(
        maxWidth: 100.0,
        minWidth: 200.0,
        stateWidgets: {
          ButtonState.idle: Text(
            UIHelper.signIn,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          ButtonState.loading: Text(
            UIHelper.loading,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          ButtonState.fail: Text(
            UIHelper.fail,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          ButtonState.success: Text(
            UIHelper.success,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          )
        },
        stateColors: {
          ButtonState.idle: Colors.blueAccent,
          ButtonState.loading: Colors.blue.shade300,
          ButtonState.fail: Colors.red.shade300,
          ButtonState.success: Colors.green.shade400,
        },
        onPressed: onPressedCustomButton,
        state: stateOnlyText,
        padding: EdgeInsets.all(8.0),
      ),
    );
  }

  TextFormField _buildEmailField() {
    return TextFormField(
      autofocus: true,
      validator: (value) {
        return value.contains(RegExp(r'[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}'))
            ? null
            : "Invalid E-mail";
      },
      obscureText: false,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: UIHelper.email,
          labelStyle: TextStyle(fontStyle: FontStyle.italic)),
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextField buildPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        suffixIcon: FlatButton(
          shape: StadiumBorder(),
          onPressed: () {},
          child: Text(UIHelper.forgotPassword,
              style: _buildForgotPasswordTextStyle(context)),
        ),
        labelText: UIHelper.password,
        labelStyle: TextStyle(fontStyle: FontStyle.italic),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextStyle _buildForgotPasswordTextStyle(BuildContext context) =>
      Theme.of(context)
          .textTheme
          .button
          .copyWith(color: Colors.blue, fontWeight: FontWeight.w400);

  Widget _topBarWidget() => InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Hysys',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 5, bottom: 0),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.blue,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              Row(children: [
                Text(UIHelper.subTitle1,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
              ]),
            ],
          ),
        ),
      );

  void onPressedCustomButton() {
    setState(() {
      switch (stateOnlyText) {
        case ButtonState.idle:
          stateOnlyText = ButtonState.loading;
          break;
        case ButtonState.loading:
          stateOnlyText = ButtonState.fail;
          break;
        case ButtonState.success:
          stateOnlyText = ButtonState.idle;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WelcomeView()),
          );

          break;
        case ButtonState.fail:
          stateOnlyText = ButtonState.success;
          break;
      }
    });
  }
}
