import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/firestore_service.dart';

class HomeRepo {
  final FireStoreService fireStoreService;
  HomeRepo({required this.fireStoreService});

  Future<Either<Failure, List<Map<String, dynamic>>>> fetchCollection(
    String collection,
  ) async {
    try {
      final data = await fireStoreService.fetchAllDocuments(collection);
      return Right(data);
    } catch (e) {
      if (e is CustomException) {
        return Left(ServerFailure(e.message));
      }
      return Left(ServerFailure('حدث خطأ أثناء جلب البيانات.'));
    }
  }
}
