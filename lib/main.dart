import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

void main() {
  // 1. Garante que os componentes nativos do Android estejam prontos
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Inicializa o motor C/C++ do MediaKit para processar vídeos
  MediaKit.ensureInitialized();

  runApp(const CamDuProApp());
}

class CamDuProApp extends StatelessWidget {
  const CamDuProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'camDu Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Colors.deepOrange,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controlador de áudio/vídeo em memória
  late final Player player = Player();
  // Controlador visual da tela
  late final VideoController controller = VideoController(player);

  @override
  void dispose() {
    // Libera os recursos do processador ao fechar o app
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('camDu Pro'),
        centerTitle: true,
      ),
      body: Center(
        child: Video(
          controller: controller,
        ),
      ),
    );
  }
}
