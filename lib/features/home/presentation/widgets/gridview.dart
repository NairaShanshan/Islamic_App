import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:islamic_app/core/constants/app_images.dart';
import 'package:islamic_app/core/routes/navigations.dart';
import 'package:islamic_app/core/routes/routes.dart';
import 'package:islamic_app/features/home/presentation/widgets/grid_item.dart';


class GridviewHome extends StatelessWidget {
  const GridviewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 12,
      childAspectRatio: 1.6,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        gridItem(imageName: AppImages.reciters, name: 'Reciters'.tr(), onTap: (){}),
        gridItem(imageName: AppImages.azkar, name: 'azkar'.tr(), onTap: (){
          pushTo(context, Routes.azkar) ;
        }),
        gridItem(imageName:AppImages.namesAllah, name: 'namesAllah'.tr(), onTap: (){
          pushTo(context, Routes.asmaaAllah) ;
        }),
        gridItem(imageName: AppImages.namesProphet, name: 'namesProphet'.tr(), onTap: (){
          pushTo(context, Routes.asmaaMohamed);
        }),
        gridItem(imageName: AppImages.praying, name: 'praying'.tr(), onTap: (){}),
        gridItem(imageName:AppImages.tasbih, name: 'tasbih'.tr(), onTap: (){}),




      ],
    );
  }
}
