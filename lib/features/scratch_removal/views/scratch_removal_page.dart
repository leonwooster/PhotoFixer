import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/scratch_removal_provider.dart';
import '../widgets/upload_picker.dart';
import '../widgets/scratch_preview.dart';
import '../widgets/remove_button.dart';

class ScratchRemovalPage extends ConsumerWidget {
  const ScratchRemovalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scratchRemovalProvider);
    final notifier = ref.read(scratchRemovalProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Scratch & Blemish Removal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            UploadPicker(),
            const SizedBox(height: 16),
            if (state.originalImage != null)
              ScratchPreview(),
            const SizedBox(height: 16),
            if (state.originalImage != null)
              RemoveButton(),
            if (state.error != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(state.error!, style: const TextStyle(color: Colors.red)),
              ),
          ],
        ),
      ),
    );
  }
}
