import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'dart:typed_data';

import 'package:resume_builder/templatescreen/choosetemplate/8_template/8_classic.dart';

import 'package:resume_builder/resumeformscreen/sharedpreference.dart';

class ResumeClassicPage8 extends StatefulWidget {
  const ResumeClassicPage8({Key? key}) : super(key: key);

  @override
  State<ResumeClassicPage8> createState() => _ResumeClassicPage8State();
}

class _ResumeClassicPage8State extends State<ResumeClassicPage8> with SingleTickerProviderStateMixin {
  late List<dynamic> data=[];
  int _tab = 0;
  TabController? _tabController;

  PrintingInfo? printingInfo;

  var _hasData = false;
  var _pending = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
    getData();

  }

  Future<void> _init() async {
    final info = await Printing.info();


    _tabController = TabController(
      vsync: this,
      length: examples.length,
      initialIndex: _tab,
    );
    _tabController!.addListener(() {
      if (_tab != _tabController!.index) {
        setState(() {
          _tab = _tabController!.index;
        });
      }
    });
    setState(() {
      printingInfo = info;
    });
  }

  getData() async {
    SharedPreferencesService _prefs = SharedPreferencesService();
    String? personalData = await _prefs.getFromSharedPref('personal-data');
    String? aboutInfo = await _prefs.getFromSharedPref('about');
    String? certificationData = await _prefs.getFromSharedPref('certification');
    String? educationData = await _prefs.getFromSharedPref('education');
    String? experienceData = await _prefs.getFromSharedPref('experience');
    String? allLanguages = await _prefs.getFromSharedPref('languages');
    String? projectData = await _prefs.getFromSharedPref('project');
    String? allSkills = await _prefs.getFromSharedPref('skills');
    String? socialData = await _prefs.getFromSharedPref('social-data');
    personalData!=null?data.add(jsonDecode(personalData)):data.add("empty");
    aboutInfo!=null?data.add(aboutInfo):data.add("empty");
    certificationData!=null?data.add(jsonDecode(certificationData)):data.add("empty");
    educationData!=null?data.add(jsonDecode(educationData)):data.add("empty");
    experienceData!=null?data.add(jsonDecode(experienceData)):data.add("empty");
    allLanguages!=null?data.add(jsonDecode(allLanguages)):data.add("empty");
    projectData!=null?data.add(jsonDecode(projectData)):data.add("empty");
    allSkills!=null?data.add(jsonDecode(allSkills)):data.add("empty");
    socialData!=null?data.add(jsonDecode(socialData)):data.add("empty");
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 121, 139),
            title: const Text('Resume Builder'),
          ),
          body: Container(
            padding: EdgeInsets.only(top:65),
            color: Colors.grey[400],
            child: PdfPreview(
              maxPageWidth: 700,
              build: (format) => examples[0].builder(format, data),
            ),
          )
      );
  }
}

const examples = [
  Example('Resume', 'resume.dart',templateClassic8),
];

typedef LayoutCallbackWithData = Future<Uint8List> Function(
    PdfPageFormat pageFormat, List<dynamic> data);

class Example {
  const Example(this.name, this.file, this.builder);
  final String name;
  final String file;
  final LayoutCallbackWithData builder;
}

class Customization {
  const Customization(this.name);
  final String name;
}
