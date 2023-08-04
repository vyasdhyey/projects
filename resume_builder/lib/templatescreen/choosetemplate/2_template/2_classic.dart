import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

Future<Uint8List> templateClassic2(
    PdfPageFormat format, List<dynamic> data) async {
  final doc = pw.Document(title: 'My Resume');

  // final profileImage = pw.MemoryImage(
  //   (await rootBundle.load('assets/profile.jpg')).buffer.asUint8List(),
  // );

  final pageTheme = await _myPageTheme(format);
  const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
  const PdfColor headerGreen = PdfColor.fromInt(0xff26a69a);
  const PdfColor grey = PdfColor.fromInt(0x1f000000);

  doc.addPage(pw.MultiPage(
      pageTheme: pageTheme,
      build: (pw.Context context) => [
            pw.Container(
                child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                    child: pw.Column(children: [
                      pw.Wrap(spacing: 8, children: [
                        pw.Text(data[0]["fname"],
                            style: pw.TextStyle(
                                fontSize: 25,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.grey800)),
                        pw.Text(data[0]["mname"],
                            style: pw.TextStyle(
                                fontSize: 25,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.grey800)),
                        pw.Text(data[0]["lname"],
                            style: pw.TextStyle(
                                fontSize: 25,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.grey800)),
                      ]),
                  pw.SizedBox(
                    height: 15,
                  ),
                  pw.Wrap(children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(data[0]["email"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                        pw.Text("  /  "),
                        pw.Text(data[0]["mobile"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                        pw.Text("    "),
                      ]
                    ),

                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(data[0]["flat/house"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                        pw.Text("  ,  "),
                        pw.Text(data[0]["area"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                        pw.Text("  ,  "),
                        pw.Text(data[0]["landmark"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                        pw.Text("  ,  "),
                        pw.Text(data[0]["city"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                        pw.Text("  ,  "),
                        pw.Text(data[0]["state"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                        pw.Text("  ,  "),
                        pw.Text(data[0]["pincode"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                      ]
                    ),

                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(data[0]["socialmedia"],
                            style: const pw.TextStyle(
                                fontSize: 15, color: PdfColors.grey800)),
                      ]
                    )
                  ])
                ])),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Divider(
                      height: 1.5,
                      color: PdfColors.grey600,
                    ),
                    pw.SizedBox(
                      height: 15,
                    ),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Container(
                              padding: pw.EdgeInsets.only(top: 10),
                              child: pw.SizedBox(
                                  width: 120,
                                  child: pw.Text("CAREER OBJECTIVE",
                                      style: pw.TextStyle(
                                          fontSize: 15,
                                          fontWeight: pw.FontWeight.bold,
                                          color: PdfColors.grey700)))),
                          pw.SizedBox(width: 20),
                          data[1] != "empty"
                              ? pw.Container(
                                  width: 350,
                                  padding: pw.EdgeInsets.only(top: 2),
                                  child: pw.Text(data[1],
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          color: PdfColors.grey700)))
                              : pw.Container(),
                        ])
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Divider(
                      height: 1.5,
                      color: PdfColors.grey600,
                    ),
                    pw.SizedBox(
                      height: 15,
                    ),
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Container(
                            padding: pw.EdgeInsets.only(top: 10),
                            child: pw.Text("EDUCATION",
                                style: pw.TextStyle(
                                    fontSize: 15,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.grey700))),
                        pw.SizedBox(width: 60),
                        data[3] != "empty"
                            ? pw.ListView.builder(
                                itemCount: data[3].length,
                                itemBuilder: (context, index) {
                                  return pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      children: [
                                        pw.Text(
                                            data[3][index]["institute_name"],
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.grey800)),
                                        pw.SizedBox(
                                          height: 2,
                                        ),
                                        pw.Text(
                                            "${data[3][index]["start_date"]}  -  ${data[3][index]["end_date"]}",
                                            style: pw.TextStyle(
                                                fontSize: 10,
                                                color: PdfColors.grey700)),
                                        pw.SizedBox(
                                          height: 15,
                                        ),
                                        pw.Text(data[3][index]["degree"],
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.grey800)),
                                        pw.SizedBox(
                                          height: 2,
                                        ),
                                        pw.Text(data[3][index]["grade"],
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.grey800)),
                                        pw.SizedBox(
                                          height: 2,
                                        ),
                                        pw.Text(data[3][index]["comments"],
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight: pw.FontWeight.bold,
                                                color: PdfColors.grey800)),
                                        pw.SizedBox(
                                          height: 2,
                                        ),
                                      ]);
                                })
                            : pw.Container()
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 15),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Divider(
                      height: 1.5,
                      color: PdfColors.grey600,
                    ),
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Container(
                            padding: pw.EdgeInsets.only(top: 10),
                            child: pw.SizedBox(
                                width: 120,
                                child: pw.Text("LANGUAGES",
                                    style: pw.TextStyle(
                                        fontSize: 15,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.grey700)))),
                        pw.SizedBox(width: 20),
                        data[5] != "empty"
                            ? pw.SizedBox(
                                width: 370,
                                child: pw.Wrap(
                                    direction: pw.Axis.horizontal,
                                    children:
                                        List.generate(data[5].length, (index) {
                                      return pw.Container(
                                        padding: const pw.EdgeInsets.all(8),
                                        margin: const pw.EdgeInsets.all(5),
                                        decoration: pw.BoxDecoration(
                                            color: PdfColors.grey100,
                                            borderRadius:
                                                pw.BorderRadius.circular(20)),
                                        child: pw.Wrap(
                                          direction: pw.Axis.horizontal,
                                          children: [
                                            pw.Text(data[5][index],
                                                style: const pw.TextStyle(
                                                    color: PdfColors.grey800)),
                                            pw.SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                      );
                                    })))
                            : pw.Container()
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 15),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Divider(
                      height: 1.5,
                      color: PdfColors.grey600,
                    ),
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Container(
                            padding: pw.EdgeInsets.only(top: 10),
                            child: pw.SizedBox(
                                width: 120,
                                child: pw.Text("SKILLS",
                                    style: pw.TextStyle(
                                        fontSize: 15,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.grey700)))),
                        pw.SizedBox(width: 20),
                        data[7] != "empty"
                            ? pw.SizedBox(
                                width: 370,
                                child: pw.Wrap(
                                    direction: pw.Axis.horizontal,
                                    children:
                                        List.generate(data[7].length, (index) {
                                      return pw.Container(
                                        padding: const pw.EdgeInsets.all(8),
                                        margin: const pw.EdgeInsets.all(5),
                                        decoration: pw.BoxDecoration(
                                            color: PdfColors.grey100,
                                            borderRadius:
                                                pw.BorderRadius.circular(20)),
                                        child: pw.Wrap(
                                          direction: pw.Axis.horizontal,
                                          children: [
                                            pw.Text(data[7][index],
                                                style: const pw.TextStyle(
                                                    color: PdfColors.grey800)),
                                            pw.SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                      );
                                    })))
                            : pw.Container()
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Divider(
                      height: 1.5,
                      color: PdfColors.grey600,
                    ),
                    pw.SizedBox(
                      height: 15,
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(
                            width: 120,
                            child: pw.Container(
                                padding: const pw.EdgeInsets.only(top: 10),
                                child: pw.Text("CERTIFICATION",
                                    style: pw.TextStyle(
                                        fontSize: 15,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.grey700)))),
                        pw.SizedBox(
                          width: 20,
                        ),
                        data[2] != "empty"
                            ? pw.SizedBox(
                                width: 370,
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children:
                                        List.generate(data[2].length, (index) {
                                      return pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.start,
                                        children: [
                                          pw.Text(data[2][index]["issue_desc"],
                                              style: pw.TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                  pw.FontWeight.bold,
                                                  color: PdfColors.grey800)),
                                          pw.SizedBox(
                                            height: 2,
                                          ),
                                          pw.Text(data[2][index]["course_name"],
                                              style: pw.TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: PdfColors.grey800)),
                                          pw.SizedBox(
                                            height: 2,
                                          ),
                                          pw.Text(
                                              "${data[2][index]["start_date"]} - ${data[2][index]["end_date"]}",
                                              style: const pw.TextStyle(
                                                  fontSize: 10,
                                                  color: PdfColors.grey700)),
                                          pw.SizedBox(
                                            height: 8,
                                          ),
                                          pw.Text(data[2][index]["link"],
                                              style: pw.TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: PdfColors.grey800)),
                                          pw.SizedBox(
                                            height: 2,
                                          ),
                                        ],
                                      );
                                    })))
                            : pw.Container()
                      ],
                    )
                  ],
                ),
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Divider(
                      height: 1.5,
                      color: PdfColors.grey600,
                    ),
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.SizedBox(
                              width: 120,
                              child: pw.Container(
                                  padding: pw.EdgeInsets.only(top: 10),
                                  child: pw.Text("EXPERIENCE",
                                      style: pw.TextStyle(
                                          fontSize: 15,
                                          fontWeight: pw.FontWeight.bold,
                                          color: PdfColors.grey700)))),
                          pw.SizedBox(
                            width: 20,
                          ),
                          data[4] != "empty"
                              ? pw.SizedBox(
                                  width: 350,
                                  child: pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      children: List.generate(data[4].length,
                                          (index) {
                                        return pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.start,
                                            children: [
                                              pw.Text(
                                                  data[4][index]
                                                      ["company_name"],
                                                  style: pw.TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          pw.FontWeight.bold,
                                                      color:
                                                          PdfColors.grey800)),
                                              pw.SizedBox(
                                                height: 2,
                                              ),
                                              pw.Text(
                                                  "${data[4][index]["start_date"]}  -  ${data[4][index]["end_date"]}",
                                                  style: pw.TextStyle(
                                                      color:
                                                          PdfColors.grey700)),
                                              pw.SizedBox(
                                                height: 5,
                                              ),
                                              pw.Text(data[4][index]["content"],
                                                  style: pw.TextStyle(
                                                      color:
                                                          PdfColors.grey600)),
                                              pw.SizedBox(
                                                height: 10,
                                              ),
                                            ]);
                                      })))
                              : pw.Container()
                        ])
                  ],
                ),
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Divider(
                      height: 1.5,
                      color: PdfColors.grey600,
                    ),
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.SizedBox(
                              width: 120,
                              child: pw.Container(
                                  padding: pw.EdgeInsets.only(top: 10),
                                  child: pw.Text("PROJECT",
                                      style: pw.TextStyle(
                                          fontSize: 15,
                                          fontWeight: pw.FontWeight.bold,
                                          color: PdfColors.grey700)))),

                          pw.SizedBox(width: 20),
                          data[6] != "empty"
                              ? pw.SizedBox(
                                  width: 350,
                                  child: pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      children: List.generate(data[6].length,
                                          (index) {
                                        return pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.start,
                                            children: [
                                              pw.Text(
                                                  data[6][index]
                                                      ["project_name"],
                                                  style: pw.TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          pw.FontWeight.bold,
                                                      color:
                                                          PdfColors.grey800)),
                                              pw.SizedBox(
                                                height: 2,
                                              ),
                                              pw.Text(
                                                  data[6][index]
                                                  ["project_role"],
                                                  style: pw.TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                      pw.FontWeight.bold,
                                                      color:
                                                      PdfColors.grey800)),
                                              pw.SizedBox(
                                                height: 2,
                                              ),
                                              pw.Text(
                                                  "${data[6][index]["start_date"]}  -  ${data[6][index]["end_date"]}",
                                                  style: pw.TextStyle(
                                                      color:
                                                          PdfColors.grey700)),
                                              pw.SizedBox(
                                                height: 5,
                                              ),
                                              pw.Text(
                                                  data[6][index]["description"],
                                                  style: pw.TextStyle(
                                                      color:
                                                          PdfColors.grey600)),

                                              pw.SizedBox(
                                                height: 10,
                                              ),
                                            ]);
                                      })))
                              : pw.Container()
                        ]),
                  ],
                ),
                pw.SizedBox(
                  height: 5,
                ),
                pw.Divider(
                  height: 1.5,
                  color: PdfColors.grey600,
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                          padding: pw.EdgeInsets.only(top: 10),
                          child: pw.Text("REFERENCE",
                              style: pw.TextStyle(
                                  fontSize: 15,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.grey700))),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Divider(
                        height: 1.5,
                        color: PdfColors.grey600,
                      ),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Text(data[8]["referencename"],
                          style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.grey800)),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Text(data[8]["referencejob"],
                          style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.grey800)),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Text(data[8]["referencecompany"],
                          style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.grey800)),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Text(data[8]["referenceemail"],
                          style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.grey800)),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Text(data[8]["referencephone"],
                          style: pw.TextStyle(
                              fontSize: 15,
                              color: PdfColors.grey800)),
                      pw.SizedBox(
                        height: 5,
                      ),
                    ])
              ],
            ))
          ]));
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(
  PdfPageFormat format,
) async {
  final bgShape = await rootBundle.loadString('assets/resume.svg');
  format = PdfPageFormat.a4.applyMargin(left: 0, top: 0, right: 0, bottom: 0);
  return pw.PageTheme(
    pageFormat: format,
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        // child: pw.Stack(
        //   children: [
        //     pw.Positioned(
        //       child: pw.SvgImage(svg: bgShape),
        //       left: 0,
        //       top: 0,
        //     ),
        //     pw.Positioned(
        //       child: pw.Transform.rotate(
        //           angle: pi, child: pw.SvgImage(svg: bgShape)),
        //       right: 0,
        //       bottom: 0,
        //     ),
        //   ],
        // ),
      );
    },
  );
}
