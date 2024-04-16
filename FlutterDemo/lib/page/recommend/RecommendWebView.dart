import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../routes/Routes.dart';

class RecommendWebView extends StatefulWidget {
  final Map arguments;

  const RecommendWebView({super.key, required this.arguments});

  @override
  State<RecommendWebView> createState() => _RecommendWebView();
}

/// 生成进度条组件，进度从0 ~ 1
_createProgressBar(double progress, BuildContext context) {
  return LinearProgressIndicator(
    backgroundColor: Colors.white70.withOpacity(0),
    value: progress == 1.0 ? 0 : progress,
    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
  );
}

class _RecommendWebView extends State<RecommendWebView> {
  String webUrl = "";
  double _progress = 0.0;
  bool isCanBack = false;
  bool isCanForward = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webUrl = widget.arguments["url"];
    print("$LOG_TAG  url:$webUrl");
  }

  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      //加载url拦截功能
      useShouldOverrideUrlLoading: true,
      //ajax请求拦截
      useShouldInterceptAjaxRequest: true,
      //资源加载回调
      useOnLoadResource: true,
      //资源加载
      allowFileAccessFromFileURLs: true,
      //多媒体控制
      mediaPlaybackRequiresUserGesture: false,
    ),

    /// android 支持HybridComposition
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true, //支持HybridComposition
      useShouldInterceptRequest: true, //请求加载链接，可以用于实现Web离线包
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InAppWebView(
        key: webViewKey,
        //初始化加载url
        initialUrlRequest: URLRequest(url: Uri.parse(webUrl)),
        //设置options
        initialOptions: options,
        onLoadStart: (InAppWebViewController controller, Uri? url) {
          setState(() {
            print("$LOG_TAG  开始加载，打印请求的url:$url");
          });
        },
        onLoadStop: (InAppWebViewController controller, Uri? url) {
          setState(() {
            print("$LOG_TAG  停止加载，打印请求url:$url");
          });
        },
        onLoadError: (InAppWebViewController controller, Uri? url, int code,
            String message) {
          //加载失败，可以通过信息进行下一步操作，更换URL内容等信息
          print("$LOG_TAG  请求失败，打印请求url:$url ,错误码: $code ,错误信息:$message");
        },
        onLoadHttpError: (InAppWebViewController controller, Uri? url,
            int statusCode, String description) {
          //可以让用户查看网络信号强弱，或是否打开网络
          print(
              "$LOG_TAG  http请求失败，打印请求url:$url ,状态码: $statusCode ,错误描述:$description");
        },
        onLoadResource:
            (InAppWebViewController controller, LoadedResource resource) {
          print("$LOG_TAG  加载资源，onLoadResource resource:$resource");
        },
        onScrollChanged: (InAppWebViewController controller, int x, int y) {
          //滑动监听
          print("$LOG_TAG  webView滑动监听，onScrollChanged: x:$x  y:$y");
        },
        onOverScrolled: (InAppWebViewController controller, int x, int y,
            bool clampedX, bool clampedY) {
          print(
              "$LOG_TAG  过量滚动监听器 onOverScrolled x:$x  y:$y clampedX：$clampedX clampedY：$clampedY");
        },
        //WebView加载完成监听
        onProgressChanged: (InAppWebViewController controller, int progress) {
          setState(() {
            //加载完成，可以通过controller对webview进行操作
            //如获取title、证书等
            // controller.getTitle();//获取标题
            // controller.getCertificate();//获取证书
            _progress = progress / 100.00;
            print("$LOG_TAG  进度条:$_progress");
            //设置进度条
            _createProgressBar(_progress, context);
          });
        },
      ),
    );
  }
}
