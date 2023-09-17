import 'package:avocado/core/components/app_bar_widget.dart';
import 'package:avocado/core/helper_class/size_config.dart';
import 'package:avocado/core/helper_class/spacing_helper.dart';
import 'package:avocado/features/api_post/data/model/post_model.dart';
import 'package:avocado/features/api_post/presentations/bloc/post_bloc.dart';
import 'package:avocado/features/api_post/presentations/bloc/post_event.dart';
import 'package:avocado/features/api_post/presentations/bloc/post_state.dart';
import 'package:avocado/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiPostPage extends StatefulWidget {
  const ApiPostPage({super.key});

  @override
  State<ApiPostPage> createState() => _ApiPostPageState();
}

class _ApiPostPageState extends State<ApiPostPage> {
  final PostBloc _postBloc = PostBloc(getPostScreen: sl());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postBloc.add(GetPostData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: "API Get"),
      body: BlocProvider(
        create: (_) => _postBloc,
        child: BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              print("The state is $state");
              if (state is PostEmpty) {
                return Container();
              } else if (state is PostLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PostLoaded) {
                List<Post> post = state.postModel.post;
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizeHelper.vSpacing(vSpace: Spacing.small);
                  },
                  itemCount: post.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding:
                            EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Id: ${post[index].id}",
                              style: SizeHelper.textStyleHelper(
                                  type: Spacing.xMedium,
                                  fontWeight: FontWeight.bold,
                                  colors: Colors.white),
                            ),
                            Text(
                              "Userid: ${post[index].userId}",
                              style: SizeHelper.textStyleHelper(
                                  type: Spacing.xMedium, colors: Colors.white),
                            ),
                            Text(
                              "Title: ${post[index].title}",
                              style: SizeHelper.textStyleHelper(
                                  type: Spacing.xMedium, colors: Colors.white),
                            ),
                            Text(
                              "Body: ${post[index].body}",
                              style: SizeHelper.textStyleHelper(
                                  type: Spacing.medium, colors: Colors.white),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state is Error) {
                return const Text("Something Went Wrong !!!");
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
