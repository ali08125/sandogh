import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sandogh/constants/info_list.dart';
import 'package:sandogh/data/repo/users_repository.dart';
import 'package:sandogh/data/user.dart';


part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final IUsersRepository usersRepository;
  UsersBloc(this.usersRepository) : super(UsersInitial()) {
    on<UsersEvent>((event, emit) async {
      if (event is UsersStarted) {
        try {
          emit(UsersLoading());
          //final users1 = await usersRepository.getUsers();
          final List<UserEntity> users1 = [
            UserEntity(1, '1234', 'ali', 'ali', 12),
            UserEntity(1, '1234', 'hosein', 'ali', 12),
            UserEntity(1, '1234', 'mohamad', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
            UserEntity(1, '1234', 'naghi', 'ali', 12),
          ];
          users = users1;
          emit(UsersSuccess(users1));
        } catch (e) {
          emit(UsersError());
        }
      } else if (event is UserSearchClicked) {
        if (state is UsersSuccess) {
          if (event.search == '') {
            emit(UsersSuccess(users!));
          }
          final List<UserEntity> searched = [];

          for (var element in users!) {
            if (element.name.contains(event.search)) {
              searched.add(element);
            }
          }
          emit(UsersSuccess(searched));
        }
      }
    });
  }
}
