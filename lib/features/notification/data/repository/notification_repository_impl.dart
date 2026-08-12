import 'package:dartz/dartz.dart';

import 'package:rider_clean/core/error/failures.dart';

import '../../domain/repository/notification_repository.dart';
import '../datasource/notification_datasource.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  NotificationDatasource notificationDataSource;
  NotificationRepositoryImpl({required this.notificationDataSource});

  @override
  Future<Either<Failure, String>> getToken() =>
      notificationDataSource.getToken();
}
