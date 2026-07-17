import 'package:equatable/equatable.dart';

import '../../domain/entities/room_plan.dart';

enum RoomPlansStatus {
  initial,
  loading,
  loaded,
  empty,
  failure,
}

class RoomPlansState extends Equatable {
  const RoomPlansState({
    this.status = RoomPlansStatus.initial,
    this.plans = const [],
    this.selectedPlan,
    this.isSaving = false,
    this.errorMessage,
  });

  final RoomPlansStatus status;
  final List<RoomPlan> plans;
  final RoomPlan? selectedPlan;
  final bool isSaving;
  final String? errorMessage;

  bool get hasPlans => plans.isNotEmpty;

  RoomPlansState copyWith({
    RoomPlansStatus? status,
    List<RoomPlan>? plans,
    RoomPlan? selectedPlan,
    bool? isSaving,
    String? errorMessage,
    bool clearSelectedPlan = false,
    bool clearError = false,
  }) {
    return RoomPlansState(
      status: status ?? this.status,
      plans: plans ?? this.plans,
      selectedPlan: clearSelectedPlan ? null : (selectedPlan ?? this.selectedPlan),
      isSaving: isSaving ?? this.isSaving,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        status,
        plans,
        selectedPlan,
        isSaving,
        errorMessage,
      ];
}