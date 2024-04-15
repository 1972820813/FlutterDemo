import 'Http_request.dart';

class HomeRequest {
  Future<List> getMovieTopList(int start, int count) async {
    // 1 拼接url
    final url =
        "https://douban.uieee.com/v2/movie/top250?start=$start&count=$count";
    print("发送请求$url  ${StackTrace.current}");
    // 2 发送请求
    final result = await Http_request.request(url, params: {"": ""});

    // 转成模型
    List movies = [];
    final subjects = result["subjects"];
    print("$subjects  ${StackTrace.current}");
    // 这里遍历 subjects 进行json解析以及将数据 bean添加到数组并返回

    // 返回数据
    return movies;
  }
}
