import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/UI/Widget/custom_divider.dart';
import 'package:flutter_counter/UI/Widget/description.dart';
import 'package:flutter_counter/UI/Widget/flicker_image.dart';
import 'package:flutter_counter/data/Constants/constant.dart';
import 'package:flutter_counter/data/Model/launch_past_result.dart';
import 'package:intl/intl.dart';

class LaunchDetails extends StatefulWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  _LaunchDetailsState createState() => _LaunchDetailsState();
}

class _LaunchDetailsState extends State<LaunchDetails> {
  @override
  Widget build(BuildContext context) {
    Datum launch = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text('Launch Details'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              launch.links.flickrImages.length > 0
                  ? Container(
                      padding: EdgeInsets.only(top: 20),
                      height: MediaQuery.of(context).size.height / 3,
                      child: CarouselSlider.builder(
                        itemCount: launch.links.flickrImages.length,
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = launch.links.flickrImages[index];
                          return FlickerImage(urlImage);
                        },
                        options: Strings.carousalOption,
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height / 3,
                      padding: EdgeInsets.only(top: 20),
                      child: ListView(
                        children: [
                          CarouselSlider(items: [
                            FlickerImage(launch.links.missionPatchSmall),
                            FlickerImage(launch.links.missionPatchSmall),
                          ], options: Strings.carousalOption)
                        ],
                      ),
                    ),
              CustomDivider(),
              Description("Launch Description", launch.details),
              CustomDivider(),
              Description(
                  "is Launch Successful", launch.launchSuccess.toString()),
              CustomDivider(),
              Description("Mission Name", launch.missionName),
              CustomDivider(),
              Description("Site Name", launch.launchSite.siteName.toString()),
              CustomDivider(),
              Description("Rocket Name", launch.rocket.rocketName.toString()),
              CustomDivider(),
              Description("Launch Date",
                  "${DateFormat('dd MMM - HH:mm').format(launch.launchDateLocal)}")
            ],
          ),
        ));
  }
}
