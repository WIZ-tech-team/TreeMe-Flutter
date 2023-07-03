import 'dart:developer';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:treeme/core/utils/image_picker/i_image_file.dart';
import 'package:treeme/core/utils/services/storage.dart';

import '../config/apis/auth_header.dart';
import '../config/apis/config_api.dart';
import '../helpers/page_loading_dialog/page_loading_dialog.dart';

class WebServiceConnections {
  WebServiceConnections(
    this._dioInstance,
    this._storage,
    this._pageLoading,
  );

  final dio.Dio _dioInstance;
  final Storage _storage;
  final IPageLoadingDialog _pageLoading;

  Future<dio.Response> getRequest({
    String? path,
    bool showLoader = false,
    bool useMyPath = false,
  }) async {
    // PageLoadingDialogStatus? loader;

    if (!kReleaseMode) {
      _dioInstance.interceptors
          .add(CurlLoggerDioInterceptor(printOnSuccess: false));
    }
    // if (showLoader) {
    //   loader = _pageLoading.showLoadingDialog();
    // }
    dio.Response response;
    try {
      response = await _dioInstance.get(
        useMyPath ? path! : '${API.baseUrl}$path',
        options: AuthHeader.getBaseOption(
          jwtToken: _storage.jwtToken,
        ),
      );
      //
      // if (showLoader) {
      //   loader?.hide();
      // }
      log('${response.data}');
      return response;
    } on dio.DioError catch (e) {
      // if (showLoader) {
      //   loader?.hide();
      // }
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<dio.Response> postRequest({
    String? path,
    Map<String, dynamic>? data,
    bool showLoader = false,
    IImageFile? file,
  }) async {
    print('heeelo');
    PageLoadingDialogStatus? loader;
    if (showLoader) {
      loader = _pageLoading.showLoadingDialog();
    }
    if (kDebugMode) {
      _dioInstance.interceptors.add(CurlLoggerDioInterceptor(
        printOnSuccess: true,
      ));
    }
    dio.Response response;
    try {
      if (file != null) {
        dio.FormData formData = dio.FormData.fromMap({
          "driving_license": await dio.MultipartFile.fromFile(
            file.path,
            filename: file.name,
          ),
        });
        data?.forEach((key, value) {
          formData.fields.add(MapEntry(key, value));
        });
        response = await _dioInstance.post(
          '${API.baseUrl}$path',
          options: AuthHeader.getBaseOption(jwtToken: _storage.jwtToken),
          data: formData,
        );
      } else {
        response = await _dioInstance.post(
          '${API.baseUrl}$path',
          options: dio.Options(),
          data: data,
        );
        print('${response.statusMessage}');
      }
      log("log:path:$path:${response.data}");
      if (showLoader) {
        loader?.hide();
      }
      return response;
    } on dio.DioException catch (e) {
      if (showLoader) {
        loader?.hide();
      }
      debugPrint(e.response?.data.toString());
      rethrow;
    }
  }

  Future<dio.Response> postPaymentRequest({
    String? path,
    Map<String, dynamic>? data,
    bool showLoader = false,
  }) async {
    PageLoadingDialogStatus? loader;
    if (showLoader) {
      loader = _pageLoading.showLoadingDialog();
    }
    if (!kReleaseMode) {
      _dioInstance.interceptors.add(CurlLoggerDioInterceptor(
        printOnSuccess: false,
      ));
    }
    dio.Response response;
    try {
      response = await _dioInstance.post(
        '${API.baseUrlStrip}$path',
        options: AuthHeader.getBaseOptionStrip(),
        data: data,
      );
      log("log:path:$path:${response.data}");
      if (showLoader) {
        loader?.hide();
      }
      return response;
    } on dio.DioError catch (e) {
      if (showLoader) {
        loader?.hide();
      }
      debugPrint(e.response?.data.toString());
      rethrow;
    }
  }
}
