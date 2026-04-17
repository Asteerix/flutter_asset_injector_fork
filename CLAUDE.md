# flutter_asset_injector_fork

Fork maintenu de [`flutter_asset_injector`](https://github.com/androdevsatyam/flutter_asset_injector). Package Flutter / CLI Dart qui scanne récursivement le dossier `assets/` et injecte automatiquement chaque sous-répertoire dans `pubspec.yaml` en préservant le formatage YAML d'origine (via `yaml_edit`). Existe uniquement pour rétablir la compat avec les SDK Dart/Flutter récents que l'upstream n'a pas mis à jour.

## Stack

- **Dart SDK** ^3.7.0
- **Flutter** >=1.17.0
- **Dependencies** :
  - `collection` ^1.19.1
  - `path` ^1.9.1
  - `yaml` ^3.1.3
  - `yaml_edit` ^2.2.4 (édition AST YAML préservant le formatage)
- **Dev** : `flutter_test` (sdk), `flutter_lints` ^5.0.0
- **Package manager** : flutter / pub
- **Diffusion** : pub.dev (`dart pub publish`) — mais ce fork n'est pas publié sous le même nom

## Commands

```bash
flutter pub get
flutter test                                                # tests unitaires
flutter analyze                                             # analyzer Dart
dart format lib test bin

# Génération du package (pas de codegen ici)
# CLI exposé par le package : exécuté depuis un projet consommateur
dart run flutter_asset_injector:generate
dart run flutter_asset_injector:generate my_custom_folder   # nom de dossier alternatif

# Publication (vérification avant publish)
dart pub publish --dry-run

# Demo dans le sous-projet `example/`
cd example && flutter pub get && dart run flutter_asset_injector:generate
```

## Project layout

- `lib/flutter_asset_injector.dart` — API publique du package (un seul fichier, fin)
- `bin/generate.dart` — entry point CLI (`dart run flutter_asset_injector:generate`)
- `test/` — tests unitaires
- `example/` — projet Flutter exemple consommant le package
- `assets/` — assets utilisés par l'example
- `pubspec.yaml` — manifest pub
- `analysis_options.yaml` — règles linter (`flutter_lints` + `public_member_api_docs`)
- `CHANGELOG.md`

## Conventions

- API publique exposée via `lib/flutter_asset_injector.dart` (pas de sous-arbre `lib/src/` actuellement)
- Documenter chaque API publique (`/// ...`) — règle `public_member_api_docs` activée
- Préserver le formatage utilisateur de `pubspec.yaml` : **toute** édition passe par `yaml_edit` (pas de regex, pas de string replace)
- Tests pour : happy path, dossier vide, dossier imbriqué, pubspec mal formé, présence/absence de la section `flutter:`
- Versioning sémantique strict dans `pubspec.yaml` (`version: 1.0.4` actuellement)
- `pubspec.lock` **non commité** (recommandation Dart pour les libs)
- Conventional commits : `type(scope): description`

## Notes

- C'est un **fork** : `homepage`, `repository`, `issue_tracker` pointent encore vers l'upstream `androdevsatyam/flutter_asset_injector` — à corriger si publication sous nouveau nom envisagée.
- Le fork peut être archivé si l'upstream redevient actif (mention explicite dans le README).
- Pas de codegen (pas de `build_runner`) — toute la logique est runtime.
- `analysis_options.yaml` exige `public_member_api_docs` → CI doit échouer si une nouvelle API publique manque sa doc.
