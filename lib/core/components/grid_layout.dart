import 'package:avocado/core/helper_class/size_config.dart';
import 'package:avocado/core/helper_class/spacing_helper.dart';
import 'package:avocado/features/video/data/model/video_list_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GridWidget extends StatefulWidget {
  final List<VideoListComponentModel> list;
  final double? customCellHeight;

  GridWidget({required this.list, this.customCellHeight});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  var _crossAxisSpacing,
      _screenWidth,
      _crossAxisCount,
      _width,
      cellHeight,
      _aspectRatio;

  @override
  void initState() {
    super.initState();
    _crossAxisSpacing = widget.list.length;
    _screenWidth = SizeConfig.screenWidth;
    _crossAxisCount = 2;
    _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    cellHeight = getScreenHeight(portraitHeight: 0.33, landscapeHeight: 0.48);
    _aspectRatio = _width / cellHeight;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: widget.list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount,
              childAspectRatio: _aspectRatio,
              crossAxisSpacing: 7.0,
              mainAxisSpacing: 7.0),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                GoRouter.of(context).push("/post", extra: widget.list[index]);
              },
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal! * 3,
                      vertical: SizeConfig.blockSizeHorizontal! * 3),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal! * 4),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.list[index].name,
                        style: SizeHelper.textStyleHelper(
                            type: Spacing.medium,
                            fontWeight: FontWeight.bold,
                            textDecoration: TextDecoration.underline),
                      ),
                      SizeHelper.vSpacing(vSpace: Spacing.medium),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal! * 3,
                                vertical: SizeConfig.blockSizeHorizontal!),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.blockSizeHorizontal! * 4),
                                color: getCustomChipColor(
                                    index:
                                        widget.list[index].customChips.value)),
                            child: Row(
                              children: [
                                Icon(
                                  widget.list[index].customChips.icon,
                                  color: Colors.white,
                                  size: SizeConfig.blockSizeHorizontal! * 4,
                                ),
                                SizeHelper.hSpacing(hSpace: Spacing.medium),
                                Text(
                                  widget.list[index].customChips.text,
                                  style: SizeHelper.textStyleHelper(
                                      type: Spacing.medium,
                                      fontWeight: FontWeight.bold,
                                      colors: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Text(widget.list[index].timesAgo,
                              style: SizeHelper.textStyleHelper(
                                type: Spacing.xSmall,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                      SizeHelper.vSpacing(vSpace: Spacing.medium),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // Image.network(widget.list[index].imageUri,fit: BoxFit.contain),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: SizeConfig.screenHeight! * 0.17,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    NetworkImage(widget.list[index].imageUri),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.play_circle,
                            size: SizeConfig.blockSizeHorizontal! * 15,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  )),
            );
          }),
    );
  }
}

Color? getCustomChipColor({required int index}) {
  switch (index) {
    case 2:
      return Colors.red;
    case 1:
      return Colors.green;
    default:
      return Colors.blue;
  }
}
