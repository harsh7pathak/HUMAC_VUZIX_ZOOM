import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "zoom_options.dart";
import 'package:vuzix_humac/zoom_options.dart';


typedef void ZoomViewCreatedCallback(ZoomViewController controller);

class ZoomView extends StatefulWidget {
  const ZoomView({
    Key? key,
    this.zoomOptions,
    this.meetingOptions,
    this.onViewCreated,
  }) : super(key: key);

  final ZoomViewCreatedCallback? onViewCreated;
  final ZoomOptions? zoomOptions;
  final ZoomMeetingOptions? meetingOptions;

  @override
  State<StatefulWidget> createState() => _ZoomViewState();
}

class _ZoomViewState extends State<ZoomView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'flutter_zoom_sdk',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'flutter_zoom_sdk',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the flutter_zoom_sdk plugin');
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onViewCreated == null) {
      return;
    }

    var controller = new ZoomViewController._(id);
    widget.onViewCreated!(controller);
  }
}

class ZoomViewController {
  ZoomViewController._(int id)
      : _methodChannel =
  new MethodChannel('com.evilratt/flutter_zoom_sdk'),
        _zoomStatusEventChannel =
        new EventChannel("com.evilratt/zoom_event_stream");

  final MethodChannel _methodChannel;
  final EventChannel _zoomStatusEventChannel;

  Future<dynamic> initZoom(ZoomOptions options) async {

    var optionMap = new Map<String, String?>();
    optionMap.putIfAbsent("appKey", () => options.appKey);
    optionMap.putIfAbsent("appSecret", () => options.appSecret);
    optionMap.putIfAbsent("domain", () => options.domain);

    return _methodChannel.invokeMethod('init', optionMap);
  }

  Future<dynamic> startMeeting(ZoomMeetingOptions options) async {
    var optionMap = new Map<String, String?>();
    optionMap.putIfAbsent("userId", () => options.userId);
    optionMap.putIfAbsent("displayName", () => options.displayName);
    optionMap.putIfAbsent("meetingId", () => options.meetingId);
    optionMap.putIfAbsent("meetingPassword", () => options.meetingPassword);
    optionMap.putIfAbsent("disableDialIn", () => options.disableDialIn);
    optionMap.putIfAbsent("disableDrive", () => options.disableDrive);
    optionMap.putIfAbsent("disableInvite", () => options.disableInvite);
    optionMap.putIfAbsent("disableShare", () => options.disableShare);
    optionMap.putIfAbsent("disableTitlebar", () => options.disableTitlebar);
    optionMap.putIfAbsent("noDisconnectAudio", () => options.noDisconnectAudio);
    optionMap.putIfAbsent("noAudio", () => options.noAudio);

    return _methodChannel.invokeMethod('start', optionMap);
  }

  Future<dynamic> joinMeeting(ZoomMeetingOptions options) async {
    var optionMap = new Map<String, String?>();
    optionMap.putIfAbsent("userId", () => options.userId);
    optionMap.putIfAbsent("meetingId", () => options.meetingId);
    optionMap.putIfAbsent("meetingPassword", () => options.meetingPassword);
    optionMap.putIfAbsent("disableDialIn", () => options.disableDialIn);
    optionMap.putIfAbsent("disableDrive", () => options.disableDrive);
    optionMap.putIfAbsent("disableInvite", () => options.disableInvite);
    optionMap.putIfAbsent("disableShare", () => options.disableShare);
    optionMap.putIfAbsent("disableTitlebar", () => options.disableTitlebar);
    optionMap.putIfAbsent("noDisconnectAudio", () => options.noDisconnectAudio);
    optionMap.putIfAbsent("viewOptions", () => options.viewOptions);
    optionMap.putIfAbsent("noAudio", () => options.noAudio);

    return _methodChannel.invokeMethod('join', optionMap);
  }

  Future<dynamic> scheduleMeeting(ZoomScheduleOptions options) async {
    var optionMap = new Map<String, String?>();
    optionMap.putIfAbsent("setMeetingTopic", () => options.setMeetingTopic);
    optionMap.putIfAbsent("setStartTime", () => options.setStartTime);
    optionMap.putIfAbsent("durationMinute", () => options.durationMinute);
    optionMap.putIfAbsent("canJoinBeforeHost", () => options.canJoinBeforeHost);
    optionMap.putIfAbsent("setPassword", () => options.setPassword);
    optionMap.putIfAbsent("setHostVideoOff", () => options.setHostVideoOff);
    optionMap.putIfAbsent("setAttendeeVideoOff", () => options.setAttendeeVideoOff);
    optionMap.putIfAbsent("setTimeZoneId", () => options.setTimeZoneId);
    optionMap.putIfAbsent("setEnableMeetingToPublic", () => options.setEnableMeetingToPublic);
    optionMap.putIfAbsent("setEnableLanguageInterpretation", () => options.setEnableLanguageInterpretation);
    optionMap.putIfAbsent("setEnableWaitingRoom", () => options.setEnableWaitingRoom);
    optionMap.putIfAbsent("enableAutoRecord", () => options.enableAutoRecord);
    optionMap.putIfAbsent("autoLocalRecord", () => options.autoLocalRecord);
    optionMap.putIfAbsent("autoCloudRecord", () => options.autoCloudRecord);

    return _methodChannel.invokeMethod('schedule', optionMap);
  }

  Future<dynamic> login(ZoomMeetingOptions options) async {
    var optionMap = new Map<String, String?>();
    optionMap.putIfAbsent("userId", () => options.userId);
    optionMap.putIfAbsent("meetingPassword", () => options.meetingPassword);
    optionMap.putIfAbsent("disableDialIn", () => options.disableDialIn);
    optionMap.putIfAbsent("disableDrive", () => options.disableDrive);
    optionMap.putIfAbsent("disableInvite", () => options.disableInvite);
    optionMap.putIfAbsent("disableShare", () => options.disableShare);
    optionMap.putIfAbsent("disableTitlebar", () => options.disableTitlebar);
    optionMap.putIfAbsent("viewOptions", () => options.viewOptions);
    optionMap.putIfAbsent("noDisconnectAudio", () => options.noDisconnectAudio);
    optionMap.putIfAbsent("noAudio", () => options.noAudio);

    return _methodChannel.invokeMethod('login', optionMap);
  }

  Future<dynamic> meetingStatus(String meetingId) async {

    var optionMap = new Map<String, String>();
    optionMap.putIfAbsent("meetingId", () => meetingId);

    return _methodChannel.invokeMethod('meeting_status', optionMap);
  }

  Stream<dynamic> get zoomStatusEvents {
    return _zoomStatusEventChannel.receiveBroadcastStream();
  }
}
