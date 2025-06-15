import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/scratch_removal_provider.dart';

class ScratchPreview extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scratchRemovalProvider);
    return Column(
      children: [
        if (state.originalImage != null)
          Column(
            children: [
              const Text('Original'),
              Image.memory(state.originalImage!),
            ],
          ),
        if (state.processedImage != null)
          Column(
            children: [
              const SizedBox(height: 8),
              const Text('Repaired'),
              Image.memory(state.processedImage!),
              ElevatedButton.icon(
                icon: const Icon(Icons.download),
                label: const Text('Download'),
                onPressed: () => ref.read(scratchRemovalProvider.notifier).downloadImage(),
              ),
            ],
          ),
      ],
    );
  }
}
