import 'dart:async';
import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;

import 'package:rxdart/rxdart.dart';
import 'package:universal_io/io.dart';

class ContactFormBloc {
  final BehaviorSubject<String?> _nameSubject = BehaviorSubject<String?>();
  Stream<String?> get name => _nameSubject.stream;
  Function(String?) get changeName => _nameSubject.sink.add;

  final BehaviorSubject<String?> _emailSubject = BehaviorSubject<String?>();
  Stream<String?> get email => _emailSubject.stream.transform(
          StreamTransformer<String?, String?>.fromHandlers(
              handleData: ((data, sink) {
        if (data!.contains(".com") &&
            data.contains("@") &&
            (data.contains("outlook") || data.contains("gmail"))) {
          sink.add(data);
        } else {
          sink.addError("Please Enter a Valid email!");
        }
      })));
  Function(String?) get changeEmail => _emailSubject.sink.add;

  final BehaviorSubject<String?> _messageSubject = BehaviorSubject<String?>();
  Stream<String?> get message => _messageSubject.stream;
  Function(String?) get changeMessage => _messageSubject.sink.add;

  void sendEmail() async {
    final HttpClient _client = HttpClient();
    Map<String, dynamic> body = {
      "name": _nameSubject.value,
      "from": _emailSubject.value,
      "message": _messageSubject.value,
    };

    HttpClientRequest _request = await _client.postUrl(
      Uri.parse("http://localhost:8000"),
    );

    _request.headers.contentType =
        ContentType('application', 'json', charset: 'utf-8');
    _request.write(json.encode(body));

    HttpClientResponse _response = await _request.close();
    utf8.decoder.bind(_response).transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) {},
        ));
    // var url = Uri.http('localhost:8000');
    // var response = await http.post(
    //   url,
    //   body: body,
    // );
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    _nameSubject.value = "";
    _emailSubject.value = "";
    _messageSubject.value = "";

    // Vielen Dank! Wir haben Ihre Nachricht erhalten und melden uns umgehend bei Ihnen.

    // Ein Fehler ist aufgetreten. Bitte prüfen Sie Ihre Angaben.
  }

  void dispose() {
    _nameSubject.close();
    _emailSubject.close();
    _messageSubject.close();
  }
}
