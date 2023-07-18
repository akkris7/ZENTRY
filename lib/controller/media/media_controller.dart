import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:zentry/service/api_helper.dart';
import 'package:flutter_sound/flutter_sound.dart';


class MediaController extends GetxController{


  saveImage (XFile picture) async {
    print("Inside save image");
    dynamic response = await APIHelper().sendImageToApi(picture);
    print("reached back");
    if (response == 200)
    {
      print("Calling audio record function");
      recordAudio();
    }
  }

  recordAudio () async {
    final flutterSound = FlutterSound();
    final recorder = FlutterSoundRecorder();

    await recorder.openAudioSession();
    await recorder.startRecorder(toFile: 'recorded_audio.aac', codec: Codec.aacADTS);

    await Future.delayed(Duration(seconds: 10));

    String? recordedFilePath = await recorder.stopRecorder();

    if (recordedFilePath != null) {
      print('Audio recording saved to: $recordedFilePath');
      var response = await APIHelper().sendAudioToApi(recordedFilePath);
      if (response == 200){
        getLiveLocation();
      }
    } else {
      print('Error saving audio recording.');
    }
    await recorder.closeAudioSession();
  }

  getLiveLocation () async {
    int liveLocation = await APIHelper().getLiveLocationLink();
    if (liveLocation == 200) {
      print('Sucess');
    } else {
      print('Failed to obtain live location');
    }
  }

}