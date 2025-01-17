import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/fake_data/person_contact.dart';

class PhoneView extends StatefulWidget {
  const PhoneView({super.key});

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  var listItems = PersonContact.listContact;
  List<PersonContact> newListItems = [];
  var searchHistory = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    queryListener();
    searchController.addListener(queryListener);
    super.initState();
  }

  void queryListener() {
    search(searchController.text);
  }

  void search(String query) {
    if(query.isEmpty) {
      setState(() {
        newListItems = listItems;
      });
    }
    else {
      setState(() {
        newListItems = listItems
            .where((element) => element.name.toLowerCase().contains(query.toLowerCase())
            || element.phone.contains(query))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    searchController
      ..removeListener(queryListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SearchBar(
                  controller: searchController,
                  hintText: 'Nhập số điện thoại',
                  trailing: [
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: AppColors.textGreyColor,
                      ),
                      onPressed: () {},
                    ),
                  ],
                  backgroundColor: MaterialStateProperty.all(AppColors.primaryOpa11),
                  elevation: MaterialStateProperty.all(0),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(28.0))
                        ),
                        title: Text(
                          'Thông báo',
                          style: AppTextStyles.textStyleInterW400S24Black,
                        ),
                        content: Text(
                            'Cuộc gọi sẽ được chuyển đến số điện thoại',
                            style: AppTextStyles.textStyleInterW400S14Grey
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              AppStrings.cancel,
                              style: AppTextStyles.textStyleInterW500S14Primary,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              AppStrings.ok,
                              style: AppTextStyles.textStyleInterW500S14Primary,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Chuyển',
                    style: AppTextStyles.textStyleInterW500S14White,
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
