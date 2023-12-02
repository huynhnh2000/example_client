import 'dart:convert';
import 'dart:io';
import 'package:socks5_proxy/socks_client.dart';
// Future<void> initServer() async {
//   // Create server instance
//   final proxy = SocksServer();

//   // Listen to all tcp and udp connections
//   proxy.connections.listen((connection) async {
//     // Apply default handler or create own handler to spy on connections.
//     await connection.forward();
//   }).onError(print);

//   // Bind servers
//   await proxy.bind(InternetAddress.loopbackIPv4, 1080);
// }

Future<void> main() async {
  // Create HttpClient object
  // initServer();
  final client = HttpClient();
  //checkSocksConnection();
  // Assign connection factory
  SocksTCPClient.assignToHttpClient(client, [
    ProxySettings(InternetAddress('29.54.39.221'), 41003),
  ]);

  // GET request
  final request = await client.getUrl(Uri.parse('http://dummyjson.com/products/1'));
  // Print response
  print(await utf8.decodeStream(await request.close()));

  // Close client
  client.close();
//  runApp(MyApp());
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           body: Center(
//         child: Container(
//           child: Marquee(
//             text: 'Your long text goes here. This text will automatically scroll horizontally.',
//             style: TextStyle(fontSize: 24.0),
//             scrollAxis: Axis.horizontal,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             blankSpace: 20.0,
//             velocity: 50.0,
//             pauseAfterRound: Duration(seconds: 1),
//             startPadding: 10.0,
//             accelerationDuration: Duration(seconds: 1),
//             accelerationCurve: Curves.linear,
//             decelerationDuration: Duration(milliseconds: 500),
//             decelerationCurve: Curves.easeOut,
//           ),
//         ),
//       )),
//     );
//   }
// }

// void checkSocksConnection() async {
//   try {
//     Socket socket = await Socket.connect('29.54.39.221', 41003,
//         sourceAddress: InternetAddress('29.54.39.221'), // Use your proxy IP
//         timeout: Duration(seconds: 5)); // Set a timeout

//     print('Connected through SOCKS5!');
//     socket.destroy();
//   } catch (e) {
//     print('Failed to connect through SOCKS5: $e');
//   }
// }

// import 'dart:io';

// void main() async {
//   // Replace 'example.com' and 80 with your actual server's information
//   String serverUrl = '127.0.0.1';
//   int serverPort = 8080;

//   try {
//     // Connect to the server
//     Socket socket = await Socket.connect(serverUrl, serverPort);

//     // Send data to the server
//     socket.write('Hello, server!');

//     // Listen for responses from the server
//     socket.listen(
//       (List<int> data) {
//         String response = String.fromCharCodes(data);
//         print('Received from server: $response');
//       },
//       onDone: () {
//         print('Socket closed by the server');
//         socket.destroy();
//       },
//       onError: (error) {
//         print('Error: $error');
//         socket.destroy();
//       },
//       cancelOnError: true,
//     );
//   } catch (e) {
//     print('Error: $e');
//   }
// }
