import 'package:roomgenius_mobile/core/error/result.dart';
import 'package:roomgenius_mobile/core/networking/safe_repository_call.dart';
import '../../domain/entities/feature_entity.dart';
import '../../domain/repositories/feature_repository.dart';
import '../datasources/local/feature_local_data_source.dart';
import '../datasources/remote/feature_remote_data_source.dart';
import '../mappers/feature_mapper.dart';

class FeatureRepositoryImpl implements FeatureRepository {
  const FeatureRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final FeatureRemoteDataSource remoteDataSource;
  final FeatureLocalDataSource localDataSource;

  @override
  Future<Result<List<FeatureEntity>>> getItems() {
    return safeRepositoryCall<List<FeatureEntity>>(() async {
      final items = await remoteDataSource.getItems();
      await localDataSource.saveItems(items);
      return items.toEntities();
    });
  }
}
