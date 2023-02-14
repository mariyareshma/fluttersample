import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../model/medicine_details.dart';

const String medicineFileName = 'medicalcare.json';

Future<String> getFullFilePath() async {
  var appDirectory = (await getApplicationDocumentsDirectory()).path;
  return '$appDirectory\\$medicineFileName';
}

Future<List<MedicineDetails>> readAllMedicineItems() async {
  var fullFilePath = await getFullFilePath();
  var medicineItem = <MedicineDetails>[];
  var file = File(fullFilePath);
  if (!file.existsSync()) return medicineItem;
  var fileContents = file.readAsStringSync();
  var jsonItems = jsonDecode(fileContents);
  for (var jsonItem in jsonItems) {
    var studiesItemObj = MedicineDetails.fromJson(jsonItem);
    medicineItem.add(studiesItemObj);
  }
  return medicineItem;
}


Future writeMedicineItemsToFile(List<MedicineDetails> medicineItems) async {
  var json = [];

  for (var medicineItem in medicineItems) {
    var itemJson = medicineItem.toJson();
    json.add(itemJson);
  }

  var jsonStringValue = jsonEncode(json);
  var fullFilePath = await getFullFilePath();
  var file = File(fullFilePath);

  file.writeAsStringSync(jsonStringValue, mode: FileMode.write, flush: true);
}

Future addToMedicineItem(MedicineDetails medicineItemObj) async {
  var listofMedicineItem = await readAllMedicineItems();
  listofMedicineItem.add(medicineItemObj);
  await writeMedicineItemsToFile(listofMedicineItem);
}

 Future deleteFromMedicineItem(MedicineDetails medicineItemObj) async{
  var listofMedicineItem=await readAllMedicineItems();
  listofMedicineItem.removeWhere((element) => element.expiryDate == medicineItemObj.expiryDate);
  await writeMedicineItemsToFile(listofMedicineItem);
 }

 Future editItem(MedicineDetails medicineItemOfOldObj,
    MedicineDetails medicineItemOfNewObj) async {
  await deleteFromMedicineItem(medicineItemOfOldObj);
  await addToMedicineItem(medicineItemOfNewObj);
}

