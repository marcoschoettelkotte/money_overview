import 'package:flutter/cupertino.dart';
import 'package:money_overview/models/money/money_category.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/pages/add/local_widgets/dropdowns/dropdown_items_model.dart';
import 'package:money_overview/pages/add/local_widgets/dropdowns/money_category_dropdown_widget.dart';
import 'package:money_overview/pages/add/local_widgets/dropdowns/money_cycle_dropdown_widget.dart';
import 'package:money_overview/pages/add/local_widgets/dropdowns/money_payment_type_dropdown_widget.dart';
import 'package:money_overview/pages/add/local_widgets/dropdowns/money_type_dropdown_widget.dart';
import 'package:money_overview/pages/add/local_widgets/save_button_widget.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';
import 'package:money_overview/widgets/input/input_number_widget.dart';
import 'package:money_overview/widgets/input/input_text_widget.dart';

class AddFormWidget extends StatefulWidget {
  final ScrollController scrollController;

  const AddFormWidget({Key? key, required this.scrollController}) : super(key: key);

  @override
  _AddFormWidgetState createState() => _AddFormWidgetState();
}

class _AddFormWidgetState extends State<AddFormWidget> {
  final TextEditingController _moneyAmountController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noticeController = TextEditingController();
  final dropdownItems = DropdownItemsModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((_, int index) {
      return Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 50, left: 22, right: 22),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Add Transaction",
                style: CustomTextStyle.header3Text(context),
              ),
              InputNumberWidget(enabled: true, controller: _moneyAmountController, placeholder: '0.00'),
              InputTextWidget(
                enabled: true,
                controller: _titleController,
                placeholder: 'Title',
              ),
              MoneyTypeDropdownWidget(
                dropdownItems: dropdownItems,
                isEnabled: true,
              ),
              MoneyCycleDropdownWidget(dropdownItems: dropdownItems, isEnabled: true),
              MoneyPaymentTypeDropdownWidget(dropdownItems: dropdownItems, isEnabled: true),
              MoneyCategoryDropdownWidget(dropdownItems: dropdownItems, isEnabled: true),
              InputTextWidget(
                enabled: true,
                controller: _noticeController,
                placeholder: 'Notice',
              ),
              SaveButtonWidget(
                  scrollController: super.widget.scrollController,
                  moneyAmountController: _moneyAmountController,
                  titleController: _titleController,
                  noticeController: _noticeController,
                  dropdownItems: dropdownItems,
                  formKey: _formKey),
            ],
          ),
        ),
      );
    }, childCount: 1));
  }
}
