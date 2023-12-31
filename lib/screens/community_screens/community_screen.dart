import 'package:final_project/blocs/community_bloc/community_bloc.dart';
import 'package:final_project/blocs/community_bloc/community_event.dart';
import 'package:final_project/blocs/community_bloc/community_state.dart';
import 'package:final_project/screens/comment_screen/comment_screen.dart';
import 'package:final_project/screens/community_screens/widgets/community_card.dart';
import 'package:final_project/screens/community_screens/widgets/screen_app_bar.dart';
import 'package:final_project/screens/community_screens/widgets/top_row.dart';
import 'package:final_project/screens/create_participation_screen/create_participation_screen.dart';
import 'package:final_project/screens/my_appointment_screen/widgets/fab.dart';
import 'package:final_project/screens/my_participation_screen/my_participation_screen.dart';
import 'package:final_project/services/supabase_auth_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.read<CommunityBloc>().add(GetCommunitiesEvent());
    return Scaffold(
      floatingActionButton: FloatinCustomm(
        imageUrl: "assets/Vector.png",
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateParticipationScreen()));
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ScreenAppBar(),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: () {
                  SupabaseFunctions().searchForParticipation('مستشفى');
                },
                child: const Text('TEST')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TopRow(
                      controller: controller,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MyParticipationsScreen()));
                      }),
                  const SizedBox(height: 24),
                  BlocBuilder<CommunityBloc, CommunityState>(
                    builder: (context, state) {
                      if (state is EmptyCommunitiesState) {
                        return const Text(
                          'لا يوجد مشاركات حاليا',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        );
                      } else if (state is GetCommunitiesState) {
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                          child: ListView.separated(
                            padding: const EdgeInsets.only(bottom: 430),
                            shrinkWrap: true,
                            itemCount: state.communityObjectsList.length,
                            itemBuilder: (context, i) {
                              return CommunityCard(
                                name: state
                                    .communityObjectsList[i].participantName!,
                                time: state.communityObjectsList[i].time!
                                    .format(context),
                                content: state.communityObjectsList[i].content!,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CommentScreen(
                                              community: state
                                                  .communityObjectsList[i])));
                                },
                              );
                            },
                            separatorBuilder: (context, i) {
                              return const SizedBox(height: 16);
                            },
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
