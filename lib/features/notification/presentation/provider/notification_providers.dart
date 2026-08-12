import 'package:nb_utils/nb_utils.dart';
import 'package:rider_clean/features/notification/data/repository/notification_repository_impl.dart';
import 'package:rider_clean/features/notification/domain/repository/notification_repository.dart';
import 'package:rider_clean/features/notification/domain/usecase/notifcation_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/constants.dart';
import '../../data/datasource/notification_datasource.dart';

part 'notification_providers.g.dart';

@riverpod
NotificationDatasource notificationDatasource(Ref ref) =>
    NotificationDatasource();

@riverpod
NotificationRepository notificationRepository(Ref ref) =>
    NotificationRepositoryImpl(
      notificationDataSource: ref.read(notificationDatasourceProvider),
    );

@riverpod
NotifcationUsecase notifcationUsecase(Ref ref) =>
    NotifcationUsecase(repository: ref.read(notificationRepositoryProvider));

@Riverpod(keepAlive: true)
class Notifcation extends _$Notifcation {
  @override
  FutureOr<String?> build() => getStringAsync(fcmTokenKey);

  Future<void> getToken() async {
    state = AsyncLoading();
    final notifcationUsecase = ref.read(notifcationUsecaseProvider);
    final result = await notifcationUsecase.getToken();
    state = result.fold(
      (failure) => AsyncError(failure.message, StackTrace.current),
      (voiData) => AsyncData(voiData),
    );
  }
}
