import 'package:equatable/equatable.dart';

 abstract class FlutterEvent extends Equatable{
  @override
  List<Object?> get props =>[];

}
class PostFetchEvent extends FlutterEvent{int value;
PostFetchEvent({required this.value});}

class ViewEvent extends FlutterEvent{}
class ScaffoldEvent extends FlutterEvent{}
class ApiDataSendEvent extends FlutterEvent{String email, passwd;

ApiDataSendEvent({required this.email,required this.passwd});
}
class userLoginEvent extends FlutterEvent{
  Map<String ,dynamic> model={};
  
  userLoginEvent({ required this.model});
}