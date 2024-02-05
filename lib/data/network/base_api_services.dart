


abstract class BaseApiServices {

  Future<dynamic> getApi(String url);

  Future<List<dynamic>> getListApi(String url);

  Future<dynamic> postApi(dynamic data, String url);

  Future<dynamic> patchApi(dynamic data, String url);

  Future<dynamic> deleteApi(String url);

}