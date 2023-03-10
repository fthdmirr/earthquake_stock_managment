// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/utils/input_field_generator.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';
import '../button/custom_bermuda_text_button.dart';
import '../container/white_container.dart';
import '../text/headline/headline3_text.dart';
import '../text/headline/headline4_text.dart';

class ProductSelectionCard extends StatefulWidget {
  const ProductSelectionCard({
    Key? key,
    required this.productNumber,
    required this.inventoryItem,
    required this.onIncrease,
    required this.onDicrise,
    required this.itemType,
    required this.onDelete,
    this.onChanged,
  }) : super(key: key);
  final int productNumber;
  final InventoryItem inventoryItem;
  final String itemType;
  final void Function() onIncrease;
  final void Function() onDicrise;
  final void Function()? onDelete;
  final void Function(String?)? onChanged;

  @override
  State<ProductSelectionCard> createState() => _ProductSelectionCardState();
}

class _ProductSelectionCardState extends State<ProductSelectionCard> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    _textEditingController.text = widget.productNumber.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WhiteContainer(
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.wildSand,
                child:
                    Image(image: AppImages.memoryImage(widget.inventoryItem.icon ?? 'empty_icon')),
              ),
              Headline3Text(
                text: widget.inventoryItem.name,
                color: AppColors.dark,
              ),
              Headline4Text(
                text: widget.itemType,
                color: AppColors.darkGrey,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: widget.onDelete,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.pippin,
                  child: Image(
                    image: AppImages.memoryImage('trash_icon'),
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
              Row(
                children: [
                  CustomBermudaTextButton(
                    onPressed: () {
                      widget.onDicrise();
                      _textEditingController.text =
                          (int.parse(_textEditingController.text) - 1).toString();
                    },
                    text: '-',
                  ),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: TextFormField(
                      controller: _textEditingController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      inputFormatters: getTextInputFormatters(
                        onlyNumber: true,
                        positiveIntegerFilter: true,
                        spaceFilter: true,
                        blockEmoji: true,
                      ),
                      onChanged:widget.onChanged,
                    ),
                  ),
                  CustomBermudaTextButton(
                    onPressed: () {
                      widget.onIncrease();
                      _textEditingController.text =
                          (int.parse(_textEditingController.text) + 1).toString();
                    },
                    text: '+',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
