import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/cubit/create_room_cubit.dart';
import 'package:roomgenius_mobile/features/create_room/presentation/cubit/create_room_state.dart';

class UploadRoomPhotoScreen extends StatelessWidget {
  const UploadRoomPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRoomCubit, CreateRoomState>(
      builder: (context, state) {
        final imagePath = state.draft.imagePath;
        final isLoading = state.status == CreateRoomStatus.pickingImage;

        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Upload your room photo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Choose a clear photo of the room you want to redesign.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            if (imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  File(imagePath),
                  height: 260,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            else
              Container(
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 72,
                  ),
                ),
              ),
            const SizedBox(height: 24),
            if (state.errorMessage != null) ...[
              Text(
                state.errorMessage!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
            ],
            FilledButton.icon(
              onPressed: isLoading
                  ? null
                  : () {
                      context.read<CreateRoomCubit>().pickImageFromGallery();
                    },
              icon: isLoading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.photo_library_outlined),
              label: const Text('Choose from Gallery'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: isLoading
                  ? null
                  : () {
                      context.read<CreateRoomCubit>().pickImageFromCamera();
                    },
              icon: const Icon(Icons.photo_camera_outlined),
              label: const Text('Take Photo'),
            ),
          ],
        );
      },
    );
  }
}
