// import 'dart:convert';
//
// import 'package:date_time_picker/date_time_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:resume_builder/resumeformscreen/sharedpreference.dart';
// import 'package:resume_builder/resumeformscreen/education_details/education_form.dart';
// import 'package:resume_builder/resumeformscreen/text_field_Style.dart';
//
// import '../../resumeformscreen/education_details/education_switch.dart';
//
//
// class AddEducation extends StatefulWidget {
//   const AddEducation({Key? key}) : super(key: key);
//
//   @override
//   State<AddEducation> createState() => _AddEducationState();
// }
//
// class _AddEducationState extends State<AddEducation> {
//   final SharedPreferencesService _prefs = SharedPreferencesService();
//   TextEditingController instituteNameController = TextEditingController();
//   // TextEditingController startDateController = TextEditingController();
//   // TextEditingController endDate = TextEditingController();
//   TextEditingController gradeController = TextEditingController();
//   TextEditingController commentsController = TextEditingController();
//   late String startDate;
//   late String endDate;
//
//   saveEducationInfo() async {
//     Map<String, dynamic> educationInfo = {
//       "institute_name":instituteNameController.text,
//       "start_date": startDate,
//       "end_date": endDate,
//       "grade":gradeController.text,
//       "comments":commentsController.text
//     };
//     await _prefs.saveToSharedPref('education-data', jsonEncode(educationInfo));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: SingleChildScrollView(
//         child: Form(
//           child: Container(
//             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//             child: Column(
//               children: [
//                 const SizedBox(height: 30,),
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
//                   decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(10)
//                   ),
//                   child: TextFormField(
//                     controller: instituteNameController,
//                     decoration: textFieldDecoration("Enter your institute name here", "Institute name"),
//                     validator: (value){
//                       if (instituteNameController.text.isEmpty) {
//                         return "Institute name cannot be empty";
//                       } else {
//                         return null;
//                       }
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius: BorderRadius.circular(10)
//                       ),
//                       padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
//                       width: MediaQuery.of(context).size.width * 0.45,
//                       child: DateTimePicker(
//                         decoration: textFieldDecoration("Start date", "Start date"),
//                         firstDate: DateTime(1900),
//                         lastDate: DateTime.now(),
//                         dateLabelText: "Start date",
//                         onChanged: (val) {
//                           String formatDate = val.toString();
//                           var pos = formatDate.lastIndexOf(' ');
//                           String result = (pos != -1)? formatDate.substring(0, pos): formatDate;
//                           setState(() {
//                             startDate = result;
//                           });
//                         },
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius: BorderRadius.circular(10)
//                       ),
//                       padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
//                       width: MediaQuery.of(context).size.width * 0.45,
//                       child: DateTimePicker(
//                         decoration: textFieldDecoration("End date", "End date"),
//                         firstDate: DateTime(1900),
//                         lastDate: DateTime.now(),
//                         dateLabelText: "End date",
//                         onChanged: (val) {
//                           String formatDate = val.toString();
//                           var pos = formatDate.lastIndexOf(' ');
//                           String result = (pos != -1)? formatDate.substring(0, pos): formatDate;
//                           setState(() {
//                             endDate = result;
//                           });
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20,),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(10)
//                   ),
//                   padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
//                   child: TextFormField(
//                     controller: gradeController,
//                     decoration: textFieldDecoration("Enter your grade here", "Grade"),
//                     validator: (value){
//                       if (gradeController.text.length > 50) {
//                         return "Grade exceeding the character limit";
//                       } else {
//                         return null;
//                       }
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20,),
//                 Container(
//                     decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(10)
//                   ),
//                   padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
//                   height: MediaQuery.of(context).size.height * 0.2,
//                   child: TextFormField(
//                     controller: commentsController,
//                     decoration: InputDecoration(
//                       hintText: "Comments",
//                       labelText: "Enter comment here",
//                       filled: true,
//                       fillColor: Colors.grey[300],
//                       labelStyle: TextStyle(color: Colors.black54),
//                       focusColor: Colors.black87,
//                       contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                       border: InputBorder.none
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.45,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                       primary: Colors.teal[300]
//                     ),
//                         onPressed: () {
//                           saveEducationInfo();
//                           dispose();
//
//                         },
//                         child: const Text("Save details")
//                       ),
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.45,
//                       child: ElevatedButton(
//                         onPressed: (){
//                           dispose();
//
//                         },
//                         child: const Text("Discard")
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )
//       ),
//     );
//   }
// }
//
// Widget build(BuildContext context) {
//   int educationCount = educationList.length;
//
//   return Stack(
//     children: [
//       WillPopScope(
//         onWillPop: () => _onBackButtonPressed(context),
//         child: SingleChildScrollView(
//           child: switchToAdd == false && educationCount < 3
//               ? Container(
//             padding: EdgeInsets.only(left: 15, right: 15),
//             child: Column(
//               children: [
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: Color.fromARGB(255, 0, 121, 139),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       switchToAdd = true;
//                     });
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Text("Add education"),
//                       Icon(Icons.add, color: Colors.white),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.8,
//                   padding: const EdgeInsets.all(0),
//                   child: ListView.builder(
//                     itemCount: educationList.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         padding: const EdgeInsets.all(15),
//                         margin: const EdgeInsets.only(top: 10),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               mainAxisAlignment:
//                               MainAxisAlignment.start,
//                               crossAxisAlignment:
//                               CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   educationList[index]
//                                   ["institute_name"],
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   '${educationList[index]["start_date"].toString() != null ? DateFormat("dd-MM-yyyy").format(DateTime.parse(educationList[index]["start_date"])) : "-"}',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 18,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   '${educationList[index]["end_date"].toString() != null ? DateFormat("dd-MM-yyyy").format(DateTime.parse(educationList[index]["end_date"])) : "-"}',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 18,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(educationList[index]["degree"]),
//                                 const SizedBox(height: 5),
//                                 Text(educationList[index]["grade"]),
//                               ],
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 removeEducation(index);
//                                 setState(() {});
//                               },
//                               child: const Icon(Icons.delete),
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 )
//               ],
//             ),
//           )
//               : Container(
//             child: SingleChildScrollView(
//               child: Form(
//                 child: Container(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 30),
//                       Container(
//                         padding: const EdgeInsets.fromLTRB(
//                             10, 5, 10, 0),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[300],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: TextFormField(
//                           cursorColor:
//                           Color.fromARGB(255, 0, 121, 139),
//                           controller: instituteNameController,
//                           decoration: textFieldDecoration(
//                             "Enter your institute name here",
//                             "Institute name",
//                           ),
//                           validator: (value) {
//                             if (instituteNameController.text
//                                 .isEmpty) {
//                               return "Institute name cannot be empty";
//                             } else {
//                               return null;
//                             }
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment:
//                         MainAxisAlignment.spaceAround,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[300],
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             padding: const EdgeInsets.fromLTRB(
//                                 10, 5, 10, 0),
//                             width: MediaQuery.of(context).size.width *
//                                 0.45,
//                             child: DateTimePicker(
//                               decoration: textFieldDecoration(
//                                   "Start date", "Start date"),
//                               firstDate: DateTime(1900),
//                               lastDate: DateTime.now(),
//                               dateLabelText: "Start date",
//                               onChanged: (val) {
//                                 String formatDate = val.toString();
//                                 var pos =
//                                 formatDate.lastIndexOf(' ');
//                                 String result = (pos != -1)
//                                     ? formatDate.substring(0, pos)
//                                     : formatDate;
//                                 setState(() {
//                                   startDate = result;
//                                 });
//                               },
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[300],
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             padding: const EdgeInsets.fromLTRB(
//                                 10, 5, 10, 0),
//                             width: MediaQuery.of(context).size.width *
//                                 0.45,
//                             child: DateTimePicker(
//                               decoration: textFieldDecoration(
//                                   "End date", "End date"),
//                               firstDate: DateTime(1900),
//                               lastDate: DateTime.now(),
//                               dateLabelText: "End date",
//                               onChanged: (val) {
//                                 String formatDate = val.toString();
//                                 var pos =
//                                 formatDate.lastIndexOf(' ');
//                                 String result = (pos != -1)
//                                     ? formatDate.substring(0, pos)
//                                     : formatDate;
//                                 setState(() {
//                                   endDate = result;
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.grey[300],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         padding: const EdgeInsets.fromLTRB(
//                             10, 5, 10, 0),
//                         child: TextFormField(
//                           cursorColor:
//                           Color.fromARGB(255, 0, 121, 139),
//                           controller: degreeController,
//                           decoration: textFieldDecoration(
//                             "Enter your degree here",
//                             "Degree",
//                           ),
//                           validator: (value) {
//                             if (degreeController.text.length > 50) {
//                               return "Degree exceeding the character limit";
//                             } else {
//                               return null;
//                             }
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.grey[300],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         padding: const EdgeInsets.fromLTRB(
//                             10, 5, 10, 0),
//                         child: TextFormField(
//                           cursorColor:
//                           Color.fromARGB(255, 0, 121, 139),
//                           controller: gradeController,
//                           decoration: textFieldDecoration(
//                             "Enter your grade here",
//                             "Grade",
//                           ),
//                           validator: (value) {
//                             if (gradeController.text.length > 50) {
//                               return "Grade exceeding the character limit";
//                             } else {
//                               return null;
//                             }
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           primary: Color.fromARGB(255, 0, 121, 139),
//                         ),
//                         onPressed: () async {
//                           if (startDate.isNotEmpty &&
//                               endDate.isNotEmpty) {
//                             setState(() {
//                               isLoading = true;
//                             });
//
//                             Map<String, dynamic> educationData = {
//                               "institute_name":
//                               instituteNameController.text,
//                               "start_date": startDate,
//                               "end_date": endDate,
//                               "degree": degreeController.text,
//                               "grade": gradeController.text,
//                             };
//
//                             educationList.add(educationData);
//                             saveEducationInfoLocal();
//
//                             Fluttertoast.showToast(
//                               msg: "Education details added!",
//                               toastLength: Toast.LENGTH_SHORT,
//                               gravity: ToastGravity.BOTTOM,
//                               backgroundColor:
//                               Color.fromARGB(255, 0, 121, 139),
//                               textColor: Colors.white,
//                               fontSize: 16.0,
//                             );
//
//                             setState(() {
//                               isLoading = false;
//                               switchToAdd = false;
//                               instituteNameController.clear();
//                               degreeController.clear();
//                               gradeController.clear();
//                               startDate = '';
//                               endDate = '';
//                             });
//                           } else {
//                             Fluttertoast.showToast(
//                               msg:
//                               "Please select start and end dates",
//                               toastLength: Toast.LENGTH_SHORT,
//                               gravity: ToastGravity.BOTTOM,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               fontSize: 16.0,
//                             );
//                           }
//                         },
//                         child: Text("Save"),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       if (isLoading)
//         Container(
//           color: Colors.black.withOpacity(0.5),
//           child: Center(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//     ],
//   );
// }
//
// InputDecoration textFieldDecoration(String hintText, String labelText) {
//   return InputDecoration(
//     hintText: hintText,
//     labelText: labelText,
//     hintStyle: TextStyle(
//       fontSize: 16,
//       color: Colors.grey[500],
//     ),
//     border: InputBorder.none,
//   );
// }
//
// Future<bool> _onBackButtonPressed(BuildContext context) async {
//   if (switchToAdd == true) {
//     setState(() {
//       switchToAdd = false;
//       instituteNameController.clear();
//       degreeController.clear();
//       gradeController.clear();
//       startDate = '';
//       endDate = '';
//     });
//   } else {
//     Navigator.of(context).pop();
//   }
//   return true;
// }
// }
