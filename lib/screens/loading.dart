// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:async';

import 'package:ban_laptop/main.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

      
  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: AlignmentDirectional.center,
          decoration: new BoxDecoration(
            color: Colors.white,
          ),
          child: CircularProgressIndicator(
                      value: null,
                      strokeWidth: 7.0,
                    ),
        );
  }
}

class LoadingHome extends StatefulWidget {
  const LoadingHome({ Key? key }) : super(key: key);

  @override
  _LoadingHomeState createState() => _LoadingHomeState();
}

class _LoadingHomeState extends State<LoadingHome> {

   @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }   
  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: AlignmentDirectional.center,
          decoration: new BoxDecoration(
            color: Colors.white,
          ),
          child: CircularProgressIndicator(
                      value: null,
                      strokeWidth: 7.0,
                    ),
        );
  }
}