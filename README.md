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

## Estrutura do repositório

| Caminho | Conteúdo |
| --- | --- |
| `lib/` | Código-fonte Dart do aplicativo |
| `test/` | Testes automatizados |
| `docs/plano-gcs.md` | [Plano de Gerenciamento de Configuração (PGC)](docs/plano-gcs.md) |
| `.github/workflows/` | Pipeline de CI (`flutter analyze` e `flutter test`) |
| `.github/` | CODEOWNERS, template de Pull Request e templates de Issue |
| `pubspec.yaml` / `pubspec.lock` | Dependências e versões travadas |

## Como contribuir

A `main` é protegida e não aceita push direto. Toda mudança segue o [PGC](docs/plano-gcs.md):

1. Crie uma branch `feature/<descricao-curta>` a partir da `main`.
2. Faça commits no padrão Conventional Commits (`feat:`, `fix:`, `docs:`...).
3. Abra um Pull Request; o CI precisa passar e o par de revisão precisa aprovar.
4. O merge é feito por squash.

Environments: `staging` e `production` (este exige aprovação de @Gguip05).

## Autor

Guilherme Peiter
