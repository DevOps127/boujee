import 'dart:ui';

import 'package:boujee/ui/constants/colors.dart';
import 'package:boujee/ui/widgets/connexion_forms/login_form.dart';
import 'package:boujee/ui/widgets/connexion_forms/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnexionScreen extends StatefulWidget {
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.colorWhite,
      systemNavigationBarColor: AppColors.scaffoldBackgroundColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TopContainerWidget(tabController: _tabController),
            Flexible(
              flex: 3,
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  LoginForm(),
                  SignUpForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopContainerWidget extends StatelessWidget {
  const _TopContainerWidget({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
              child: Center(child: Image.asset('assets/images/logo_md.png')),
            ),
            _TabBarWidget(tabController: _tabController),
          ],
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
