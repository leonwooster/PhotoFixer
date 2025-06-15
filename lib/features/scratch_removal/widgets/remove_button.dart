import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/scratch_removal_provider.dart';

class RemoveButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scratchRemovalProvider);
    return ElevatedButton(
      child: state.isLoading
          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
          : const Text('Remove Scratches'),
      onPressed: state.isLoading || state.originalImage == null
          ? null
          : () => ref.read(scratchRemovalProvider.notifier).removeScratches(),
    );
  }
}
