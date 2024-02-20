import 'package:car_service/api/data/car_database.dart';
import 'package:car_service/features/common/domain/data/cars/car_data.dart';

List<Car> mapDatabaseToCars(List<CarTableData> carsTable) {
  return carsTable
      .map(
        (e) => Car(
          id: e.id,
          photo: e.photo,
          carBrand: e.carBrand,
          carModel: e.carModel,
          releaseYear: e.releaseYear,
          registrationNumber: e.registrationNumber,
          firstAndLastName: e.firstAndLastName,
          phoneNumber: e.phoneNumber,
          worksList: e.worksList,
          comment: e.comment,
        ),
      )
      .toList();
}
