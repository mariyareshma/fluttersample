import 'category_details.dart';

// create a class and class items 
class MedicineDetails {
  String? medicineName;
  int? medicinePrice;
  String? description;
  MedicineCategory? category;
  bool? internalUse;
  DateTime? expiryDate;

  MedicineDetails({this.medicineName,this.medicinePrice,this.description,this.category,this.internalUse,this.expiryDate});

  // create a function that returns a string value and find out  the usage of medicine 
  String getInternalUseValue() {
    if (internalUse == true) {
      return 'Internal Use';
    }
    return 'External Use';
  }
 // create a function that returns a string value and find out the category picked value 
   String getCategoryString() {
    switch (category!) {
      case MedicineCategory.tablet:
        return ' Tablet ';
      case MedicineCategory.syrup:
      return ' Syrup ';
      case MedicineCategory.sanitary:
      return ' Sanitary ';
      case MedicineCategory.oilment:
      return ' Oilment ';
      case MedicineCategory.injection:
      return ' Injection ';

    }
   }
   
   //create a function of fromJson using json generator in browser
   MedicineDetails.fromJson(Map<String, dynamic> json) {
    medicineName = json['medicineName'];
    medicinePrice = json['medicinePrice'];
    category = MedicineCategory.values[int.parse(json['category'].toString())];
    description = json['description'];
    internalUse = json['internalUse'];
    expiryDate = DateTime.parse( json['expiryDate'].toString());
  }

  //create a function of toJson using json generator in browser
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicineName'] = medicineName;
    data['medicinePrice'] = medicinePrice;
    data['category'] = category!.index;
    data['description'] = description;
    data['internalUse'] = internalUse;
    data['expiryDate'] = expiryDate.toString();
    return data;
  }
}
