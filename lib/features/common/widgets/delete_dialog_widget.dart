import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:flutter/material.dart';

class DeleteDialogWidget extends StatelessWidget {
  final VoidCallback? loadAgain;
  final Future<void> Function()? deleteCar;

  const DeleteDialogWidget({
    super.key,
    this.deleteCar,
    this.loadAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              'Удаление',
              style: AppTextStyle.semiBold24.value,
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Вы действительно хотите удалить запись?',
                style: AppTextStyle.regular15.value,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Закрыть',
                      style: AppTextStyle.regular13.value.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                      backgroundColor: MaterialStateProperty.all(AppColors.red),
                    ),
                    onPressed: () async {
                      await deleteCar?.call();
                      loadAgain?.call();
                    },
                    child: Text(
                      'Удалить',
                      style: AppTextStyle.regular13.value.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
