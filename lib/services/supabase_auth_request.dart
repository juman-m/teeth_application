import 'package:final_project/models/appointment_model.dart';
import 'package:final_project/models/comments_model.dart';
import 'package:final_project/models/community_model.dart';
import 'package:final_project/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFunctions {
  Future<void> getUsers() async {
    try {
      final supabase = Supabase.instance.client;
      (await supabase.from('users').select('*'));

      // print(data);
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  useradd(Map body) async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from("users").insert(body).select();
    final UserModel user = UserModel.fromJson(response[0]);
    return user;
  }

  Future<UserModel> getUser() async {
    final supabase = Supabase.instance.client;
    await Future.delayed(const Duration(seconds: 1));
    final String id = Supabase.instance.client.auth.currentUser!.id;
    final response = await supabase.from("users").select('*').eq('id', id);
    final UserModel user = UserModel.fromJson(response[0]);
    return user;
  }

  Future createAppointment(Map body) async {
    final supabase = Supabase.instance.client;
    await supabase.from('appointments').insert(body);
  }

  Future<List<AppointmentModel>> getAppointments() async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;
    final body = await supabase
        .from('appointments')
        .select()
        .eq('user_id', userId)
        .order('date', ascending: true);

    List<AppointmentModel> listOfObjects = [];

    for (var appointment in body) {
      listOfObjects.add(AppointmentModel.fromJson(appointment));
    }
    return listOfObjects;
  }

  Future editAppointment(Map body) async {
    final supabase = Supabase.instance.client;
    await supabase.from('appointments').update(body).eq('id', body['id']);
  }

  Future rescheduleAppointment(Map body) async {
    final supabase = Supabase.instance.client;
    await supabase.from('appointments').update(body).eq('id', body['id']);
  }

  Future deleteAppointment(int id) async {
    final supabase = Supabase.instance.client;
    await supabase.from('appointments').delete().eq('id', id);
  }

  Future publishParticipation(Map body) async {
    final supabase = Supabase.instance.client;
    await supabase.from('community').insert(body);
  }

  Future currentUserInfo() async {
    final supabase = Supabase.instance.client;
    await supabase
        .from('users')
        .select()
        .eq("id", supabase.auth.currentUser!.id);
  }

  Future<List<CommunityModel>> getCommuinties(String city) async {
    final supabase = Supabase.instance.client;
    final List<CommunityModel> communityObjectsList = [];
    final community =
        await supabase.from('community').select().eq("city", city.trim());
    for (var element in community) {
      communityObjectsList.add(CommunityModel.fromJson(element));
    }
    return communityObjectsList;
  }

  getMyParticipations() async {
    final supabase = Supabase.instance.client;
    final List<CommunityModel> communityObjectsList = [];
    final community = await supabase
        .from('community')
        .select()
        .eq("user_id", supabase.auth.currentUser!.id);
    for (var element in community) {
      communityObjectsList.add(CommunityModel.fromJson(element));
    }
    return communityObjectsList;
  }

  Future<List<CommunityModel>> searchForParticipation(String text) async {
    final supabase = Supabase.instance.client;
    final List<CommunityModel> communityObjectsList = [];
    final body =
        await supabase.from('community').select().ilike('content', '%$text%');

    for (var element in body) {
      communityObjectsList.add(CommunityModel.fromJson(element));
    }
    return communityObjectsList;
  }

  Stream getComments(int communityId) {
    final supabase = Supabase.instance.client;
    final commentsAsStream = supabase
        .from('comments')
        .stream(primaryKey: ['id'])
        .eq('community_id', communityId)
        .map((item) => item);
    final commentsAsStreamModel = commentsAsStream.map(
        (items) => items.map((item) => CommentModel.fromJson(item)).toList());
    return commentsAsStreamModel;
  }
}
