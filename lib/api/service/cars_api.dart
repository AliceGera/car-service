import 'package:car_service/api/data/car_database.dart';
import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:drift/drift.dart';

class CarsApi {
  CarsApi(this.appDatabase);

  final AppCarDatabase appDatabase;

  Future<List<CarTableData>> getCars() async {
    return appDatabase.select(appDatabase.carTable).get();
  }

  Future<void> addCar(Car data) async {
    await appDatabase.into(appDatabase.carTable).insert(
          CarTableCompanion.insert(
            registrationNumber: data.registrationNumber,
            carDate: Value(data.carDate),
            photo: data.photo,
            carBrand: data.carBrand,
            carModel: data.carModel,
            releaseYear: data.releaseYear,
            firstAndLastName: data.firstAndLastName,
            phoneNumber: data.phoneNumber,
            worksList: data.worksList,
            comment: data.comment,
          ),
        );
  }

  Future<void> editCar(Car data) async {
    final resultTable = appDatabase.update(appDatabase.carTable)..where((t) => t.id.equals(data.id));
    await resultTable.write(
      CarTableCompanion.insert(
        registrationNumber: data.registrationNumber,
        carDate: Value(data.carDate),
        photo: data.photo,
        carBrand: data.carBrand,
        carModel: data.carModel,
        releaseYear: data.releaseYear,
        firstAndLastName: data.firstAndLastName,
        phoneNumber: data.phoneNumber,
        worksList: data.worksList,
        comment: data.comment,
      ),
    );
  }

  Future<void> deleteCar(Car data) async {
    final resultTable = appDatabase.delete(appDatabase.carTable)..where((t) => t.id.equals(data.id));
    await resultTable.go();
  }
}
