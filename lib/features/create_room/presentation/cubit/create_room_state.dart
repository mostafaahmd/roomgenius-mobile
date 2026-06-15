import 'package:equatable/equatable.dart';

import '../../domain/entities/create_room_draft.dart';

enum CreateRoomStatus {
  initial,
  pickingImage,
  imageSaved,
  updating,
  ready,
  failure,
}

class CreateRoomState extends Equatable {
  const CreateRoomState({
    this.status = CreateRoomStatus.initial,
    this.draft = const CreateRoomDraft(),
    this.errorMessage,
  });

  final CreateRoomStatus status;
  final CreateRoomDraft draft;
  final String? errorMessage;

  CreateRoomState copyWith({
    CreateRoomStatus? status,
    CreateRoomDraft? draft,
    String? errorMessage,
  }) {
    return CreateRoomState(
      status: status ?? this.status,
      draft: draft ?? this.draft,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        draft,
        errorMessage,
      ];
}