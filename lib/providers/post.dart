import 'package:balila_mobile/components/loader.dart';
import 'package:balila_mobile/components/notification_alert.dart';
import 'package:balila_mobile/model/model_post.dart';
import 'package:balila_mobile/services/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<ModelPost> _dataPost = <ModelPost>[];
  List<ModelPost> get dataPost => _dataPost;

  void getPostRequest(BuildContext context) async {
    showLoader(context);
    Api().getPost().then((response) {
      _dataPost = response;
      notifyListeners();
    }).catchError((error) {
      showAlert(context: context, message: error);
    }).whenComplete(() => Navigator.pop(context));
  }
}
