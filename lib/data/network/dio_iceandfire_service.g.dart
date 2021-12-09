// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_iceandfire_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _IceAndFireService implements IceAndFireService {
  _IceAndFireService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.anapioficeandfire.com/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<NetworkBook>>> getBooks() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<NetworkBook>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/books',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => NetworkBook.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
