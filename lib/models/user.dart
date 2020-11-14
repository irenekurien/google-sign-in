import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  const User({
    @required this.email,
    @required this.id,
    @required this.name,
  })  : assert(email != null),
        assert(id != null);

  final String email;

  final String id;

  final String name;

  // Empty user which represents an unauthenticated user.
  static const empty = User(email: '', id: '', name: null);

  @override
  List<Object> get props => [email, id, name];
}
