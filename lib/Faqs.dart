import 'dart:async';
import 'dart:convert';

import 'package:eshop/Helper/Session.dart';
import 'package:eshop/Model/Faqs_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'Helper/AppBtn.dart';
import 'Helper/Color.dart';
import 'Helper/Constant.dart';
import 'Helper/String.dart';

class Faqs extends StatefulWidget {
  final String title;

  const Faqs({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StateFaqs();
  }
}

class StateFaqs extends State<Faqs> with TickerProviderStateMixin {
  bool _isLoading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String privacy;
  Animation buttonSqueezeanimation;
  AnimationController buttonController;
  bool _isNetworkAvail = true;
  List<Faqs_Model> faqs_list = [];
  List<String> selectedId = [];
  int selectedIndex = -1;
  List toggled = List();
  bool flag = true;
  bool expand = true;
  bool isLoadingmore = true;
  ScrollController controller = new ScrollController();

  // String firstHalf;
  //String secondHalf;

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
    getFaqs();
    buttonController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);

    buttonSqueezeanimation = new Tween(
      begin: deviceWidth * 0.7,
      end: 50.0,
    ).animate(new CurvedAnimation(
      parent: buttonController,
      curve: new Interval(
        0.0,
        0.150,
      ),
    ));
  }

  @override
  void dispose() {
    buttonController.dispose();
    controller.removeListener(() {});
    super.dispose();
  }

  _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      if (this.mounted) {
        setState(() {
          isLoadingmore = true;
          getFaqs();
        });
      }
    }
  }

  Future<Null> _playAnimation() async {
    try {
      await buttonController.forward();
    } on TickerCanceled {}
  }

  Widget noInternet(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          noIntImage(),
          noIntText(context),
          noIntDec(context),
          AppBtn(
            title: TRY_AGAIN_INT_LBL,
            btnAnim: buttonSqueezeanimation,
            btnCntrl: buttonController,
            onBtnSelected: () async {
              _playAnimation();

              Future.delayed(Duration(seconds: 2)).then((_) async {
                _isNetworkAvail = await isNetworkAvailable();
                if (_isNetworkAvail) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget));
                } else {
                  await buttonController.reverse();
                  setState(() {});
                }
              });
            },
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightWhite,
        key: _scaffoldKey,
        appBar: getAppBar(widget.title, context),
        body: _isNetworkAvail ? _showForm() : noInternet(context));
  }

  _showForm() {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child:

    _isLoading?shimmer():ListView.builder(
          controller: controller,
          itemCount: faqs_list.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return (index == faqs_list.length && isLoadingmore)
                ? Center(child: CircularProgressIndicator())
                : listItem(index);
          },
        ));
  }

  listItem(int index) {
    return Card(
        elevation: 0,
        child: InkWell(
          borderRadius:  BorderRadius.circular(4),
          onTap: () {
              setState(() {
                selectedIndex = index;
                flag = !flag;
              });
            },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          faqs_list[index].question,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: lightBlack),
                        )),
                    selectedIndex != index
                        || flag? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0),
                                child: Text(
                                  faqs_list[index].answer,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                      color: black.withOpacity(0.7)),
                                  maxLines: 1,
                                  overflow:TextOverflow.ellipsis,
                                ))),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    )
                        : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(

                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    faqs_list[index].answer,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .copyWith(
                                        color:
                                        black.withOpacity(0.7)),
                                  ))),
                          Icon(Icons.keyboard_arrow_up)
                        ]),
                  ]),
          ),
        ));
  }

  Future<void> getFaqs() async {
    _isNetworkAvail = await isNetworkAvailable();
    if (_isNetworkAvail) {
      try {
        Response response = await post(getFaqsApi, headers: headers)
            .timeout(Duration(seconds: timeOut));

        var getdata = json.decode(response.body);
        print('response***Faqs**$headers***${response.body.toString()}');
        bool error = getdata["error"];
        String msg = getdata["message"];
        if (!error) {
          var data = getdata["data"];
          faqs_list = (data as List)
              .map((data) => new Faqs_Model.fromJson(data))
              .toList();
        } else {
          setSnackbar(msg);
        }
        setState(() {
          _isLoading = false;
        });
      } on TimeoutException catch (_) {
        setSnackbar(somethingMSg);
      }
    } else {
      setState(() {
        _isLoading = false;
        _isNetworkAvail = false;
      });
    }
  }

  setSnackbar(String msg) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: black),
      ),
      backgroundColor: white,
      elevation: 1.0,
    ));
  }
}