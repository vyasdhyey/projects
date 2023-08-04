import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

Future<Uint8List> templateClassic1(
    PdfPageFormat format, List<dynamic> data) async {
  final doc = pw.Document(title: 'My Resume');

  // final profileImage = pw.MemoryImage(
  //   (await rootBundle.load('assets/profile.jpg')).buffer.asUint8List(),
  // );

  final pageTheme = await _myPageTheme(format);
  const PdfColor green = PdfColor.fromInt(0x0684e);
  const PdfColor headerGreen = PdfColor.fromInt(0xff26a69a);
  const PdfColor grey = PdfColor.fromInt(0x1f000000);

  doc.addPage(pw.MultiPage(
      pageTheme: pageTheme,
      build: (pw.Context context) => [
        pw.Container(margin: pw.EdgeInsets.all(1),
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
                      pw.Wrap(
                        children: [
                          pw.Text(data[0]["email"],
                              style: const pw.TextStyle(
                                  fontSize: 12, color: PdfColors.grey800)),
                          pw.Text("  |  "),
                          pw.Text(data[0]["mobile"],
                              style: const pw.TextStyle(
                                  fontSize: 12, color: PdfColors.grey800)),
                        ],
                      ),
                      pw.SizedBox(
                        height: 15,
                      ),
                      pw.Wrap(direction: pw.Axis.horizontal, children: [
                        pw.Text(data[0]["flat/house"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                        pw.Text(", "),
                        pw.Text(data[0]["area"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                        pw.Text(", "),
                        pw.Text(data[0]["landmark"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                        pw.Text(", "),
                        pw.Text(data[0]["city"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                        pw.Text(", "),
                        pw.Text(data[0]["state"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                        pw.Text(", "),
                        pw.Text(data[0]["pincode"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),
                        pw.Text(", "),
                        pw.Text(data[0]["socialmedia"],
                            style: const pw.TextStyle(
                                fontSize: 12, color: PdfColors.grey800)),

                      ])
                    ])),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                        padding: pw.EdgeInsets.only(top: 10),
                        child: pw.Text("CAREER OBJECTIVE",
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
                      height: 15,
                    ),
                    data[1] != "empty"
                        ? pw.Container(
                        width: 450,
                        padding: pw.EdgeInsets.only(top: 2),
                        child: pw.Text(data[1],
                            style: pw.TextStyle(
                                fontSize: 11, color: PdfColors.grey700)))
                        : pw.Container(),
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                        padding: pw.EdgeInsets.only(top: 10),
                        child: pw.Text("EDUCATION",
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

                    data[3] != "empty"
                        ? pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children:
                      List.generate(
                        (data[3].length / 2).ceil(), // Number of rows (assuming 2 items per row)
                            (rowIndex) {
                          final startIndex = rowIndex * 2;
                          final endIndex = startIndex + 1 < data[3].length ? startIndex + 1 : startIndex;

                          return pw.Row(
                            children: List.generate(
                              endIndex - startIndex + 1,
                                  (index) => pw.Expanded(
                                child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      height: 8,
                                    ),
                                    pw.Text(data[3][startIndex + index]["institute_name"],
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold,
                                            color: PdfColors.grey800)),
                                    pw.SizedBox(
                                      height: 2,
                                    ),
                                    pw.Text(
                                        "${data[3][startIndex + index]["start_date"]}  -  ${data[3][startIndex + index]["end_date"]}",
                                        style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
                                    pw.SizedBox(
                                      height: 2,
                                    ),
                                    pw.Text(data[3][startIndex + index]["degree"],
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold,
                                            color: PdfColors.grey800)),
                                    pw.SizedBox(
                                      height: 2,
                                    ),
                                    pw.Text(data[3][startIndex + index]["grade"],
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold,
                                            color: PdfColors.grey800)),
                                    pw.SizedBox(
                                      height: 2,
                                    ),
                                    pw.Text(data[3][startIndex + index]["comments"],
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold,
                                            color: PdfColors.grey800)),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )





                    // data[3] != "empty"
                    //     ? pw.ListView.builder(
                    //   direction: pw.Axis.horizontal,
                    //     itemCount: data[3].length,
                    //     itemBuilder: (context, index) {
                    //       return pw.Column(
                    //           crossAxisAlignment:
                    //           pw.CrossAxisAlignment.start,
                    //           mainAxisAlignment: pw.MainAxisAlignment.start,
                    //           children: [
                    //             pw.Text(data[3][index]["institute_name"],
                    //                 style: pw.TextStyle(
                    //                     fontSize: 12,
                    //                     fontWeight: pw.FontWeight.bold,
                    //                     color: PdfColors.grey800)),
                    //             pw.SizedBox(
                    //               height: 2,
                    //             ),
                    //             pw.Text(
                    //                 "${data[3][index]["start_date"]}  -  ${data[3][index]["end_date"]}",
                    //                 style: pw.TextStyle(
                    //                     fontSize: 10,
                    //                     color: PdfColors.grey700)),
                    //             pw.SizedBox(
                    //               height: 2,
                    //             ),
                    //             pw.Text(data[3][index]["degree"],
                    //                 style: pw.TextStyle(
                    //                     fontSize: 12,
                    //                     fontWeight: pw.FontWeight.bold,
                    //                     color: PdfColors.grey800)),
                    //             pw.SizedBox(
                    //               height: 2,
                    //             ),
                    //             pw.Text(data[3][index]["grade"],
                    //                 style: pw.TextStyle(
                    //                     fontSize: 12,
                    //                     fontWeight: pw.FontWeight.bold,
                    //                     color: PdfColors.grey800)),
                    //             pw.SizedBox(
                    //               height: 2,
                    //             ),
                    //             pw.Text(data[3][index]["comments"],
                    //                 style: pw.TextStyle(
                    //                     fontSize: 12,
                    //                     fontWeight: pw.FontWeight.bold,
                    //                     color: PdfColors.grey800)),
                    //             pw.SizedBox(
                    //               height: 2,
                    //             ),
                    //           ]);
                    //     })
                        : pw.Container()
                  ],
                ),
                pw.SizedBox(height: 15),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Container(
                        padding: pw.EdgeInsets.only(top: 10),
                        child: pw.Text("Hobbies",
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
                    data[5] != "empty"
                        ? pw.SizedBox(
                        width: 250,
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
                pw.SizedBox(height: 15),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Container(
                        padding: pw.EdgeInsets.only(top: 10),
                        child: pw.Text("LANGUAGES",
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
                    data[5] != "empty"
                        ? pw.SizedBox(
                        width: 250,
                        child: pw.Wrap(
                            direction: pw.Axis.horizontal,
                            children:
                            List.generate(data[6].length, (index) {
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
                                    pw.Text(data[6][index],
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
                pw.SizedBox(height: 15),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Container(
                        padding: pw.EdgeInsets.only(top: 10),
                        child: pw.Text("SKILLS",
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
                    data[8] != "empty"
                        ? pw.SizedBox(
                        width: 250,
                        child: pw.Wrap(
                            direction: pw.Axis.horizontal,
                            children:
                            List.generate(data[8].length, (index) {
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
                                    pw.Text(data[8][index],
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
                pw.SizedBox(
                  height: 20,
                ),
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                        padding: const pw.EdgeInsets.only(top: 10),
                        child: pw.Text("CERTIFICATION",
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
                      height: 15,
                    ),

                    data[2] != "empty"
                        ? pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: List.generate(
                        (data[2].length / 2).ceil(), // Number of rows (assuming 2 items per row)
                            (rowIndex) {
                          final startIndex = rowIndex * 2;
                          final endIndex = startIndex + 1 < data[2].length ? startIndex + 1 : startIndex;

                          return pw.Row(
                            children: List.generate(
                              endIndex - startIndex + 1,
                                  (index) => pw.Expanded(
                                child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      height: 8,
                                    ),
                                    pw.Text(data[2][startIndex + index]["issue_desc"],
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold,
                                            color: PdfColors.grey800)),
                                    pw.SizedBox(
                                      height: 2,
                                    ),

                                    pw.Text(data[2][startIndex + index]["course_name"],
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold,
                                            color: PdfColors.grey800)),
                                    pw.SizedBox(
                                      height: 2,
                                    ),
                                    pw.Text(
                                        "${data[2][startIndex + index]["start_date"]}  -  ${data[2][startIndex + index]["end_date"]}",
                                        style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
                                    pw.SizedBox(
                                      height: 2,
                                    ),
                                    pw.Text(data[2][startIndex + index]["link"],
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold,
                                            color: PdfColors.grey800)),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )

                        : pw.Container()
                  ],
                ),
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                        padding: pw.EdgeInsets.only(top: 10),
                        child: pw.Text("EXPERIENCE",
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

                    data[4] != "empty"
                        ? pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: List.generate(
                        (data[4].length / 2).ceil(), // Number of rows (assuming 2 items per row)
                            (rowIndex) {
                          final startIndex = rowIndex * 2;
                          final endIndex = startIndex + 1 < data[4].length ? startIndex + 1 : startIndex;

                          return pw.Row(
                            children: List.generate(
                              endIndex - startIndex + 1,
                                  (index) => pw.Expanded(
                                child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  children: [
                                    pw.SizedBox(
                                      height: 8,
                                    ),
                                    pw.Text(data[4][startIndex + index]["company_name"],
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold,
                                            color: PdfColors.grey800)),
                                    pw.SizedBox(
                                      height: 2,
                                    ),
                                    pw.Text(
                                        "${data[4][startIndex + index]["start_date"]}  -  ${data[4][startIndex + index]["end_date"]}",
                                        style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
                                    pw.SizedBox(
                                      height: 2,
                                    ),
                                    pw.Text(data[4][startIndex + index]["content"],
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold,
                                            color: PdfColors.grey800)),
                                    pw.SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                        : pw.Container()
                  ],
                ),
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                        padding: pw.EdgeInsets.only(top: 10),
                        child: pw.Text("PROJECT",
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
                    data[7] != "empty"
                        ? pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: List.generate(data[7].length, (index) {
                          return pw.Column(
                              crossAxisAlignment:
                              pw.CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(data[7][index]["project_name"],
                                    style: pw.TextStyle(
                                        fontSize: 12,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.grey800)),
                                pw.SizedBox(
                                  height: 2,
                                ),
                                pw.Text(data[7][index]["project_role"],
                                    style: pw.TextStyle(
                                        fontSize: 12,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.grey800)),
                                pw.SizedBox(
                                  height: 2,
                                ),
                                pw.Text(
                                    "${data[7][index]["start_date"]}  -  ${data[7][index]["end_date"]}",
                                    style: pw.TextStyle(
                                        color: PdfColors.grey700)),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Text(data[7][index]["description"],
                                    style: pw.TextStyle(
                                        color: PdfColors.grey600)),
                              ]);
                        }))
                        : pw.Container()
                  ],
                ),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
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
                        height: 15,
                      ),
                      pw.Text(data[9]["referencename"],
                          style: pw.TextStyle(
                              color: PdfColors.grey800)),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Text(data[9]["referencejob"],
                          style: pw.TextStyle(
                              color: PdfColors.grey800)),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Text(data[9]["referencecompany"],
                          style: pw.TextStyle(
                              color: PdfColors.grey800)),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Text(data[9]["referenceemail"],
                          style: pw.TextStyle(
                              color: PdfColors.grey800)),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Text(data[9]["referencephone"],
                          style: pw.TextStyle(
                              color: PdfColors.grey800)),

                    ]),
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