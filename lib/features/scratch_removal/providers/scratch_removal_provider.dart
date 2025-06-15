import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/scratch_removal_service.dart';
import 'package:image_picker/image_picker.dart';

class ScratchRemovalState {
  final Uint8List? originalImage;
  final Uint8List? processedImage;
  final bool isLoading;
  final String? error;
  ScratchRemovalState({
    this.originalImage,
    this.processedImage,
    this.isLoading = false,
    this.error,
  });
  ScratchRemovalState copyWith({
    Uint8List? originalImage,
    Uint8List? processedImage,
    bool? isLoading,
    String? error,
  }) => ScratchRemovalState(
    originalImage: originalImage ?? this.originalImage,
    processedImage: processedImage ?? this.processedImage,
    isLoading: isLoading ?? this.isLoading,
    error: error,
  );
}

class ScratchRemovalNotifier extends StateNotifier<ScratchRemovalState> {
  ScratchRemovalNotifier() : super(ScratchRemovalState());

  final _service = ScratchRemovalService();

  Future<void> pickImage({required bool fromCamera}) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final picker = ImagePicker();
      final picked = await picker.pickImage(source: fromCamera ? ImageSource.camera : ImageSource.gallery);
      if (picked != null) {
        final bytes = await picked.readAsBytes();
        state = ScratchRemovalState(originalImage: bytes);
      } else {
        state = ScratchRemovalState();
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to pick image');
    }
  }

  Future<void> removeScratches() async {
    if (state.originalImage == null) return;
    try {
      state = state.copyWith(isLoading: true, error: null);
      final result = await _service.removeScratches(state.originalImage!);
      state = state.copyWith(processedImage: result, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to process image');
    }
  }

  Future<void> downloadImage() async {
    // TODO: Implement download logic (platform-specific)
  }
}

final scratchRemovalProvider = StateNotifierProvider<ScratchRemovalNotifier, ScratchRemovalState>((ref) => ScratchRemovalNotifier());
