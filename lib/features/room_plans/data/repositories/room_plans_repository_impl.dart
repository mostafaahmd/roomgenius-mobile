import 'package:roomgenius_mobile/core/error/result.dart';
import 'package:roomgenius_mobile/core/networking/safe_repository_call.dart';

import '../../domain/entities/room_plan.dart';
import '../../domain/repositories/room_plans_repository.dart';
import '../datasources/room_plans_local_data_source.dart';

class RoomPlansRepositoryImpl implements RoomPlansRepository {
  const RoomPlansRepositoryImpl(this._localDataSource);

  final RoomPlansLocalDataSource _localDataSource;

  @override
  Future<Result<List<RoomPlan>>> getRoomPlans() {
    return safeRepositoryCall<List<RoomPlan>>(
      _localDataSource.getRoomPlans,
    );
  }

  @override
  Future<Result<RoomPlan?>> getRoomPlanById(String id) {
    return safeRepositoryCall<RoomPlan?>(
      () => _localDataSource.getRoomPlanById(id),
    );
  }

  @override
  Future<Result<void>> createRoomPlan(RoomPlan plan) {
    return safeRepositoryCall<void>(
      () => _localDataSource.createRoomPlan(plan),
    );
  }

  @override
  Future<Result<void>> updateRoomPlan(RoomPlan plan) {
    return safeRepositoryCall<void>(
      () => _localDataSource.updateRoomPlan(plan),
    );
  }

  @override
  Future<Result<void>> deleteRoomPlan(String id) {
    return safeRepositoryCall<void>(
      () => _localDataSource.deleteRoomPlan(id),
    );
  }
}
