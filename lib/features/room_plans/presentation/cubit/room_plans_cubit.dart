import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/room_plan.dart';
import '../../domain/repositories/room_plans_repository.dart';
import 'room_plans_state.dart';

class RoomPlansCubit extends Cubit<RoomPlansState> {
  RoomPlansCubit(this._repository) : super(const RoomPlansState());

  final RoomPlansRepository _repository;

  Future<void> loadRoomPlans() async {
    emit(
      state.copyWith(
        status: RoomPlansStatus.loading,
        clearError: true,
      ),
    );

    final result = await _repository.getRoomPlans();

    result.when(
      success: (plans) {
        emit(
          state.copyWith(
            status:
                plans.isEmpty ? RoomPlansStatus.empty : RoomPlansStatus.loaded,
            plans: plans,
            clearError: true,
          ),
        );
      },
      error: (failure) {
        emit(
          state.copyWith(
            status: RoomPlansStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  Future<void> loadRoomPlanById(String id) async {
    emit(
      state.copyWith(
        status: RoomPlansStatus.loading,
        clearSelectedPlan: true,
        clearError: true,
      ),
    );

    final result = await _repository.getRoomPlanById(id);

    result.when(
      success: (plan) {
        if (plan == null) {
          emit(
            state.copyWith(
              status: RoomPlansStatus.failure,
              errorMessage: 'Room plan was not found.',
              clearSelectedPlan: true,
            ),
          );
          return;
        }

        emit(
          state.copyWith(
            status: RoomPlansStatus.loaded,
            selectedPlan: plan,
            clearError: true,
          ),
        );
      },
      error: (failure) {
        emit(
          state.copyWith(
            status: RoomPlansStatus.failure,
            errorMessage: failure.message,
            clearSelectedPlan: true,
          ),
        );
      },
    );
  }

  Future<bool> createRoomPlan(RoomPlan plan) async {
    emit(
      state.copyWith(
        isSaving: true,
        clearError: true,
      ),
    );

    final result = await _repository.createRoomPlan(plan);

    return result.when(
      success: (_) {
        final updatedPlans = [plan, ...state.plans];

        emit(
          state.copyWith(
            status: RoomPlansStatus.loaded,
            plans: updatedPlans,
            selectedPlan: plan,
            isSaving: false,
            clearError: true,
          ),
        );

        return true;
      },
      error: (failure) {
        emit(
          state.copyWith(
            isSaving: false,
            errorMessage: failure.message,
          ),
        );

        return false;
      },
    );
  }

  Future<bool> updateRoomPlan(RoomPlan plan) async {
    emit(
      state.copyWith(
        isSaving: true,
        clearError: true,
      ),
    );

    final result = await _repository.updateRoomPlan(plan);

    return result.when(
      success: (_) {
        final updatedPlans = state.plans.map((currentPlan) {
          if (currentPlan.id == plan.id) {
            return plan;
          }

          return currentPlan;
        }).toList();

        emit(
          state.copyWith(
            status: updatedPlans.isEmpty
                ? RoomPlansStatus.empty
                : RoomPlansStatus.loaded,
            plans: updatedPlans,
            selectedPlan: plan,
            isSaving: false,
            clearError: true,
          ),
        );

        return true;
      },
      error: (failure) {
        emit(
          state.copyWith(
            isSaving: false,
            errorMessage: failure.message,
          ),
        );

        return false;
      },
    );
  }

  Future<bool> deleteRoomPlan(String id) async {
    emit(
      state.copyWith(
        isSaving: true,
        clearError: true,
      ),
    );

    final result = await _repository.deleteRoomPlan(id);

    return result.when(
      success: (_) {
        final updatedPlans =
            state.plans.where((plan) => plan.id != id).toList();

        final isSelectedPlanDeleted = state.selectedPlan?.id == id;

        emit(
          state.copyWith(
            status: updatedPlans.isEmpty
                ? RoomPlansStatus.empty
                : RoomPlansStatus.loaded,
            plans: updatedPlans,
            isSaving: false,
            clearSelectedPlan: isSelectedPlanDeleted,
            clearError: true,
          ),
        );

        return true;
      },
      error: (failure) {
        emit(
          state.copyWith(
            isSaving: false,
            errorMessage: failure.message,
          ),
        );

        return false;
      },
    );
  }

  void clearError() {
    emit(state.copyWith(clearError: true));
  }
}
