import 'package:flutter/material.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/pages/add/local_widgets/dropdowns/dropdown_items_model.dart';
import 'package:money_overview/themes/style_templates/custom_input_decoration_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class MoneyCycleDropdownWidget extends StatefulWidget {
  final DropdownItemsModel dropdownItems;
  final bool isEnabled;
  MoneyCycle? value;

  MoneyCycleDropdownWidget({Key? key, required this.dropdownItems, required this.isEnabled, this.value})
      : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<MoneyCycleDropdownWidget> {
  List<MoneyCycle> listOfValue = MoneyCycle.values.sublist(0, MoneyCycle.values.length - 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 14, right: 14, bottom: 6),
      child: SizedBox(
        width: 800.0,
        child: DropdownButtonFormField(
            value: super.widget.value ?? super.widget.dropdownItems.moneyCycleValue,
            isDense: false,
            style: CustomTextStyle.header3Text,
            dropdownColor: super.widget.isEnabled ? Colors.white : Colors.white.withOpacity(0.5),
            decoration:
                CustomInputDecorationStyle.input3OutlineStyle(super.widget.dropdownItems.moneyCycleValue.icon()),
            items: listOfValue.map((MoneyCycle val) {
              return DropdownMenuItem(
                value: val,
                child: Text(val.display()),
              );
            }).toList(),
            onChanged: (MoneyCycle? val) {
              super.widget.dropdownItems.editMoneyCycle(val!);
              setState(() {});
            }),
      ),
    );
  }
}
