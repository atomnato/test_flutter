import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'internal/dependencies/home_model.dart';
import 'package:test_flutter/domain/state/home_state.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cafe',
      theme: ThemeData(
        textTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
      ),
      routes: {
        '/': (BuildContext context) => Main(),
      },
      onGenerateRoute: (RouteSettings setting) {
        final List<String> path = setting.name.split('/');
        if (path[0] != '') return null;
        if (path[1].startsWith('newPage')) {
          String _title = path[2];
          return MaterialPageRoute(
              settings: setting,
              builder: (BuildContext context) => NewPage(someData: _title));
        }
        return null;
      },
      initialRoute: '/',
    );
  }
}

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends State<Main> {
  HomeState _homeModule;

  @override
  void initState() {
    super.initState();
    _homeModule = HomeModule.homeState();
    _homeModule.getContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Observer(
          builder: (_) {
            if (_homeModule.dataModel == null) return Container();
            return ListView.builder(
              itemCount: _homeModule.dataModel.title.length.toInt(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    getPage(index);
                  },
                  child: Container(
                    height: 50,
                    child: Text(
                        '${_homeModule.dataModel.title[index]}, ${_homeModule.dataModel.title.length}'),
                  ),
                );
              },
            );
          },
        )),
      ),
    );
  }

  getPage(index) async {
    await _homeModule.getContentPage(index);
    Navigator.pushNamed(context, '/newPage/${_homeModule.pageModel.text}');
  }
}

class NewPage extends StatelessWidget {
  final String someData;

  const NewPage({Key key, @required this.someData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 80.0),
        child: Column(
          children: [
            Text(someData),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              child: Text("return"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
