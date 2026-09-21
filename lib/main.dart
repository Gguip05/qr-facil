import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Fácil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006C67),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const GeradorQrPage(),
    );
  }
}

class GeradorQrPage extends StatefulWidget {
  const GeradorQrPage({super.key});

  @override
  State<GeradorQrPage> createState() => _GeradorQrPageState();
}

class _GeradorQrPageState extends State<GeradorQrPage> {
  var _texto = '';

  @override
  Widget build(BuildContext context) {
    final possuiConteudo = _texto.trim().isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('QR Fácil'), centerTitle: true),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3FAF7), Color(0xFFF4F1FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.qr_code_2,
                        size: 52,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Transforme seu texto em QR Code',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 22),
                      TextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(120),
                        ],
                        onChanged: (valor) => setState(() => _texto = valor),
                        decoration: InputDecoration(
                          labelText: 'Texto ou link',
                          hintText: 'Ex.: https://flutter.dev',
                          border: const OutlineInputBorder(),
                          suffixText: '${_texto.length}/120',
                        ),
                      ),
                      const SizedBox(height: 28),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: possuiConteudo
                            ? Container(
                                key: const ValueKey('qr'),
                                padding: const EdgeInsets.all(16),
                                color: Colors.white,
                                child: QrImageView(
                                  data: _texto.trim(),
                                  version: QrVersions.auto,
                                  size: 230,
                                  semanticsLabel: 'QR Code gerado a partir do texto digitado',
                                ),
                              )
                            : const Padding(
                                key: ValueKey('orientacao'),
                                padding: EdgeInsets.symmetric(vertical: 72),
                                child: Text(
                                  'Digite algo para gerar seu QR Code',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
