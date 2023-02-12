part of '../screen/home_view.dart';

class _ProductInfoCard extends StatelessWidget {
  const _ProductInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.pippin.withOpacity(0.8),
        borderRadius: BorderRadiusDirectional.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.info,
            size: 30,
            color: Colors.red,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: BodyMediumText(
              text:
                  'Ürünleri kutulara tıklayıp seçtikten sonra alttaki kamyon detay işlemine devam edin.',
              maxLines: 2,
              textAlign: TextAlign.start,
              color: AppColors.cinnamon,
            ),
          )
        ],
      ),
    );
  }
}
