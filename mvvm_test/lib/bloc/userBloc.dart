import 'package:mvvm_test/model/MUser.dart';
import 'package:bloc/bloc.dart';

class UserBloc extends Bloc<int, MUser>{
  @override
  MUser get initialState => UninitializedUser();

  @override
  Stream<MUser> mapEventToState(int event) async*{
    try {
      MUser user = await MUser.getUserFromAPI(event);
      yield user;
    } catch (_) {
    }
  }
}