# QR Fácil

Aplicativo Flutter que transforma textos e links em QR Codes. O usuário digita o conteúdo, acompanha o limite de 120 caracteres e visualiza o código gerado automaticamente.

## Tecnologias

- Flutter e Dart
- [qr_flutter](https://pub.dev/packages/qr_flutter) 4.1.0
- Material Design 3

## Como executar

1. Instale o [Flutter SDK](https://docs.flutter.dev/get-started/install).
2. No diretório do projeto, execute:

```bash
flutter pub get
flutter run
```

## Validação

```bash
flutter analyze
flutter test
```

## Funcionalidades

- Geração de QR Code para texto ou URL.
- Atualização automática do QR Code durante a digitação.
- Limite e contador de 120 caracteres.
- Mensagem de orientação enquanto não há conteúdo.

## Autor

Guilherme Peiter
