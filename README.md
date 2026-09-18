# camDu Pro

Aplicativo Flutter para monitoramento de câmeras IP com suporte a RTSP/RTSPS/HTTP/HTTPS, QR Code, múltiplas câmeras e visualização em tela cheia.

## Funcionalidades

- Cadastro, edição, remoção e persistência local de câmeras.
- Reprodução de streams RTSP, RTSPS, HTTP e HTTPS com MediaKit/MPV.
- Visualização em grade 2xN ou lista.
- Tela cheia por botão ou duplo toque.
- Reconexão manual de streams indisponíveis.
- Scanner QR Code para URL direta ou JSON no formato `{"name":"Entrada","url":"rtsp://..."}`.
- Transporte RTSP configurável entre TCP e UDP.
- Aceleração de hardware configurável.
- Migração automática do formato antigo de câmeras.
- Workflow GitHub Actions para análise, testes, APK e AAB.

## Requisitos

- Flutter 3.24.3 ou superior compatível com Dart 3.
- Java 17.
- Android SDK Platform 34.
- Android SDK Build-Tools 34.
- Android SDK Platform-Tools.

## Estrutura

O projeto deve ser executado a partir da raiz do repositório. Os arquivos principais são:

```text
lib/main.dart
android/app/build.gradle
android/app/src/main/AndroidManifest.xml
android/app/src/main/kotlin/com/example/camdupro/MainActivity.kt
pubspec.yaml
```

## Configuração local

Copie `android/local.properties.example` para `android/local.properties` e ajuste os caminhos:

```properties
sdk.dir=/caminho/para/Android/Sdk
flutter.sdk=/caminho/para/flutter
```

Exemplo no Windows:

```properties
sdk.dir=C:/Users/SeuUsuario/AppData/Local/Android/Sdk
flutter.sdk=C:/src/flutter
```

O arquivo `android/local.properties` é local e não deve ser commitado.

## Executar e validar

Na raiz do projeto:

```bash
flutter doctor
flutter pub get
flutter analyze
flutter test
flutter run
```

Para gerar os pacotes de release:

```bash
flutter build apk --release
flutter build appbundle --release
```

O APK será gerado em `build/app/outputs/flutter-apk/app-release.apk` e o AAB em `build/app/outputs/bundle/release/app-release.aab`.

## Configurar uma câmera

Use o botão `+` e informe uma URL real da câmera ou NVR, por exemplo:

```text
rtsp://usuario:senha@192.168.1.100:554/stream1
```

A URL e o caminho do stream variam de acordo com o fabricante. O telefone precisa alcançar a câmera pela rede. Para redes instáveis, use TCP; em redes locais estáveis, UDP pode funcionar melhor.

## QR Code

O scanner aceita uma URL direta ou JSON:

```json
{"name":"Entrada","url":"rtsp://usuario:senha@192.168.1.10:554/stream1"}
```

## GitHub Actions

O workflow em `.github/workflows/build.yml` executa automaticamente:

1. Flutter e Java 17.
2. Android SDK 34.
3. `flutter pub get`.
4. `flutter analyze`.
5. `flutter test`.
6. Build de APK e AAB.
7. Upload dos artefatos da execução.

## Limitações conhecidas

- O build não testa uma câmera real; a câmera precisa estar acessível no dispositivo.
- Alguns equipamentos exigem uma URL RTSP específica.
- H.265/HEVC depende do suporte do dispositivo Android e do backend nativo.
- Para publicar na Google Play, configure uma chave de assinatura release própria; a assinatura debug não deve ser usada em produção.

## Licença

Consulte os avisos de terceiros em `THIRD_PARTY_NOTICES.md` antes de distribuir o aplicativo.
