import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:successproject/provider/page_notifier.dart';

class AuthPage extends Page{

  static final pageName = 'AuthPage';

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings:this,builder: (context)=>AuthWidget());
  }
}

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cPasswordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  bool isRegister = true;

  Duration _duration = Duration(milliseconds: 300);
  Curve _curve = Curves.fastOutSlowIn;

  static final double _cornerRadius = 8.0;
  OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(_cornerRadius),
    borderSide: BorderSide(
        color: Colors.transparent, width: 0),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/05.png')
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: ListView(
                reverse: true,
                padding: EdgeInsets.all(16),
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 50,
                    child: Image.asset('assets/logo1.png'),
                  ),
                  SizedBox(height: 16,),
                  ButtonBar(
                    children: [
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          isRegister = false;
                        });
                      },
                        child: Text(
                          '로그인',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: isRegister
                                  ? FontWeight.w400
                                  : FontWeight.w600,
                              color: isRegister
                                  ? Colors.black45
                                  : Colors.black87),
                        )),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              isRegister = true;
                            });
                          },
                          child: Text(
                            '회원가입',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: isRegister
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: isRegister
                                    ? Colors.black87
                                    : Colors.black45),
                          ))
                  ],),
                  SizedBox(height: 8,),
                  _buildTextFormField("Email Address", _emailController),
                  SizedBox(height: 8,),
                  _buildTextFormField_Password("Password", _passwordController),
                  AnimatedContainer(
                    height: isRegister?8:0,
                    duration: _duration,
                    curve: _curve,
                  ),
                  AnimatedContainer(
                      height: isRegister?60:0,
                      duration: _duration,
                      curve: _curve,
                      child: _buildTextFormField_Password("Confirm Password", _cPasswordController)),
                  SizedBox(height: 8,),
                  AnimatedContainer(
                      height: isRegister?60:0,
                      duration: _duration,
                      curve: _curve,
                      child: _buildTextFormField("Phone Number", _phoneNumberController)),
                  SizedBox(height: 16,),
                  FlatButton(
                    onPressed: () {

                      if(_formKey.currentState.validate()){
                        print('모든 입력값이 올바릅니다.');
                        Provider.of<PageNotifier>(context, listen: false).goToMain();
                      }

                    },
                    color: Colors.white54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_cornerRadius),),
                    padding: EdgeInsets.all(16),
                    child: Text(isRegister
                        ? "회원가입"
                        : "로그인"),
                  ),
                  Divider(
                    height: 33,
                    thickness: 1,
                    color: Colors.white54,
                    indent: 16,
                    endIndent: 16,
                  )
                ].reversed.toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextFormField(String labelText, TextEditingController controller) {
    return TextFormField(
                  cursorColor: Colors.white,
                  controller: controller,
                  validator: (text){
                    if(controller != _cPasswordController && (text == null || text.isEmpty)){
                      return "입력창이 비어있어요!";
                    }

                    if(controller == _cPasswordController && isRegister && (text == null || text.isEmpty)){
                      return "비밀번호 확인부분 다시 입력하세요.";
                    }

                    if(controller != _phoneNumberController && (text == null || text.isEmpty)){
                      return "전화번호 다시 입력하세요.";
                    }

                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: labelText,
                      filled: true,
                      fillColor: Colors.black45,
                      border: _border,
                      errorBorder: _border.copyWith(borderSide: BorderSide(color: Colors.black, width: 3)),
                      enabledBorder: _border,
                      focusedBorder: _border,
                      errorStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(color: Colors.white)
                  ),
                );
  }

  TextFormField _buildTextFormField_Password(String labelText, TextEditingController controller) {
    return TextFormField(
      cursorColor: Colors.white,
      controller: controller,
      validator: (text){
        if(controller != _cPasswordController && (text == null || text.isEmpty)){
          return "입력창이 비어있어요!";
        }

        if(controller == _cPasswordController && isRegister && (text == null || text.isEmpty)){
          return "비밀번호 확인부분 다시 입력하세요.";
        }

        if(controller != _phoneNumberController && (text == null || text.isEmpty)){
          return "전화번호 다시 입력하세요.";
        }

        return null;
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.black45,
          border: _border,
          errorBorder: _border.copyWith(borderSide: BorderSide(color: Colors.black, width: 3)),
          enabledBorder: _border,
          focusedBorder: _border,
          errorStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          labelStyle: TextStyle(color: Colors.white)
      ),
      obscureText: true,
    );
  }

}
