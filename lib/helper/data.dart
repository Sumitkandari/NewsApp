import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories(){
  CategoryModel categorymodel=new CategoryModel();
  List<CategoryModel> category=new List<CategoryModel>();

  categorymodel.imageURL="assets/images/bussiness.jpg";
  categorymodel.categoryName="Business";
  category.add(categorymodel);
  categorymodel= CategoryModel();
  categorymodel.imageURL="assets/images/Entertainment.jpg";
  categorymodel.categoryName="Entertaiment";
  category.add(categorymodel);

  categorymodel= CategoryModel();

  categorymodel.imageURL="assets/images/Helalth.jpg";
  categorymodel.categoryName="Health";

  category.add(categorymodel);
  
  categorymodel= CategoryModel();

  categorymodel.imageURL="assets/images/General.jpg";
  categorymodel.categoryName="General";
  category.add(categorymodel);

  categorymodel= CategoryModel();

  categorymodel.imageURL="assets/images/Sports.jpg";
  categorymodel.categoryName="Sports";
  category.add(categorymodel);
  
  categorymodel=CategoryModel();

  categorymodel.imageURL="assets/images/technology.jpg";
  categorymodel.categoryName="Technology";
  category.add(categorymodel);

  categorymodel=CategoryModel();

  categorymodel.imageURL="assets/images/science.jpg";
  categorymodel.categoryName="Science";
  category.add(categorymodel);
   
  return category;

}