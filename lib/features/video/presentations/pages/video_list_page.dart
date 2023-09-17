import 'package:avocado/core/components/app_bar_widget.dart';
import 'package:avocado/core/components/grid_layout.dart';
import 'package:avocado/core/helper_class/size_config.dart';
import 'package:avocado/core/helper_class/spacing_helper.dart';
import 'package:avocado/features/video/data/model/video_list_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VideoListPage extends StatefulWidget {
  const VideoListPage({super.key});

  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  List<VideoListComponentModel> videoList = [];
  List<String> categoriesList = [
    "Politics",
    "World News",
    "Business",
    "Technology",
    "Science",
    "Health",
    "Entertainment",
    "Sports",
    "Environment",
    "Education",
    "Crime",
    "Opinion/Editorials",
  ];
  List<Widget> tabBarViewList = [];
  List<Widget> tabBarList = [];

  CustomChips getCustomChips({required int index}) {
    switch (index) {
      case 2:
        return CustomChips(
            icon: Icons.facebook, text: "Facebook", value: index);
      case 1:
        return CustomChips(icon: Icons.tiktok, text: "Tiktok", value: index);
      default:
        return CustomChips(
            icon: Icons.youtube_searched_for, text: "Youtube", value: index);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < 20; i++) {
      videoList.add(VideoListComponentModel(
          name: "NABIN KRISHI PRABIDHI || Nepal Television 2079-04-23",
          imageUri: "https://picsum.photos/200",
          timesAgo: "1 hours ago",
          videoUrl:
              "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
          customChips: getCustomChips(index: i)));
    }
    for (int i = 0; i < categoriesList.length; i++) {
      tabBarList.add(
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal! * 3,
              right: SizeConfig.blockSizeHorizontal! * 3),
          child: Tab(text: categoriesList[i]),
        ),
      );
    }
    tabBarViewList = List.generate(categoriesList.length, (index) {
      return GridWidget(
        list: videoList,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: "Video"),
      body: DefaultTabController(
          length: categoriesList.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                labelColor: Theme.of(context).colorScheme.primary,
                labelPadding:
                    EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 0.6),
                labelStyle: const TextStyle(fontWeight: FontWeight.w500),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2), // Indicator height
                  insets: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal! *
                          4), // Indicator width
                ),
                tabs: [...tabBarList],
              ),
              SizeHelper.vSpacing(vSpace: Spacing.medium),
              Expanded(
                  child: TabBarView(
                children: [...tabBarViewList],
              ))
            ],
          )),
    );
  }
}
