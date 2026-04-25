import 'package:cloud_functions/cloud_functions.dart';

class CloudFunctionsService {
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  Future<void> calculatePoints(String matchId) async {
    HttpsCallable callable = _functions.httpsCallable('calculatePoints');
    await callable.call({'matchId': matchId});
  }
}