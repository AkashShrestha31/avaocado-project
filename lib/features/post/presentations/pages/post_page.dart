import 'package:avocado/core/components/app_bar_widget.dart';
import 'package:avocado/core/components/grid_layout.dart';
import 'package:avocado/core/helper_class/size_config.dart';
import 'package:avocado/core/helper_class/spacing_helper.dart';
import 'package:avocado/features/video/data/model/video_list_component.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class PostPage extends StatefulWidget {
  final VideoListComponentModel videoListComponentModel;

  const PostPage({super.key, required this.videoListComponentModel});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late final BetterPlayerController _controller;
  final key = GlobalKey();

  BetterPlayerVideoFormat getVideoType() {
    if (widget.videoListComponentModel.videoUrl.contains(".m3u8")) {
      return BetterPlayerVideoFormat.hls;
    } else if (widget.videoListComponentModel.videoUrl.contains(".mpd")) {
      return BetterPlayerVideoFormat.dash;
    } else if (widget.videoListComponentModel.videoUrl
        .contains(".ism/manifest")) {
      return BetterPlayerVideoFormat.ss;
    } else {
      return BetterPlayerVideoFormat.other;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = BetterPlayerController(
        BetterPlayerConfiguration(
            placeholderOnTop: true,
            useRootNavigator: true,
            autoPlay: true,
            playerVisibilityChangedBehavior: (visibility) {},
            controlsConfiguration: const BetterPlayerControlsConfiguration(
              enablePip: true,
              pipMenuIcon: Icons.picture_in_picture_outlined,
            ),
            // autoDispose: true,
            autoDetectFullscreenAspectRatio: true,
            autoDetectFullscreenDeviceOrientation: true,
            deviceOrientationsAfterFullScreen: [
              DeviceOrientation.portraitUp,
            ],
            aspectRatio: 16 / 9,
            allowedScreenSleep: false),
        betterPlayerDataSource: BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          widget.videoListComponentModel.videoUrl,
          videoFormat: getVideoType(),
          notificationConfiguration: BetterPlayerNotificationConfiguration(
            showNotification: true,
            title: widget.videoListComponentModel.name,
            // author: widget.authorName,
            imageUrl: widget.videoListComponentModel.imageUri,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: "Post"),
      body: Column(
        children: [
          BetterPlayer(
            key: key,
            controller: _controller,
          ),
          SizeHelper.vSpacing(vSpace: Spacing.medium),
          Expanded(
              child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 4),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal! * 4,
                              vertical: SizeConfig.blockSizeHorizontal!),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeHorizontal! * 4),
                              color: getCustomChipColor(
                                  index: widget.videoListComponentModel
                                      .customChips.value)),
                          child: Row(
                            children: [
                              Icon(
                                widget.videoListComponentModel.customChips.icon,
                                color: Colors.white,
                              ),
                              SizeHelper.hSpacing(hSpace: Spacing.medium),
                              Text(
                                widget.videoListComponentModel.customChips.text,
                                style: SizeHelper.textStyleHelper(
                                    type: Spacing.medium,
                                    fontWeight: FontWeight.bold,
                                    colors: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Text(widget.videoListComponentModel.timesAgo,
                            style: SizeHelper.textStyleHelper(
                                type: Spacing.medium,
                                fontWeight: FontWeight.bold,
                                colors: Colors.black26))
                      ],
                    ),
                    SizeHelper.vSpacing(vSpace: Spacing.medium),
                    Text(
                      widget.videoListComponentModel.name,
                      style: SizeHelper.textStyleHelper(
                          type: Spacing.xMedium,
                          fontWeight: FontWeight.bold,
                          textDecoration: TextDecoration.underline),
                    ),
                    HtmlWidget(
                      // the first parameter (`html`) is required
                      '''

<body>
    <p>2,401 views Aug 11, 2022</p>
    <p>
        <a href="https://www.youtube.com/hashtag/ntvnews">#ntvnews</a>
        <a href="https://www.youtube.com/hashtag/ntvplus">#ntvplus</a>
        <a href="https://www.youtube.com/hashtag/nepal">#nepal</a>
        <a href="https://www.youtube.com/hashtag/nabinkrishi">#nabinkrishi</a>
        <a href="https://www.youtube.com/hashtag/krishiprabidhi">#krishiprabidhi</a>
        <a href="https://www.youtube.com/hashtag/krishinepal">#krishinepal</a>
        <a href="https://www.youtube.com/hashtag/nepalkrishi">#nepalkrishi</a>
        <a href="https://www.youtube.com/hashtag/krishi">#krishi</a>
        <a href="https://www.youtube.com/hashtag/ntvkrishi">#ntvkrishi</a>
        <a href="https://www.youtube.com/hashtag/ntvplus">#ntvplus</a>
        <a href="https://www.youtube.com/hashtag/ntvnews">#ntvnews</a>
        <a href="https://www.youtube.com/hashtag/nepaltelevision">#nepaltelevision</a>
    </p>
    <p>Subscribe to our YouTube Channel and get daily program updates of NTV, NTV PLUS, and NTV NEWS.</p>
    <p>STAY TUNED FOR MORE UPCOMING PROGRAMS FROM NEPAL TELEVISION !!!</p>
    <p>Nepal Television HD को सबै Channel (NTV News, NTV Khohalpur, NTV Plus)को सम्पूर्ण कार्यक्रम Youtube मा समयमै हेर्न र कार्यक्रम बारे जानकारी प्राप्त गर्न हामीलाई Youtube मा subscribe गर्नुहोस:</p>
    <p>नेपाल टेलिभिजनको App Download गर्नुहोस साथै हामीलाई Facebook, Instagram मा Follow गर्न पनी नभुल्नु होला ।</p>
    <p>Mobile App: <a href="http://bit.ly/nepaltelevision">http://bit.ly/nepaltelevision</a></p>
    <p>Online Website: <a href="https://nepaltvonline.com/">https://nepaltvonline.com/</a></p>
    <p>Website: <a href="http://ntv.org.np/">http://ntv.org.np/</a></p>
    <p>Facebook: <a href="https://www.facebook.com/neptv2041/">https://www.facebook.com/neptv2041/</a></p>
    <p>Instagram: <a href="https://www.instagram.com/nepaltelevi...">https://www.instagram.com/nepaltelevi...</a></p>
    <p>(NTV. Digital Platform is Managed by NEW IT VENTURE CORPORATION <a href="http://www.newitventure.com">www.newitventure.com</a>)</p>
</body>


  ''',

                      // all other parameters are optional, a few notable params:

                      // specify custom styling for an element
                      // see supported inline styling below
                      customStylesBuilder: (element) {
                        if (element.classes.contains('foo')) {
                          return {'color': 'red'};
                        }

                        return null;
                      },

                      // these callbacks are called when a complicated element is loading
                      // or failed to render allowing the app to render progress indicator
                      // and fallback widget
                      onErrorBuilder: (context, element, error) =>
                          Text('$element error: $error'),
                      onLoadingBuilder: (context, element, loadingProgress) =>
                          CircularProgressIndicator(),

                      // select the render mode for HTML body
                      // by default, a simple `Column` is rendered
                      // consider using `ListView` or `SliverList` for better performance
                      renderMode: RenderMode.column,

                      // set the default styling for text
                      textStyle: TextStyle(fontSize: 14),

                      // turn on `webView` if you need IFRAME support (it's disabled by default)
                      webView: true,
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
