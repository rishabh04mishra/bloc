import 'dart:async';
import 'dart:convert';
import 'package:flutter_counter/data/Model/launch_past_result.dart';
import 'package:flutter_counter/data/Constants/constant.dart';
import 'package:http/http.dart' as http;

enum LaunchAction { fetch }

class LaunchBloc {
  final _stateStreamController = StreamController<List<Datum>>();
  StreamSink<List<Datum>> get launchSink => _stateStreamController.sink;
  Stream<List<Datum>> get launchStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<LaunchAction>();
  StreamSink<LaunchAction> get eventSink => _eventStreamController.sink;
  Stream<LaunchAction> get eventStream => _eventStreamController.stream;

  LaunchBloc() {
    eventStream.listen((event) async {
      if (event == LaunchAction.fetch) {
        try {
          var launchData = await getLaunch();
          launchSink.add(launchData.data);
        } on Exception catch (e) {
          launchSink.addError("Something went Wrong");
        }
      }
    });
  }
// fetching data from API
  Future<LaunchPastResult> getLaunch() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(Strings.url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = LaunchPastResult.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
