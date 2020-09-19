import 'package:hive/hive.dart';

part 'foodListModel.g.dart'; /* put this to generate hive file  (if theres an error here run the command give at the bottom) */

@HiveType(typeId: 0) /* put different typeId for different class */
class FoodListModel {
  @HiveField(0)
  final String foodName;
  @HiveField(1)
  final String deter;
  @HiveField(2)
  final String cuisine;
  @HiveField(3)
  final String meal_type;
  @HiveField(4)
  final String images;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final String recipe;
  @HiveField(7)
  final List<String> ingredients;
  @HiveField(8)
  final String servings;
  @HiveField(9)
  final String time;
  @HiveField(10)
  final String nutrients;
  @HiveField(11)
  final String taste;
  @HiveField(12)
  final String situation;
  @HiveField(13)
  final List<String> preparation;
  @HiveField(14)
  final String calories;
  @HiveField(15)
  final String mood;
  @HiveField(16)
  final String fat;
  @HiveField(17)
  final String carbohydrates;
  @HiveField(18)
  final String protein;
  @HiveField(19)
  final List<String> restaurants;
  @HiveField(20)
  final String delivery;
  @HiveField(21)
  final String sr_no;
  @HiveField(22)
  final int like;

  FoodListModel({
    this.foodName,
    this.deter,
    this.cuisine,
    this.meal_type,
    this.images,
    this.description,
    this.recipe,
    this.ingredients,
    this.servings,
    this.time,
    this.nutrients,
    this.situation,
    this.taste,
    this.preparation,
    this.delivery,
    this.calories,
    this.fat,
    this.carbohydrates,
    this.mood,
    this.protein,
    this.restaurants,
    this.sr_no,
    this.like,
  });

/*  
 AFTER ANY CHANGES RUN THIS COMMANDS 
run command: flutter packages pub run build_runner build --delete-conflicting-outputs
 {      "sr_no": 2
		   "mood": "anger",
            "food_item": "American Pork Barbecue",
            "recipe": "The meat is pulled or chopped into moist strands, dressed with some remaining \"mop\" (the vinegar-and-red-pepper basting sauce), and mixed with cracklings.",
            "preparation": "Cut roast into quarters. Mix brown sugar, salt, paprika and pepper; rub over meat. Place meat and onions in a 5-qt. slow cooker.",
            "step2": "In a small bowl, whisk vinegar, Worcestershire sauce, sugar and seasonings; pour over roast. Cook, covered, on low 6-8 hours or until meat is tender.",
            "step3": "Remove roast; cool slightly. Reserve 1-1/2 cups cooking juices; discard remaining juices. Skim fat from reserved juices. Shred pork with two forks. Return pork and reserved juices to slow cooker; heat through. Serve on buns with coleslaw.",
            "ingredients": "\\n 1 boneless pork shoulder butt roast (4 to 5 pounds)\\n",
            "ingredient2": "2 tablespoons brown sugar\\n",
            "ingredient3": "2 teaspoons salt\\n",
            "ingredient4": "1 teaspoon paprika\\n",
            "ingredient5": "1/2 teaspoon pepper\\n",
            "ingredient6": "2 medium onions, quartered\\n",
            "ingredient7": "3/4 cup cider vinegar\\n",
            "ingredient8": "4 teaspoons Worcestershire sauce\\n",
            "ingredient9": "1 tablespoon sugar\\n",
            "ingredient10": "1 tablespoon crushed red pepper flakes\\n",
            "ingredient11": "1 teaspoon garlic salt\\n",
            "ingredient12": "1 teaspoon ground mustard\\n",
            "ingredient13": "1/2 teaspoon cayenne pepper\\n",
            "ingredient14": "14 hamburger buns, split\\n",
            "ingredient15": "1-3/4 pounds deli coleslaw",
            "serving": "14 servings",
            "time": "Prep: 30 min. Cook: 6 hours",
            "calories": "453 calories",
            "fat": "22g fat (6g saturated fat)",
            "carbohydrates": "35g",
            "protein": "27g",
            "taste": "Savory",
            "situation": "At Home",
            "restaurants": "West Coast Grill , Airoli",
            "delivery": "Swiggy | Zomato",
            "cuisine": "american",
            "deter": "nonveg",
            "description": "The meat is pulled or chopped into moist strands, dressed with some remaining \"mop\" (the vinegar-and-red-pepper basting sauce), and mixed with cracklings.",
            "meal_type": "Maincourse",
            "image": "americanporkbarbeque.JPG"
	} */

}
