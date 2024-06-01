import 'package:flutter/material.dart';
import 'package:ledsdoit/constants/messages.dart';
import 'package:ledsdoit/widgets/empty_data_message_widget.dart';
import 'package:ledsdoit/constants/app_sizes.dart';

class SearchHistoryWidget extends StatelessWidget {
  final List<String> searchHistoryList;

  const SearchHistoryWidget({super.key, required this.searchHistoryList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: searchHistoryList.isEmpty
            ? const EmptyDataMessageWidget(
                message: EmptyDataMessages.emptyHistory,
              )
            : ListView.builder(
                itemCount: searchHistoryList.length,
                itemBuilder: (context, index) {
                  final searchQuery = searchHistoryList[index];

                  return Column(
                    children: [
                      SizedBox(
                        height: 55,
                        child: ListTile(
                          title: Text(searchQuery),
                        ),
                      ),
                      gapH8,
                    ],
                  );
                }));
  }
}
