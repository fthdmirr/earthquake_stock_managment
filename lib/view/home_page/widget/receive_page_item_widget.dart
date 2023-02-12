part of '../screen/home_view.dart';

class _ReceivePageItemWidget extends StatelessWidget {
  final InventoryItem item;
  final Function()? bottomSheetButton;
  const _ReceivePageItemWidget({
    required this.item,
    required this.bottomSheetButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppBottomSheet().showBottomSheet(
          context,
          item.icon ?? 'empty_icon',
          item.quantity,
          item.name,
          bottomSheetButton),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          direction: Axis.vertical,
          spacing: 4,
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: const BoxDecoration(
                color: AppColors.systemBackground,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AppImages.memoryImage(item.icon ?? 'empty_icon'),
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Text(
              item.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                  ),
            ),
            Text(
              '${item.quantity} ',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppColors.textColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
