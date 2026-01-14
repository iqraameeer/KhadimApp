
import 'status.dart';

class ApiResponse<T> {

  Status? status ;
  T? response ;
  String? message ;

  ApiResponse(this.status , this.response, this.message);

  ApiResponse.initial() : status = Status.INITIAL ;

  ApiResponse.loading() : status = Status.LOADING ;

  ApiResponse.completed(this.response, this.message) : status = Status.COMPLETED ;

  ApiResponse.error(this.message) : status = Status.ERROR ;


  @override
  String toString(){
    return "Status : $status \n Message : $message \n Data: $response" ;
  }


}