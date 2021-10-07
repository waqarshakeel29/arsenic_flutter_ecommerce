
import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String uid;
  final String userName;
  const AppUser({
    required this.uid,
    required this.userName,
  });
  @override
  List<Object?> get props => [userName];
}
