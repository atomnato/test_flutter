import 'package:test_flutter/data/server/test_server.dart';
import 'model/list_model.dart';
import 'model/page_model.dart';

class TestRepository {
  final TestServer _textServer;

  TestRepository(this._textServer);

  final ListModel listItems = ListModel();
  final PageModel pageItems = PageModel();

  Future<ListModel> getContent() async {
    List<dynamic> response = await _textServer.getContentFromServer();
    for (int i = 0; i < response.length; i++) {
      listItems.title.add(response[i]['title']['rendered']);
    }
    return listItems;
  }

  Future<PageModel> getPageContent(int index) async {
    String response = await _textServer.getContentPageFromServer(index);
    pageItems.text = response;
    return pageItems;
  }
}
