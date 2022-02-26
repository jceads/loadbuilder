// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var imageUrl =
      "https://images.unsplash.com/photo-1645828694012-307875ab3761?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80"; //RESİM URL
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Image.network(
            imageUrl,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                //LOADINGPROGRESS NULL KONTROLU, EĞER NULL SA RESİM YÜKLENDİ DEMEKTİR
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes !=
                          null //RESMİN İNDİRİLMESİ TAMAMLANMADI MI?
                      ? loadingProgress
                              .cumulativeBytesLoaded / //EĞER TAMAMLANMADIYSA {İNDİRİLEN BOYUT/DOSYANIN TAMAMI TÜM BOYUTU} İŞLEMİNİ PROGRESS BAR'IN VALUE DEĞERİNE YAZ
                          loadingProgress.expectedTotalBytes!
                      : null, //RESMİN İNDİRMESİNİN TAMAMLANMASI DURUMUNDA DEĞER NULL OLACAK VE PROGRESS BAR KAPANACAK
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
