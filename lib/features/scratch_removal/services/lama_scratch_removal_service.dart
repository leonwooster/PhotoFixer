import 'dart:typed_data';
import 'dart:io';
import 'package:pytorch_mobile/model.dart';
import 'package:pytorch_mobile/pytorch_mobile.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

class LamaScratchRemovalService {
  Model? _model;
  static const _modelAssetPath = 'models/lama.pt';
  bool _isLoaded = false;

  Future<void> loadModel() async {
    if (_isLoaded) return;
    _model = await PyTorchMobile.loadModel(_modelAssetPath);
    _isLoaded = true;
  }

  /// Accepts an image as bytes, saves it temporarily, runs inference, and returns the output as bytes.
  Future<Uint8List> removeScratches(Uint8List imageBytes) async {
    await loadModel();
    // Save imageBytes to a temp file (required by pytorch_mobile)
    final tempDir = await getTemporaryDirectory();
    final inputPath = '${tempDir.path}/input.jpg';
    final inputFile = File(inputPath);
    await inputFile.writeAsBytes(imageBytes);

    // Run inference (assuming the model expects an image path and returns a tensor or image file path)
    // Adjust mean/std as needed for your model's training
    final outputPath = await _model!.getImagePrediction(
      inputPath,
      imageMean: [0.485, 0.456, 0.406],
      imageStd: [0.229, 0.224, 0.225],
      outputPath: '${tempDir.path}/output.jpg',
    );

    final outputFile = File(outputPath);
    final outputBytes = await outputFile.readAsBytes();
    return outputBytes;
  }
}
