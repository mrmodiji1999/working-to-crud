import 'package:equatable/equatable.dart';
import 'package:webkul1/model/post_data_model.dart';
import 'package:webkul1/repo/post_status.dart';

class FlutterState extends Equatable{
  String message;
  bool isScaffold;
  bool IsviewList;
  String name ;
  String passwd;
  PostStatus postStatus;
  List<Welcome> postlist ;
  FlutterState({this.name ='empty',this.passwd ='empty' , this.isScaffold=false,this.IsviewList=false,this.message='',this.postStatus=PostStatus.Loding,this.postlist=const <Welcome>[]});
  FlutterState copyWith({ String? message, bool? isScaffold,
  PostStatus? postStatus,bool? IsviewList,  String? name ,
  String? passwd,
  List<Welcome>? postlist }){
 print('[][][][][][]]$name $passwd');


    return FlutterState(
      name: name??this.name,
passwd: passwd?? this.passwd,
      isScaffold: isScaffold??this.isScaffold,
      IsviewList: IsviewList ?? this.IsviewList,
      postStatus: postStatus ??this.postStatus,
      message: message??this.message,
      postlist: postlist ?? this.postlist,

    );
  }
  @override

  List<Object?> get props =>[IsviewList,isScaffold,name,passwd,postStatus,message,postlist];
}