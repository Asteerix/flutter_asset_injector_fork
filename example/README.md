# flutter_asset_manager_example

A simple example app to demonstrate how `flutter_asset_manager` magically manages your `pubspec.yaml` assets!

## How to test the generator

1. Navigate to the `example` directory in your terminal:
   ```bash
   cd example
   ```

2. Look at our nested asset folder structure:
   - `assets/images/logo.png`
   - `assets/icons/home_icon.png`
   - `assets/mock_data/config.json`

3. Currently, these nested folders might not all be declared in `example/pubspec.yaml`.

4. Run the generator script:
   ```bash
   dart run flutter_asset_manager:generate
   ```

5. Watch the magic happen! Open `pubspec.yaml` and you'll see all populated asset folders injected seamlessly into your `flutter: assets:` section without removing any existing comments or styling!
