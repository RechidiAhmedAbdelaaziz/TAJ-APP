part of '../home_screen.dart';

class _DrawerHeder extends StatelessWidget {
  const _DrawerHeder();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Assets.images.sideCover.image(
          fit: BoxFit.cover,
          width: double.infinity,
          height: 236.h,
        ),

        PositionedDirectional(
          top: 0,
          start: 0,
          end: 0,
          bottom: 0,
          child: Container(
            color: Color(0xffF2FFFC).withValues(alpha: 0.6),
          ),
        ),

        PositionedDirectional(
          bottom: 25.h,
          start: 35.w,
          child: Column(
            children: [
              Container(
                width: 105.r,
                height: 105.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.greyDark,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Assets.images.userPic.image(
                      width: 95.r,
                      height: 95.r,
                    ),

                    PositionedDirectional(
                      bottom: 0,
                      end: 5.w,
                      child: InkWell(
                        onTap:
                            () => context.to(
                              ProfileNavigator.editProfile(),
                            ),
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: 13.r,
                          child: Icon(
                            Icons.edit,
                            color: AppColors.black,
                            size: 14.r,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              heightSpace(4),
              Text(
                'Rechidi Ahmed',
                style: AppTextStyles.normal.copyWith(
                  color: AppColors.black,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
