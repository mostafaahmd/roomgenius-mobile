import 'dart:convert';

import 'package:roomgenius_mobile/core/storage/cache_keys.dart';
import 'package:roomgenius_mobile/core/storage/local_storage_service.dart';

import '../../domain/entities/room_plan.dart';

abstract class RoomPlansLocalDataSource {
  Future<List<RoomPlan>> getRoomPlans();

  Future<RoomPlan?> getRoomPlanById(String id);

  Future<void> saveRoomPlans(List<RoomPlan> plans);

  Future<void> createRoomPlan(RoomPlan plan);

  Future<void> updateRoomPlan(RoomPlan plan);

  Future<void> deleteRoomPlan(String id);
}

class RoomPlansLocalDataSourceImpl implements RoomPlansLocalDataSource {
  const RoomPlansLocalDataSourceImpl(this._localStorageService);

  final LocalStorageService _localStorageService;

  @override
  Future<List<RoomPlan>> getRoomPlans() async {
    final rawData = await _localStorageService.readString(CacheKeys.roomPlans);

    if (rawData == null || rawData.trim().isEmpty) {
      return const [];
    }

    try {
      final decoded = jsonDecode(rawData);

      if (decoded is! List) {
        await _localStorageService.remove(CacheKeys.roomPlans);
        return const [];
      }

      return decoded
          .whereType<Map<String, dynamic>>()
          .map(
            (item) => RoomPlan.fromJson(item),
          )
          .toList();
    } catch (_) {
      await _localStorageService.remove(CacheKeys.roomPlans);
      return const [];
    }
  }

  @override
  Future<RoomPlan?> getRoomPlanById(String id) async {
    final plans = await getRoomPlans();

    for (final plan in plans) {
      if (plan.id == id) {
        return plan;
      }
    }

    return null;
  }

  @override
  Future<void> saveRoomPlans(List<RoomPlan> plans) async {
    final encodedPlans = jsonEncode(
      plans.map((plan) => plan.toJson()).toList(),
    );

    await _localStorageService.writeString(
      CacheKeys.roomPlans,
      encodedPlans,
    );
  }

  @override
  Future<void> createRoomPlan(RoomPlan plan) async {
    final plans = await getRoomPlans();
    final updatedPlans = [plan, ...plans];

    await saveRoomPlans(updatedPlans);
  }

  @override
  Future<void> updateRoomPlan(RoomPlan plan) async {
    final plans = await getRoomPlans();

    final updatedPlans = plans.map((currentPlan) {
      if (currentPlan.id == plan.id) {
        return plan.copyWith(updatedAt: DateTime.now());
      }

      return currentPlan;
    }).toList();

    await saveRoomPlans(updatedPlans);
  }

  @override
  Future<void> deleteRoomPlan(String id) async {
    final plans = await getRoomPlans();

    final updatedPlans = plans.where((plan) => plan.id != id).toList();

    await saveRoomPlans(updatedPlans);
  }
}