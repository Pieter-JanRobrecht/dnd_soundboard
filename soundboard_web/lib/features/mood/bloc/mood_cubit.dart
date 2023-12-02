import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mood_state.dart';

class MoodCubit extends Cubit<MoodState> {
  MoodCubit() : super(MoodInitial());
}
