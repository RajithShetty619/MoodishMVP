import 'package:hive/hive.dart';
 
part 'foodListModel.g.dart';

@HiveType(typeId: 0)
class FoodListModel {
  @HiveField(0)
  final String foodName ;
  @HiveField(1) 
  final String foodDeter ;
  @HiveField(2)
  final String cuisine ;
  @HiveField(3)
  final String mealType;
  @HiveField(4)
  final String images ;
  @HiveField(5)
  final String  description;
  @HiveField(6)
  final String  recipe;
  @HiveField(7)
  final String ingrediants ;
  @HiveField(8)
  final String servings ;
  @HiveField(9)
  final String duration;
  @HiveField(10)
  final String nutrients ;
  @HiveField(11)
  final String taste;
  @HiveField(12)
  final String situation ;

  FoodListModel({this.foodName,this.foodDeter,this.cuisine,this.mealType,this.images,this.description,
              this.recipe,this.ingrediants,this.servings,this.duration,this.nutrients,this.situation,this.taste});

/*   {
		"Food Name": "5 spice peanuts",
		"Food deter": "veg",
		"Cuisine": "indian",
		"Meal type": "snacks",
		"Images": "5spicepeanuts.JPG",
		"Description": "5 Spice Peanuts are a symbol of longevity and fertility in Chinese culture and are an extremely popular snack.",
		"Recipe": "1. Peanuts are a symbol of longevity and fertility in Chinese culture and are an extremely popular snack.  2. In a small heavy saucepan, melt the butter, brown sugar and corn syrup over medium heat to dissolve the sugar. Stir in the five-spice powder. Bring to a boil. 3. Let boil for several minutes without stirring. When it reaches the \"soft ball\" stage remove from the heat. Stir in the peanuts. 4. Spread the mixture out on the sheet. Let stand until it has hardened. Break into pieces. Store in a sealed cannister.",
		"Ingrediants": "2 cups unsalted peanuts (without skins)\n  2 tablespoons butter\n  1/4 cup brown sugar\n  1 tablespoon light corn syrup\n  1/2 teaspoon five-spice powder",
		"Servings": "Yield: 6 to 8 servings",
		"Duration": "40 mins",
		"Nutrients": "Per Serving: 266 calories; 21g total fat; 15 g carbohydrates; 9 g protein;",
		"Taste": "Savory",
		"Situation": "At Home"
	} */

}