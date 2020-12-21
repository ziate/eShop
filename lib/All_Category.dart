import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/Helper/Color.dart';
import 'package:eshop/Helper/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Helper/Session.dart';
import 'Helper/String.dart';
import 'Home.dart';
import 'ProductList.dart';
import 'SubCat.dart';
import 'Model/Model.dart';
import 'Model/Section_Model.dart';
class All_Category extends StatefulWidget {

  final Function updateHome;

  const All_Category({Key key, this.updateHome}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return StateCat();
  }
}

class StateCat extends State<All_Category> {

  int offset = perPage;
  int total = 0;
  bool isLoadingmore = true,_isCatLoading=false;
  ScrollController controller = new ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Product> tempList = [];

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: lightWhite,
        appBar: getAppBar(ALL_CAT, context),
        body: GridView.count(
            controller: controller,
            padding: EdgeInsets.all(20),
            crossAxisCount: 4,
            shrinkWrap: true,
            childAspectRatio: .8,
            physics: BouncingScrollPhysics(),
            // mainAxisSpacing: 6,
            // crossAxisSpacing: 3,
            children: List.generate(
              (offset < total) ? catList.length + 1 : catList.length,
              (index) {
              return  (index == catList.length && isLoadingmore)
                    ? Center(child: CircularProgressIndicator())
                    : catItem(index, context);
              },
            )));
  }

  Future<void> getCat() async {
    try {
      var parameter = {
        CAT_FILTER: "false",
        LIMIT: perPage.toString(),
        OFFSET: offset.toString()
      };
      Response response =
          await post(getCatApi, body: parameter, headers: headers)
              .timeout(Duration(seconds: timeOut));

      var getdata = json.decode(response.body);
      print('response***cat****${response.body.toString()}');
      bool error = getdata["error"];
      String msg = getdata["message"];
      if (!error) {
        var data = getdata["data"];

        catList =
            (data as List).map((data) => new Product.fromCat(data)).toList();

        if (!error) {
          total = int.parse(getdata["total"]);
          print('limit *****$offset****$total');
          if ((offset) < total) {
            tempList.clear();
            var data = getdata["data"];
            tempList =
                (data as List).map((data) => new Product.fromCat(data)).toList();
            catList.addAll(tempList);

            offset = offset + perPage;
          }
        }

      } else {
        isLoadingmore = false;
        setSnackbar(msg);
      }
      setState(() {
        _isCatLoading = false;

      });
    } on TimeoutException catch (_) {
      setSnackbar(somethingMSg);
      setState(() {
        _isCatLoading = false;
        isLoadingmore = false;
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

  Widget catItem(int index, BuildContext context) {
    return InkWell(
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: CachedNetworkImage(
                imageUrl: catList[index].image,
                height: 50,
                width: 50,
                fit: BoxFit.fill,
                errorWidget:(context, url,e) => placeHolder(50) ,
                placeholder: (context, url) => placeHolder(50),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              catList[index].name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: fontColor),
            ),
          )
        ],
      ),
      onTap: () {
        if (catList[index].subList == null ||
            catList[index].subList.length == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductList(
                  name: catList[index].name,
                  id: catList[index].id,
                ),
              ));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SubCat(
                  title: catList[index].name,
                  subList: catList[index].subList,
                  updateHome: widget.updateHome,
                ),
              ));
        }
      },
    );
  }


  _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      if (this.mounted) {
        setState(() {
          isLoadingmore = true;

          print("limit *****$offset****$total");
          if (offset < total) getCat();
        });
      }
    }
  }
}
