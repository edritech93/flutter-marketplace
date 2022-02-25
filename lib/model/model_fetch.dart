class ModelFetch {
  final String url;
  final String body;
  final String response;

  const ModelFetch(
      {required this.url, required this.body, required this.response});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'body': body,
      'response': response,
    };
  }

  @override
  String toString() {
    return 'ModelFetch{url: $url, body: $body, response: $response}';
  }
}
