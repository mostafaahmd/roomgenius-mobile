import 'package:roomgenius_mobile/core/error/result.dart';

import '../entities/room_plan.dart';

abstract class RoomPlansRepository {
  Future<Result<List<RoomPlan>>> getRoomPlans();

  Future<Result<RoomPlan?>> getRoomPlanById(String id);

  Future<Result<void>> createRoomPlan(RoomPlan plan);

  Future<Result<void>> updateRoomPlan(RoomPlan plan);

  Future<Result<void>> deleteRoomPlan(String id);
}