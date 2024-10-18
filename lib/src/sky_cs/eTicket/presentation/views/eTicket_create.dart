// import 'package:flutter/material.dart';
// import 'package:idnstd/core/common/widgets/inputs/i_select_field.dart';
// import 'package:idnstd/core/common/widgets/inputs/i_select_time.dart';
// import 'package:idnstd/core/common/widgets/inputs/i_text_field.dart';
// import 'package:idnstd/core/res/colors.dart';
// import 'package:idnstd/core/res/strings.dart';
// import 'package:idnstd/core/res/test_style.dart';
// import 'package:intl/intl.dart';
//
// class eTicketCreateScreen extends StatefulWidget {
//   const eTicketCreateScreen({super.key});
//
//   static const routeName = '/eTicket_create';
//
//   @override
//   State<eTicketCreateScreen> createState() => _eTicketCreateScreenState();
// }
//
// class _eTicketCreateScreenState extends State<eTicketCreateScreen> {
//   late bool _isSaving =true;
//   @override
//   void initState() {
//     super.initState();
//     _isSaving = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColors.primaryColor,
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios_new_rounded,
//               color: AppColors.textWhiteColor,
//             ),
//             onPressed: () => Navigator.of(context).maybePop(),
//           ),
//           title: _textTitle(),
//           actions: [
//             IconButton(
//               icon: _isSaving ? CircularProgressIndicator() : Icon(Icons.save,),
//               color: Colors.white,
//               onPressed: _isSaving ? null : () {
//                 setState(() {
//                   _isSaving = true;
//                 });
//                 Future.delayed(Duration(seconds: 2), () {
//                   setState(() {
//                     _isSaving = false;
//                   });
//
//                 });
//               },
//             ),
//           ],
//         ),
//         body: DefaultTabController(
//                 length: 2,
//                 child: Column(
//                   children: <Widget>[
//                     const TabBar(
//                       tabs: [
//                         Tab(text: 'Thông tin chính'),
//                         Tab(text: 'Thông tin bổ sung'),
//                       ],
//                       indicatorColor: AppColors.textWhiteColor,
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                         child: TabBarView(
//                           children: [
//                             MainInfoTab(),
//                             AdditionalInfoTab(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }
//
//   Widget _textTitle() {
//     return Text(
//       AppStrings.eTicketcreate,
//       style: AppTextStyles.textStyleInterW500S18White,
//       maxLines: 2,
//     );
//   }
// }
//
// class MainInfoTab extends StatefulWidget {
//   @override
//   _MainInfoTabState createState() => _MainInfoTabState();
// }
//
// class _MainInfoTabState extends State<MainInfoTab> {
//   final List<String> categories = ["Hỗ trợ khách hàng", "Bảo hành", "Khiếu nại", "Khiếu nại nhóm 1"];
//   final List<String> customers = ["Khách hàng A", "Khách hàng B", "Khách hàng C"];
//   final List<String> departments = ["Phòng ban 1", "Phòng ban 2", "Phòng ban 3"];
//   final List<String> detail = ["Chi tiết 1", "Phòng ban 2", "Phòng ban 3"];
//   final List<String> agents = ["Agent 1", "Agent 2", "Agent 3"];
//   final List<String> priorities = ["Cao", "Trung bình", "Thấp"];
//   final List<String> branches = ["Chi nhánh 1", "Chi nhánh 2", "Chi nhánh 3"];
//   final List<String> statuses = ["Đang xử lý", "Hoàn thành", "Đã đóng"];
//
//   late String selectedCategory;
//   late String selectedCustomer;
//   late String selectedDetail;
//   late String selectedDepartment;
//   late String selectedAgent;
//   late String selectedPriority;
//   late String selectedBranch;
//   late String selectedStatus;
//
//   late DateTime selectedDateTime;
//
//   late TextEditingController? _dateTimeController;
//
//
//   @override
//   @override
//   void initState() {
//     super.initState();
//     selectedCategory = categories[0];
//     selectedCustomer = customers[0];
//     selectedDetail = detail[0];
//     selectedDepartment = departments[0];
//     selectedAgent = agents[0];
//     selectedPriority = priorities[0];
//     selectedBranch = branches[0];
//     selectedStatus = statuses[0];
//     selectedDateTime = DateTime.now();
//     _dateTimeController = TextEditingController();
//     _updateDateTimeText();
//   }
//
//
//   @override
//   void dispose() {
//     _dateTimeController?.dispose();
//     super.dispose();
//   }
//
//   void _updateDateTimeText() {
//     _dateTimeController?.text = DateFormat('dd/MM/yyyy HH:mm').format(selectedDateTime);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_dateTimeController == null) {
//       _dateTimeController = TextEditingController();
//       _updateDateTimeText();
//     }
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text("Mã eTicket: "),
//               Text("#TK001"),
//             ],
//           ),
//           SizedBox(height: 16,),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: categories,
//             hintText: "Chọn phân loại",
//             value: selectedCategory,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedCategory = newValue;
//                 });
//               }
//             },
//           ),
//           SizedBox(height: 16,),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: customers,
//             hintText: "Chọn khách hàng",
//             value: selectedCustomer,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedCustomer = newValue;
//                 });
//               }
//             },
//           ),
//           SizedBox(height: 16,),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: detail,
//             hintText: "Tên eTicket",
//             value: selectedDetail,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedDetail = newValue;
//                 });
//               }
//             },
//           ),
//           SizedBox(height: 16,),
//           Row(
//             children: [
//               Text("File đính kèm"),
//               IconButton(onPressed: (){}, icon: Icon(Icons.attach_file)),
//             ],
//           ),
//           SizedBox(height: 16,),
//           DateTimePickerField(
//             controller: _dateTimeController,
//             label: 'Deadline',
//             readOnly: false,
//           ),
//           SizedBox(height: 16,),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: departments,
//             hintText: "Chọn phòng ban",
//             value: selectedDepartment,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedDepartment = newValue;
//                 });
//               }
//             },
//           ),
//           SizedBox(height: 16,),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: agents,
//             hintText: "Chọn agent",
//             value: selectedAgent,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedAgent = newValue;
//                 });
//               }
//             },
//           ),
//           SizedBox(height: 16,),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: priorities,
//             hintText: "Chọn mức ưu tiên",
//             value: selectedPriority,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedPriority = newValue;
//                 });
//               }
//             },
//           ),
//           SizedBox(height: 16,),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: branches,
//             hintText: "Chọn chi nhánh",
//             value: selectedBranch,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedBranch = newValue;
//                 });
//               }
//             },
//           ),
//           SizedBox(height: 16,),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: statuses,
//             hintText: "Chọn trạng thái",
//             value: selectedStatus,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedStatus = newValue;
//                 });
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AdditionalInfoTab extends StatefulWidget {
//   @override
//   _AdditionalInfoTabState createState() => _AdditionalInfoTabState();
// }
//
// class _AdditionalInfoTabState extends State<AdditionalInfoTab> {
//   final List<String> categories = ["Hỗ trợ khách hàng", "Bảo hành", "Khiếu nại", "Khiếu nại nhóm 1"];
//   final List<String> customers = ["Khách hàng A", "Khách hàng B", "Khách hàng C"];
//   final List<String> departments = ["Phòng ban 1", "Phòng ban 2", "Phòng ban 3"];
//   final List<String> detail = ["Chi tiết 1", "Phòng ban 2", "Phòng ban 3"];
//   final List<String> agents = ["Agent 1", "Agent 2", "Agent 3"];
//   final List<String> priorities = ["Cao", "Trung bình", "Thấp"];
//   final List<String> branches = ["Chi nhánh 1", "Chi nhánh 2", "Chi nhánh 3"];
//   final List<String> statuses = ["Đang xử lý", "Hoàn thành", "Đã đóng"];
//
//   late String selectedCategory;
//   late String selectedCustomer;
//   late String selectedDetail;
//   late String selectedDepartment;
//   late String selectedAgent;
//   late String selectedPriority;
//   late String selectedBranch;
//   late String selectedStatus;
//
//   late DateTime selectedDateTime;
//
//   late TextEditingController? _dateTimeController;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedCategory = categories[0];
//     selectedCustomer = customers[0];
//     selectedDetail = detail[0];
//     selectedDepartment = departments[0];
//     selectedAgent = agents[0];
//     selectedPriority = priorities[0];
//     selectedBranch = branches[0];
//     selectedStatus = statuses[0];
//     selectedDateTime = DateTime.now();
//     _dateTimeController = TextEditingController();
//     _updateDateTimeText();
//   }
//
//   @override
//   void dispose() {
//     _dateTimeController?.dispose();
//     super.dispose();
//   }
//
//   void _updateDateTimeText() {
//     _dateTimeController?.text = DateFormat('dd/MM/yyyy HH:mm').format(selectedDateTime);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_dateTimeController == null) {
//       _dateTimeController = TextEditingController();
//       _updateDateTimeText();
//     }
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 16),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: categories,
//             hintText: "Phân loại tùy chọn",
//             value: selectedCategory,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedCategory = newValue;
//                 });
//               }
//             },
//           ),
//           SizedBox(height: 16),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: customers,
//             hintText: "Nguồn",
//             value: selectedCustomer,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedCustomer = newValue;
//                 });
//               }
//             },
//           ),
//           SizedBox(height: 16),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: detail,
//             hintText: "Kênh tiếp nhận",
//             value: selectedDetail,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedDetail = newValue;
//                 });
//               }
//             },
//           ),
//           SizedBox(height: 16),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: departments,
//             hintText: "Kênh liên hệ mong muốn",
//             value: selectedDepartment,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedDepartment = newValue;
//                 });
//               }
//             },
//           ),
//           SizedBox(height: 16),
//           ITextField(
//             label: 'Tags',
//             maxLines: 1,
//           ),
//           SizedBox(height: 16),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: priorities,
//             hintText: "Người theo dõi",
//             value: selectedPriority,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedPriority = newValue;
//                 });
//               }
//             },
//           ),
//           SizedBox(height: 16),
//           ISelectField(
//             getLabel: (String value) => value,
//             options: branches,
//             hintText: "SLA",
//             value: selectedBranch,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   selectedBranch = newValue;
//                 });
//               }
//             },
//           ),
//           SizedBox(height: 16),
//           ITextField(
//             label: 'Nhắc việc',
//             maxLines: 1,
//           ),
//           SizedBox(height: 16),
//           DateTimePickerField(
//             controller: _dateTimeController,
//             label: 'Vào lúc',
//             readOnly: false,
//           ),
//         ],
//       ),
//     );
//   }
// }