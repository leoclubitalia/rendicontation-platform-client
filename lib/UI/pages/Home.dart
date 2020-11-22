import 'package:RendicontationPlatformLeo_Client/UI/aspects/UIConstants.dart';
import 'package:RendicontationPlatformLeo_Client/UI/behaviors/AppLocalizations.dart';
import 'package:RendicontationPlatformLeo_Client/UI/behaviors/GlobalState.dart';
import 'package:RendicontationPlatformLeo_Client/UI/pages/Activities.dart';
import 'package:RendicontationPlatformLeo_Client/UI/pages/Credits.dart';
import 'package:RendicontationPlatformLeo_Client/UI/pages/Search.dart';
import 'package:RendicontationPlatformLeo_Client/UI/pages/Services.dart';
import 'package:RendicontationPlatformLeo_Client/UI/widgets/RoundedAppBar.dart';
import 'package:RendicontationPlatformLeo_Client/UI/widgets/buttons/StadiumButton.dart';
import 'package:RendicontationPlatformLeo_Client/model/ModelFacade.dart';
import 'package:RendicontationPlatformLeo_Client/model/objects/Club.dart';
import 'package:RendicontationPlatformLeo_Client/model/support/Constants.dart';
import 'package:RendicontationPlatformLeo_Client/model/support/extensions/StringCapitalization.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);


  @override
  _Home createState() => _Home();
}

class _Home extends GlobalState<Home> {
  Club club;

  @override
  void refreshState() {
    club = ModelFacade.sharedInstance.appState.getValue(Constants.STATE_CLUB);
  }

  bool isCircularMoment() {
    return ModelFacade.sharedInstance.appState.getValue(Constants.STATE_CLUB) == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedAppBar (
        title: AppLocalizations.of(context).translate("home").capitalize,
        backable: false,
      ),
      body: Center(
        child: isCircularMoment() ?
        Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).buttonColor),
          ),
        ) :
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(
                  AppLocalizations.of(context).translate("hi").capitalize + "!",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              ColorFiltered(
                child: Image.asset(
                  "images/logo.png",
                  width: 200,
                ),
                colorFilter: ColorFilter.mode(
                  Theme.of(context).splashColor,
                  BlendMode.modulate
                ),
              ),
              Text(
                club.name,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                AppLocalizations.of(context).translate("district").capitalize + " " + club.district.name,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 3, 0, 25),
                child: Text(
                  AppLocalizations.of(context).translate("since").capitalize + " " + club.foundationDate.year.toString(),
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StadiumButton(
                      icon: UIConstants.ICON_SERVICE,
                      title: AppLocalizations.of(context).translate("service").capitalize,
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: false,
                            transitionDuration: Duration(milliseconds: 700),
                            pageBuilder: (BuildContext context, _, __) => Services()
                          ),
                        );
                      },
                    ),
                    StadiumButton(
                      icon: UIConstants.ICON_ACTIVITY,
                      title: AppLocalizations.of(context).translate("activity").capitalize,
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: false,
                            transitionDuration: Duration(milliseconds: 700),
                            pageBuilder: (BuildContext context, _, __) => Activities()
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context).translate("service").capitalize,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          width: 100,
                          height: 100,
                          child: LiquidCircularProgressIndicator(
                            value: (club.quantityServices.currentYear / 15),
                            valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
                            backgroundColor: Theme.of(context).primaryColor,
                            borderColor: Theme.of(context).buttonColor,
                            borderWidth: 3.0,
                            direction: Axis.vertical,
                          ),
                        ),
                        Text(
                            AppLocalizations.of(context).translate("this_year") + " " + club.quantityServices.currentYear.toString()
                        ),
                        Text(
                            AppLocalizations.of(context).translate("since_the_foundation") + " " + (club.quantityServices.currentYear + ( DateTime.now().year - club.foundationDate.year) * 15).toString()
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context).translate("activity").capitalize,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          width: 100,
                          height: 100,
                          child: LiquidCircularProgressIndicator(
                              value: (club.quantityActivities.currentYear / 17),
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                            backgroundColor: Theme.of(context).primaryColor,
                            borderColor: Theme.of(context).buttonColor,
                            borderWidth: 3.0,
                            direction: Axis.vertical,
                          ),
                        ),
                        Text(
                            AppLocalizations.of(context).translate("this_year") + " " + club.quantityActivities.currentYear.toString()
                        ),
                        Text(
                            AppLocalizations.of(context).translate("since_the_foundation") + " " + (club.quantityActivities.currentYear + ( DateTime.now().year - club.foundationDate.year) * 17).toString()
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: StadiumButton(
                  icon: Icons.search_rounded,
                  title: AppLocalizations.of(context).translate("search").capitalize,
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        opaque: false,
                        transitionDuration: Duration(milliseconds: 700),
                        pageBuilder: (BuildContext context, _, __) => Search(false)
                      ),
                    );
                  }
                ),
              ),
              Padding (
                padding: EdgeInsets.fromLTRB(0, 25, 0, 20),
                child: FlatButton(
                  minWidth: 100000,
                  color: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        opaque: false,
                        transitionDuration: Duration(milliseconds: 700),
                        pageBuilder: (BuildContext context, _, __) => Credits()
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context).translate("this_app_was_developed_by"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}