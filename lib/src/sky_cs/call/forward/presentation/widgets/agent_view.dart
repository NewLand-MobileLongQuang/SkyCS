import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/fake_data/person_contact.dart';

class AgentView extends StatefulWidget {
  const AgentView({super.key});

  @override
  State<AgentView> createState() => _AgentViewState();
}

class _AgentViewState extends State<AgentView> {
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
    searchController..removeListener(queryListener)
    ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SearchBar(
            controller: searchController,
            hintText: 'Nhập tên, số máy lẻ',
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
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final contact = PersonContact.listContact[index];
                return Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          newListItems[index].name,
                          style: AppTextStyles.textStyleInterW400S16Black,
                        ),
                        Text(
                          newListItems[index].phone,
                          style: AppTextStyles.textStyleInterW400S14Black,
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                    Expanded(child: Container()),
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
                                  'Cuộc gọi sẽ được chuyển đến Agent ${newListItems[index].name}',
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
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          'Chuyển',
                          style: AppTextStyles.textStyleInterW400S11White,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) =>
              const Divider(
                height: 1,
                color: AppColors.divideColor,
              ),
              itemCount: newListItems.length,
            )
          ),
        ],
      ),
    );
  }
}
