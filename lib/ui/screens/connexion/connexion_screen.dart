import 'dart:ui';

import 'package:boujee/ui/constants/colors.dart';
import 'package:boujee/ui/shared/buttons/default_raised_button.dart';
import 'package:boujee/ui/shared/default_textfield/default_textfield.dart';
import 'package:boujee/ui/shared/spacers/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnexionScreen extends StatefulWidget {
  static const routeName = '/connexion-screen';

  const ConnexionScreen({Key key}) : super(key: key);

  @override
  _ConnexionScreenState createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.colorWhite,
        systemNavigationBarColor: AppColors.scaffoldBackgroundColor,
      ),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.04),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset('assets/images/logo_md.png'),
                        ),
                        _TabBarWidget(tabController: _tabController),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TabBarView(
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _LoginForm(),
                      _SignUpForm(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabBarWidget extends StatelessWidget {
  const _TabBarWidget({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final _kLabelStyle = TextStyle(
      color: AppColors.colorBlack,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      letterSpacing: .7,
    );
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: TabBar(
        controller: _tabController,
        indicatorColor: AppColors.primaryColor,
        unselectedLabelColor: AppColors.colorBlack,
        tabs: [
          Tab(
            child: Text(
              'Login',
              style: _kLabelStyle,
            ),
          ),
          Tab(
            child: Text(
              'Sign-up',
              style: _kLabelStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTextField(
                  labelText: 'Email address',
                  textInputType: TextInputType.emailAddress,
                ),
                const SpaceH16(),
                DefaultTextField(
                  labelText: 'Password',
                  obscureText: true,
                ),
                const SpaceH16(),
                FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            DefaultRaisedButton(onTap: () {}, text: 'Login')
          ],
        ),
      ),
    );
  }
}

class _SignUpForm extends StatelessWidget {
  const _SignUpForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTextField(
                  labelText: 'User name',
                  textInputType: TextInputType.emailAddress,
                ),
                const SpaceH16(),
                DefaultTextField(
                  labelText: 'Email address',
                  textInputType: TextInputType.emailAddress,
                ),
                const SpaceH16(),
                DefaultTextField(
                  labelText: 'Password',
                  obscureText: true,
                ),
                const SpaceH16(),
                FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            DefaultRaisedButton(onTap: () {}, text: 'Sign-up'),
          ],
        ),
      ),
    );
  }
}
