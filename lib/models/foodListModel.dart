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
		 "food_item": "5 seed mooncake",
            "recipe": "A mooncake is a Chinese bakery product traditionally eaten during the Mid-Autumn Festival.  A rich thick filling usually made from red bean or lotus seed paste is surrounded by a thin, 2–3 mm (approximately 1/8th of an inch), crust and may contain yolks from salted duck eggs. Mooncakes are usually eaten in small wedges accompanied by tea.",
            "preparation": " 1 First, prepare the lotus seeds by soaking them in water for 6-8 hours. When they become soft, break each seed in half with your fingers. If you find sprouts between halves, remove them.\n    2 Place soaked lotus seeds in a cooking pot and cover with water. Bring to a boil; then reduce the heat to low. Cover and simmer for 2 hours, until the water becomes milky and the lotus seeds start falling apart.\n    3 Transfer cooked lotus seeds and their liquid to a blender, and pulse until smooth and velvety. Then, transfer this mixture into a non-stick skillet and warm up over medium heat.\n    4 Add the vegetable oil gradually one-third at a time, and stir constantly until absorbed. Then, add salt and caster sugar and stir until the sugar dissolves completely. If you prefer a saltier filling, increase the amount of salt. Keep stirring until the paste thickens and the liquid evaporates. The paste is ready when it reaches a dough-like texture. Transfer it to a plate and leave to cool.\n    5 Meanwhile, prepare the mooncake dough. Put the dietary alkali in a large bowl and mix with 1/2 tsp water until dissolved. Add honey and groundnut oil and whisk until blended. Then, fold in the flour using a spatula until soft and sticky dough is formed.\n    6 Transfer the dough to a large piece of plastic wrap, wrap it up and leave to rest at room temperature for 1-2 hours.\n    7 Crack the salted eggs one by one into a small bowl. Gently fish out the egg yolk with a slotted spoon or a mesh spoon and transfer to a big bowl filled water to remove the remains of egg whites. Strain the yolks, gently dry with a paper towel, and arrange on a plate.\n    8 Now, assemble the mooncakes. For a 50 g mooncake, the total weight of filling (egg yolk + lotus seed paste) should be 35 g. For instance, for a 15 g egg yolk, you will need 20 g of lotus seed paste. First, measure the weight of each yolk on a kitchen scale. Then, add enough lotus seed paste, so the total weight is 35 g.\n    9 Roll each portion of lotus seed paste into a ball, then press it in the palm of your hand to form a flat disc. Place a salted egg yolk in the middle, and gently gather the edges of the lotus seed paste using your thumb and index finger, so the paste envelopes the egg yolk. Roll into a ball and repeat with the remaining egg yolks and lotus seed paste portions.\n    10 Now, divide the dough into 15 g portions. The amount of dough from this recipe is enough for 20 mooncakes, so be precise. Arrange the portions of dough on a clean plate, take one, and cover the rest with plastic wrap.\n    11 Lightly flour your hands. Roll one portion of dough into a ball, then press with the palm of your hand to get a flat disc. Place the filling ball in the middle and gently stretch the edges of the dough using your thumb and index finger, so the dough wraps the filling completely. Seal the edges on the top, so the seam is invisible and roll into a ball. Repeat with the remaining portions of dough and filling balls and lightly flour each mooncake-to-be.\n    12 Preheat the oven to 180˚C/356˚F. Line a baking tray with parchment or a silicone baking sheet.\n    13 While the oven is heating up, shape the mooncakes using a mooncake press. Roll each mooncake into an elongated ball which fits the opening of your mooncake press. Gently place the mooncake into the press, and press down on a baking tray. Leave enough room between mooncakes. Place the baking tray in the oven and bake for 5 minutes.\n    14 In the meantime, make the egg wash by whisking 1 egg yolk with 1 tbsp of egg white. After 5 minutes of baking, lightly brush each mooncake with some egg wash. Return the mooncakes to the oven and bake for another 15 minutes.\n    15 Cool the mooncakes on a wire rack to a room temperature. Then, transfer the mooncakes into a food container and seal well. Let them stand for 1-2 days to become soft and moist, and then serve.",
            "ingredients": "\n    FOR LOTUS SEED PASTE\n    150 g dried lotus seeds\n    120 g caster sugar\n    80 g vegetable oil\n    1/2 tsp salt\n    FOR DOUGH\n    180 g plain flour\n    125 g honey\n    1/8 tsp (0,5 g) dietary alkali\n    55 g groundnut oil\n    FOR FILLING\n    20 salted eggs\n    FOR EGG WASH\n    1 egg yolk\n    1 tbsp egg white",
            "serving": "20 Servings",
            "time": "155 mins",
            "nutrients ": "Serving Size : 138g ( Per Serving: 394 Calories , 16g Fat , 50g Carbs , 13g Protein)",
            "taste": "Sweet",
            "situation": "At Home | Romantic",
            "restaurants ": "Yauatcha Mumbai , Bandra East",
            "delivery": "Restaurant Delivery Service",
            "cuisine": "chinese",
            "deter": "nonveg",
            "description": "A mooncake is a Chinese bakery product traditionally eaten during the Mid-Autumn Festival. The festival is about lunar appreciation and Moon watching, and mooncakes are regarded as an indispensable delicacy. Mooncakes are offered between friends or on family gatherings while celebrating the festival.",
            "mealType": "dessert",
            "image": "5seedmooncake.JPG"
	} */

}