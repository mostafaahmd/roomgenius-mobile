import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/entities/prompt_content.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/entities/prompt_request.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/enums/prompt_language.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/enums/prompt_preset.dart';
import 'package:roomgenius_mobile/features/design_studio/domain/services/prompt_composer.dart';

import '../../../design_studio/domain/enums/budget_level.dart';
import '../../../design_studio/domain/enums/design_mood.dart';
import '../../../design_studio/domain/enums/design_style.dart';
import '../../../design_studio/domain/enums/room_type.dart';
import '../../data/services/room_image_storage_service.dart';
import 'create_room_state.dart';

class CreateRoomCubit extends Cubit<CreateRoomState> {
  CreateRoomCubit({
    required RoomImageStorageService imageStorageService,
    required PromptComposer promptComposer,
    ImagePicker? imagePicker,
  })  : _imageStorageService = imageStorageService,
        _promptComposer = promptComposer,
        _imagePicker = imagePicker ?? ImagePicker(),
        super(const CreateRoomState());

  final RoomImageStorageService _imageStorageService;
  final PromptComposer _promptComposer;
  final ImagePicker _imagePicker;

  Future<void> pickImageFromGallery() async {
    await _pickImage(ImageSource.gallery);
  }

  Future<void> pickImageFromCamera() async {
    await _pickImage(ImageSource.camera);
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      emit(
        state.copyWith(
          status: CreateRoomStatus.pickingImage,
          errorMessage: null,
        ),
      );

      final pickedImage = await _imagePicker.pickImage(
        source: source,
        imageQuality: 92,
        maxWidth: 2400,
      );

      if (pickedImage == null) {
        emit(
          state.copyWith(
            status: CreateRoomStatus.initial,
          ),
        );
        return;
      }

      final savedImagePath = await _imageStorageService.saveRoomImage(
        File(pickedImage.path),
      );

      emit(
        state.copyWith(
          status: CreateRoomStatus.imageSaved,
          draft: state.draft.copyWith(
            imagePath: savedImagePath,
          ),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: CreateRoomStatus.failure,
          errorMessage: 'Could not select the room photo. Please try again.',
        ),
      );
    }
  }

  void selectRoomType(RoomType roomType) {
    emit(
      state.copyWith(
        status: CreateRoomStatus.updating,
        draft: state.draft.copyWith(roomType: roomType),
      ),
    );
  }

  void selectDesignStyle(DesignStyle style) {
    emit(
      state.copyWith(
        status: CreateRoomStatus.updating,
        draft: state.draft.copyWith(designStyle: style),
      ),
    );
  }

  void selectDesignMood(DesignMood mood) {
    emit(
      state.copyWith(
        status: CreateRoomStatus.updating,
        draft: state.draft.copyWith(designMood: mood),
      ),
    );
  }

  void selectBudgetLevel(BudgetLevel budgetLevel) {
    emit(
      state.copyWith(
        status: CreateRoomStatus.updating,
        draft: state.draft.copyWith(budgetLevel: budgetLevel),
      ),
    );
  }

  void updateColorPalette(String value) {
    emit(
      state.copyWith(
        status: CreateRoomStatus.updating,
        draft: state.draft.copyWith(colorPalette: value),
      ),
    );
  }

  void updateKeepItems(List<String> values) {
    emit(
      state.copyWith(
        status: CreateRoomStatus.updating,
        draft: state.draft.copyWith(keepItems: values),
      ),
    );
  }

  void updateRemoveItems(List<String> values) {
    emit(
      state.copyWith(
        status: CreateRoomStatus.updating,
        draft: state.draft.copyWith(removeItems: values),
      ),
    );
  }

  void selectPromptLanguage(PromptLanguage language) {
    emit(
      state.copyWith(
        status: CreateRoomStatus.updating,
        draft: state.draft.copyWith(promptLanguage: language),
      ),
    );
  }

  void selectPromptPreset(PromptPreset preset) {
    emit(
      state.copyWith(
        status: CreateRoomStatus.updating,
        draft: state.draft.copyWith(promptPreset: preset),
      ),
    );
  }

  void updateAddItems(List<String> values) {
    emit(
      state.copyWith(
        status: CreateRoomStatus.updating,
        draft: state.draft.copyWith(addItems: values),
      ),
    );
  }

  void updateExtraNotes(String value) {
    emit(
      state.copyWith(
        status: CreateRoomStatus.updating,
        draft: state.draft.copyWith(extraNotes: value),
      ),
    );
  }

  PromptContent buildPromptPreview() {
    final draft = state.draft;

    if (!draft.canPreviewPrompt) {
      return const PromptContent(
        positivePrompt: '',
        negativePrompt: '',
      );
    }

    return _promptComposer.compose(
      PromptRequest(
        roomType: draft.roomType!,
        designStyle: draft.designStyle!,
        designMood: draft.designMood!,
        budgetLevel: draft.budgetLevel!,
        language: draft.promptLanguage,
        preset: draft.promptPreset,
        colorPalette: _splitInput(draft.colorPalette),
        keepItems: draft.keepItems,
        removeItems: draft.removeItems,
        addItems: draft.addItems,
        extraNotes: draft.extraNotes,
      ),
    );
  }

  List<String> _splitInput(String value) {
    return value
        .split(',')
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty)
        .toList();
  }
}
