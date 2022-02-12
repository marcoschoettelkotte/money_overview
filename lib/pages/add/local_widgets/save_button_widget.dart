import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_overview/models/finance/finance_model.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/pages/add/local_widgets/dropdowns/dropdown_items_model.dart';
import 'package:money_overview/themes/style_templates/custom_box_decoration_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';
import 'package:money_overview/widgets/loading/loading_widget.dart';
import 'package:uuid/uuid.dart';

class SaveButtonWidget extends StatefulWidget {
  final ScrollController scrollController;
  final TextEditingController moneyAmountController;
  final TextEditingController titleController;
  final TextEditingController noticeController;
  final DropdownItemsModel dropdownItems;
  final GlobalKey<FormState> formKey;

  const SaveButtonWidget(
      {Key? key,
      required this.scrollController,
      required this.moneyAmountController,
      required this.titleController,
      required this.noticeController,
      required this.dropdownItems,
      required this.formKey})
      : super(key: key);

  @override
  _SaveButtonWidgetState createState() => _SaveButtonWidgetState();
}

class _SaveButtonWidgetState extends State<SaveButtonWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 14, right: 14, bottom: 6),
      child: SizedBox(
        width: 600,
        child: GestureDetector(
          onTap: () async {
            setState(() => isLoading = true);
            if (super.widget.formKey.currentState!.validate()) {
              FinanceModel financeModel = FinanceModel(
                  id: const Uuid().v1(),
                  title: super.widget.titleController.text,
                  comment: super.widget.noticeController.text,
                  money: double.parse(super.widget.moneyAmountController.text) / super.widget.dropdownItems.moneyCycleValue.days(),
                  currency: 'Dollar',
                  type: super.widget.dropdownItems.moneyTypeValue,
                  paymentType: super.widget.dropdownItems.moneyPaymentTypeValue,
                  category: super.widget.dropdownItems.moneyCategoryValue,
                  cycle: super.widget.dropdownItems.moneyCycleValue);
              //var finances = await Hive.openBox('finances');
              await Future.delayed(const Duration(milliseconds: 200), () => setState(() => isLoading = false));
              Hive.box<FinanceModel>('finances').put(financeModel.id, financeModel);
              Navigator.pop(context);
            } else {
              setState(() => isLoading = false);
              super
                  .widget
                  .scrollController
                  .animateTo(0, duration: const Duration(milliseconds: 100), curve: Curves.linear);
            }
          },
          child: SizedBox(
            width: 1000,
            height: 60,
            child: Container(
                decoration: CustomBoxDecorationStyle.colorfulGradient2RectangleBoxStyle,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Center(
                    child: !isLoading
                        ? Text(
                            'Save'.toUpperCase(),
                            style: CustomTextStyle.moneyTypeAmountText(context),
                          )
                        : const LoadingWidget(color: Colors.white),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
