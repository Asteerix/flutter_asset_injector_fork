import 'package:yaml_edit/yaml_edit.dart';
import 'dart:io';

void main() {
  final yaml = '''name: example
description: "A new Flutter project."
publish_to: 'none' 
version: 1.0.0+1
environment:
  sdk: ^3.7.0
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  flutter_asset_manager:
    path: ..

# The following section is specific to Flutter packages.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/to/resolution-aware-images
''';

  final yamlEditor = YamlEditor(yaml);
  try {
    yamlEditor.update(['flutter', 'assets'], ['a']);
    print('UPDATE SUCCESS');
    print(yamlEditor.toString());
  } catch (e) {
    print('UPDATE FAILED: \$e');
  }
}
