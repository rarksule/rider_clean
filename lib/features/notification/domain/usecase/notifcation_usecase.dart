import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repository/notification_repository.dart';

class NotifcationUsecase {
  NotificationRepository repository;
  NotifcationUsecase({required this.repository});

  Future<Either<Failure, String>> getToken() => repository.getToken();
}
