import 'package:final_project/models/appointment_model.dart';

abstract class TimerEvent {}

// final class CountDownEvent extends TimerEvent {
//   final AppointmentModel appointment;

//   CountDownEvent({required this.appointment});
// }
final class CountDownEvent extends TimerEvent {
  final DateTime deadline;
  CountDownEvent({required this.deadline});
}