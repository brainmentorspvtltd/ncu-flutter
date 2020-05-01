import 'package:http_interceptor/http_interceptor.dart';

class TokenInterceptor implements InterceptorContract {
  String tokenId;
  TokenInterceptor(tokenId) {
    this.tokenId = tokenId;
  }
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    // TODO: implement interceptRequest
    data.params['tokenId'] = tokenId;
    data.headers['AUTH-TOKEN'] = tokenId;
    print(".......Intercetor Called......");
    print(data);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    // TODO: implement interceptResponse
    return data;
  }
}
