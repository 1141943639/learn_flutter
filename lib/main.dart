import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          switch (settings.name) {
            case '/':
              return const HomePage();
            case 'login':
              return const LoginPage();
            default:
              return const NotFound();
          }
        });
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: const Text('go to login'))
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('home'),
      ),
    );
  }
}

class NotFound extends StatefulWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  State<NotFound> createState() => _NotFoundState();
}

class _NotFoundState extends State<NotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('404 Not Found'),
      ),
      appBar: AppBar(
        title: const Text('404 Not Found'),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('login page'),
      ),
      appBar: AppBar(
        title: const Text('login page'),
      ),
    );
  }
}
