import 'dart:async';

import 'package:chap_etude/ui/screens/accueil.dart';
import 'package:chap_etude/ui/util/util.dart';
import 'package:chap_etude/ui/widgets/text_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../repositories/data_repository.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var _connectivityStatus = 'Unknown';
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
    _checkConnectivity();
    initData();
  }
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _checkConnectivity();
      initData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }


  void initData() async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    await dataProvider.initData();
    // ensuite on va sur HomScreen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Accueil();
          },
        ),
      );
    });
  }

  Future<void> _checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        _connectivityStatus = 'Connected';
      });
    } else {
      setState(() {
        _connectivityStatus = 'Not connected';
      });
    }
    if (kDebugMode) {
      print(_connectivityStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: couleurBleuAe2i,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo-AE2I.png'),
            SpinKitFadingCircle(
              color: couleurOrangeAe2i,
              size: 100,
            ),
            (_connectivityStatus == 'Connected')
                ? const Center()
                :  const TextWidget(data: "Veuillez vous connecter à internet", taille: 20,couleur: Colors.red,)
          ],
        ),
      ),
    );
  }
}
