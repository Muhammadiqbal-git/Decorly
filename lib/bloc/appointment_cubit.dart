import 'package:decorly/models/appointment.dart';
import 'package:decorly/services/appointment_api.dart';
import 'package:decorly/services/date_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(AppointmentEmpty());
  CustomDateUtils data = CustomDateUtils();
  AppointmentAPI api = AppointmentAPI();

  void setInitial() async {
    int now = DateTime.now().year;
    List<DateTime> data = CustomDateUtils().getDate(now, 1);
    DataAppointment? dataAppointment = await api.getData(1, 1);
    if (dataAppointment != null) {
      emit(AppointmentFetched(
          selectedMonth: 0,
          selectedDay: 1,
          listDays: data,
          appointment: dataAppointment));
    } else {
      emit(AppointmentFetched(
          selectedMonth: 0,
          selectedDay: 1,
          listDays: data,
          appointment: null));
    }
  }

  void setMonth(int month) async {
    int now = DateTime.now().year;
    List<DateTime> data = CustomDateUtils().getDate(now, month);
    DataAppointment? dataAppointment = await api.getData(month, 1);
    if (dataAppointment != null) {
      emit(AppointmentFetched(
          selectedMonth: month,
          selectedDay: state.selectedDay,
          listDays: data,
          appointment: dataAppointment));
    } else {
      emit(AppointmentFetched(
          selectedMonth: month,
          selectedDay: state.selectedDay,
          listDays: data,
          appointment: null));
    }
  }

  void setDay(int day) async {
    DataAppointment? dataAppointment =
        await api.getData(state.selectedMonth, day);
    if (dataAppointment != null) {
      emit(AppointmentFetched(
          selectedMonth: state.selectedMonth,
          selectedDay: 1,
          listDays: state.listDays,
          appointment: dataAppointment));
    } else {
      emit(AppointmentFetched(
          selectedMonth: state.selectedMonth,
          selectedDay: 1,
          listDays: state.listDays,
          appointment: null));
    }
  }
}

class AppointmentState {
  final int selectedMonth;
  final int selectedDay;
  final List<DateTime> listDays;
  final DataAppointment? appointment;

  AppointmentState(
      {required this.selectedMonth,
      required this.selectedDay,
      required this.listDays,
      required this.appointment});
}

class AppointmentEmpty extends AppointmentState {
  AppointmentEmpty()
      : super(
            selectedMonth: 1,
            selectedDay: 1,
            listDays: [],
            appointment: null);
}

class AppointmentFetched extends AppointmentState {
  AppointmentFetched(
      {required super.selectedMonth,
      required super.selectedDay,
      required super.listDays,
      required super.appointment});
}
