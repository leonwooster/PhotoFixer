import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/scratch_removal_provider.dart';

class UploadPicker extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.photo_library),
          label: const Text('Gallery'),
          onPressed: () => ref.read(scratchRemovalProvider.notifier).pickImage(fromCamera: false),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          icon: const Icon(Icons.camera_alt),
          label: const Text('Camera'),
          onPressed: () => ref.read(scratchRemovalProvider.notifier).pickImage(fromCamera: true),
        ),
      ],
    );
  }
}
