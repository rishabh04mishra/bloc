import 'package:flutter/material.dart';
import 'package:flutter_counter/Bloc/launch_bloc.dart';
import 'package:flutter_counter/UI/Widget/custom_divider.dart';
import 'package:flutter_counter/data/Model/launch_past_result.dart';
import 'package:intl/intl.dart';

class LaunchPage extends StatefulWidget {
  //const LaunchPage({ Key? key }) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  final launchBloc = LaunchBloc();

  @override
  void initState() {
    launchBloc.eventSink.add(LaunchAction.fetch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text('SpaceX'),
        ),
        body: Container(
            // ignore: deprecated_member_use
            child: StreamBuilder<List<Datum>>(
          stream: launchBloc.launchStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) { 
                    var launch = snapshot.data[index];
                    return Column(
                      children: [
                        Container(
                          height: 100,
                          margin: const EdgeInsets.all(8),
                          child: Row(
                            children: <Widget>[
                              Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: AspectRatio(
                                    aspectRatio: 1,
                                    child:
                                        launch.links.missionPatchSmall == null
                                            ? Image.network(
                                                launch.links.flickrImages[0],
                                              )
                                            : Image.network(
                                                launch.links.missionPatchSmall,
                                                fit: BoxFit.cover,
                                              )),
                              ),
                              SizedBox(width: 16),
                              Flexible(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/details',
                                        arguments: launch);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Mission Name : ${launch.missionName}",
                                        //"Launch Time : ${DateFormat('dd MMM - HH:mm').format(launch.launchDateLocal)}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.cyan[900],
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Launch Time : ${DateFormat('dd MMM - HH:mm').format(launch.launchDateLocal)}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomDivider(),
                      ],
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        )));
  }
}
