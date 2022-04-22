import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_overview/models/money/money_category.dart';
import 'package:money_overview/models/money/money_payment_type.dart';
import 'package:money_overview/models/money/money_type.dart';
import 'package:money_overview/pages/add/local_widgets/dropdowns/dropdown_items_model.dart';
import 'package:money_overview/themes/style_templates/custom_input_decoration_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class MoneyCategoryDropdownWidget extends StatefulWidget {
  final DropdownItemsModel dropdownItems;
  final bool isEnabled;
  MoneyCategory? value;

  MoneyCategoryDropdownWidget({Key? key, required this.dropdownItems, required this.isEnabled, this.value})
      : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<MoneyCategoryDropdownWidget> {
  List<MoneyCategory> listOfValue = MoneyCategory.values.sublist(0, MoneyCategory.values.length - 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 6),
      child: SizedBox(
        width: 800.0,
        child: DropdownButtonFormField(
            value: super.widget.value ?? super.widget.dropdownItems.moneyCategoryValue,
            style: CustomTextStyle.header3Text(context),
            dropdownColor: super.widget.isEnabled
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColor.withOpacity(0.5),
            decoration: CustomInputDecorationStyle.input3OutlineStyle(
                context, super.widget.dropdownItems.moneyCategoryValue.icon()),
            items: listOfValue.map((MoneyCategory val) {
              return DropdownMenuItem(
                value: val,
                child: Text(val.display()),
              );
            }).toList(),
            onChanged: (MoneyCategory? val) {
              super.widget.dropdownItems.editMoneyCategory(val!);
              setState(() {});
            }),
      ),
    );
  }
}
