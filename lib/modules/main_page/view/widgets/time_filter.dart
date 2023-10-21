import 'package:flutter/material.dart';
import '../../../../core/Constant/colors.dart';

class TimeFilter extends StatelessWidget {
  const TimeFilter({
    super.key,
    required this.filterBy,
    required this.onChanged,
    this.sortList,
  });
  final String filterBy;
  final void Function(dynamic)? onChanged;
  final List<String>? sortList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Filter by',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 3,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.centerRight,
              height: 40,
              width: MediaQuery.of(context).size.width / 3.5,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: Colors.white),
              child: DropdownButton(
                isExpanded: true,
                underline: SizedBox(),
                value: filterBy,
                items: sortList!
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                          ),
                        ))
                    .toList(),
                onChanged: onChanged,
              ))
        ],
      ),
    );
  }
}
