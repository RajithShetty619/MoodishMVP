const functions = require('firebase-functions');

// The Firebase Admin SDK to access Cloud Firestore.
const admin = require('firebase-admin');
admin.initializeApp();
const sh = require("ss-search");
const fs = require('fs');
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.helloWorld = functions.https.onRequest((request, response) => {

    let _dataArray =
        [
            {
                "food_item": "American Pork Barbecue",
                "sr_no": "0"
            },
            {
                "food_item": "American Pride Pork Chop",
                "sr_no": "1"
            },
            {
                "food_item": "American T-bone",
                "sr_no": "2"
            },
            {
                "food_item": "aperitivo",
                "sr_no": "3"
            },
            {
                "food_item": "Barbican",
                "sr_no": "4"
            },
            {
                "food_item": "beef spiedini",
                "sr_no": "5"
            },
            {
                "food_item": "biryani",
                "sr_no": "6"
            },
            {
                "food_item": "Bocadillo",
                "sr_no": "7"
            },
            {
                "food_item": "brown rice",
                "sr_no": "8"
            },
            {
                "food_item": "burritos with minced meat",
                "sr_no": "9"
            },
            {
                "food_item": "butter chicken",
                "sr_no": "10"
            },
            {
                "food_item": "cheese souffle",
                "sr_no": "11"
            },
            {
                "food_item": "Chicken Breasts With Creamy Parmesan Sauce",
                "sr_no": "12"
            },
            {
                "food_item": "chicken tikka masala",
                "sr_no": "13"
            },
            {
                "food_item": "Chocolate Chip Cookies",
                "sr_no": "14"
            },
            {
                "food_item": "coqauvin",
                "sr_no": "15"
            },
            {
                "food_item": "Cranberry Crostini",
                "sr_no": "16"
            },
            {
                "food_item": "Crema Catalana",
                "sr_no": "17"
            },
            {
                "food_item": "creme brulee",
                "sr_no": "18"
            },
            {
                "food_item": "Custard tart",
                "sr_no": "19"
            },
            {
                "food_item": "Dorayaki",
                "sr_no": "20"
            },
            {
                "food_item": "falooda",
                "sr_no": "21"
            },
            {
                "food_item": "fish and chips",
                "sr_no": "22"
            },
            {
                "food_item": "Grilled Sweet Potatoes with Gorgonzola Spread",
                "sr_no": "23"
            },
            {
                "food_item": "Guacamole",
                "sr_no": "24"
            },
            {
                "food_item": "Imagawayaki",
                "sr_no": "25"
            },
            {
                "food_item": "indian omelette",
                "sr_no": "26"
            },
            {
                "food_item": "Khandvi",
                "sr_no": "27"
            },
            {
                "food_item": "Lemon tart",
                "sr_no": "28"
            },
            {
                "food_item": "manchow soup",
                "sr_no": "29"
            },
            {
                "food_item": "Mango halwa",
                "sr_no": "30"
            },
            {
                "food_item": "mango kulfi",
                "sr_no": "31"
            },
            {
                "food_item": "masala dosa",
                "sr_no": "32"
            },
            {
                "food_item": "Mava cake",
                "sr_no": "33"
            },
            {
                "food_item": "Miguelito",
                "sr_no": "34"
            },
            {
                "food_item": "Mizu Yokan",
                "sr_no": "35"
            },
            {
                "food_item": "Mizutaki",
                "sr_no": "36"
            },
            {
                "food_item": "modak",
                "sr_no": "37"
            },
            {
                "food_item": "orange squash",
                "sr_no": "38"
            },
            {
                "food_item": "pan roasted chicken",
                "sr_no": "39"
            },
            {
                "food_item": "pani puri",
                "sr_no": "40"
            },
            {
                "food_item": "Queso Dip with nachos",
                "sr_no": "41"
            },
            {
                "food_item": "Roasted Parsnips",
                "sr_no": "42"
            },
            {
                "food_item": "Roscón de Reyes",
                "sr_no": "43"
            },
            {
                "food_item": "shrikhand",
                "sr_no": "44"
            },
            {
                "food_item": "snow candy",
                "sr_no": "45"
            },
            {
                "food_item": "Souffle",
                "sr_no": "46"
            },
            {
                "food_item": "soy milk",
                "sr_no": "47"
            },
            {
                "food_item": "spring rolls",
                "sr_no": "48"
            },
            {
                "food_item": "Sticky Baked Chicken Wings",
                "sr_no": "49"
            },
            {
                "food_item": "stir fried tofu",
                "sr_no": "50"
            },
            {
                "food_item": "Stuffed Mussels",
                "sr_no": "51"
            },
            {
                "food_item": "Tang yuan",
                "sr_no": "52"
            },
            {
                "food_item": "Teppanyaki Fried Rice",
                "sr_no": "53"
            },
            {
                "food_item": "Tom and Jerry",
                "sr_no": "54"
            },
            {
                "food_item": "tomato salsa",
                "sr_no": "55"
            },
            {
                "food_item": "torta della nonna",
                "sr_no": "56"
            },
            {
                "food_item": "Waffle Sandwiches",
                "sr_no": "57"
            },
            {
                "food_item": "Whoopie Pie",
                "sr_no": "58"
            },
            {
                "food_item": "5 seed mooncake",
                "sr_no": "59"
            },
            {
                "food_item": "Aloo gobhi",
                "sr_no": "60"
            },
            {
                "food_item": "aloo matar",
                "sr_no": "61"
            },
            {
                "food_item": "American Chili",
                "sr_no": "62"
            },
            {
                "food_item": "bacalao",
                "sr_no": "63"
            },
            {
                "food_item": "Badusha",
                "sr_no": "64"
            },
            {
                "food_item": "bangers and mash",
                "sr_no": "65"
            },
            {
                "food_item": "Bao",
                "sr_no": "66"
            },
            {
                "food_item": "Barfi",
                "sr_no": "67"
            },
            {
                "food_item": "Basque style chicken",
                "sr_no": "68"
            },
            {
                "food_item": "basundi",
                "sr_no": "69"
            },
            {
                "food_item": "Battenberg Cake",
                "sr_no": "70"
            },
            {
                "food_item": "Biscuits",
                "sr_no": "71"
            },
            {
                "food_item": "Bourbon, black cherry & bacon brownies",
                "sr_no": "72"
            },
            {
                "food_item": "bread butter pudding",
                "sr_no": "73"
            },
            {
                "food_item": "bruschetta",
                "sr_no": "74"
            },
            {
                "food_item": "Butter chicken pinwheels",
                "sr_no": "75"
            },
            {
                "food_item": "caprese salad with pesto sauce",
                "sr_no": "76"
            },
            {
                "food_item": "Carrot Cake",
                "sr_no": "77"
            },
            {
                "food_item": "chana dal barfi",
                "sr_no": "78"
            },
            {
                "food_item": "cheese souffle",
                "sr_no": "79"
            },
            {
                "food_item": "chicago style pizza",
                "sr_no": "80"
            },
            {
                "food_item": "chicken parmesan",
                "sr_no": "81"
            },
            {
                "food_item": "Chicken puff",
                "sr_no": "82"
            },
            {
                "food_item": "Chilaquiles",
                "sr_no": "83"
            },
            {
                "food_item": "chilli con carne",
                "sr_no": "84"
            },
            {
                "food_item": "Chocolate Chip Cookies",
                "sr_no": "85"
            },
            {
                "food_item": "chole bhature",
                "sr_no": "86"
            },
            {
                "food_item": "Choriqueso",
                "sr_no": "87"
            },
            {
                "food_item": "Choux pastry",
                "sr_no": "88"
            },
            {
                "food_item": "churros",
                "sr_no": "89"
            },
            {
                "food_item": "Cocido madrileÃ±o",
                "sr_no": "90"
            },
            {
                "food_item": "crab cakes with horseradish cream",
                "sr_no": "91"
            },
            {
                "food_item": "Crab Rangoon",
                "sr_no": "92"
            },
            {
                "food_item": "Cranberry Crostini",
                "sr_no": "93"
            },
            {
                "food_item": "Crepe",
                "sr_no": "94"
            },
            {
                "food_item": "Cullen skink",
                "sr_no": "95"
            },
            {
                "food_item": "Dango",
                "sr_no": "96"
            },
            {
                "food_item": "Dou Sha Bao",
                "sr_no": "97"
            },
            {
                "food_item": "east west spring rolls",
                "sr_no": "98"
            },
            {
                "food_item": "Elote",
                "sr_no": "99"
            },
            {
                "food_item": "Empanada",
                "sr_no": "100"
            },
            {
                "food_item": "foie gras",
                "sr_no": "101"
            },
            {
                "food_item": "fried chicken and waffles",
                "sr_no": "102"
            },
            {
                "food_item": "Frisuelos",
                "sr_no": "103"
            },
            {
                "food_item": "Gordita",
                "sr_no": "104"
            },
            {
                "food_item": "gratin dauphinois",
                "sr_no": "105"
            },
            {
                "food_item": "Grilled Stuffed JalapeÃ±os",
                "sr_no": "106"
            },
            {
                "food_item": "Gringas",
                "sr_no": "107"
            },
            {
                "food_item": "guacamole",
                "sr_no": "108"
            },
            {
                "food_item": "gulab jamun",
                "sr_no": "109"
            },
            {
                "food_item": "haggis",
                "sr_no": "110"
            },
            {
                "food_item": "hamburger",
                "sr_no": "111"
            },
            {
                "food_item": "Hibachi fried rice",
                "sr_no": "112"
            },
            {
                "food_item": "Honey toast",
                "sr_no": "113"
            },
            {
                "food_item": "idli",
                "sr_no": "114"
            },
            {
                "food_item": "Jaffa Cakes",
                "sr_no": "115"
            },
            {
                "food_item": "jalebi",
                "sr_no": "116"
            },
            {
                "food_item": "Jam Roly Poly",
                "sr_no": "117"
            },
            {
                "food_item": "Japanese cheesecake",
                "sr_no": "118"
            },
            {
                "food_item": "Jiaozi",
                "sr_no": "119"
            },
            {
                "food_item": "Kakigori",
                "sr_no": "120"
            },
            {
                "food_item": "karanji",
                "sr_no": "121"
            },
            {
                "food_item": "kheer",
                "sr_no": "122"
            },
            {
                "food_item": "kothimbir vadi",
                "sr_no": "123"
            },
            {
                "food_item": "lobster rolls",
                "sr_no": "124"
            },
            {
                "food_item": "macarons",
                "sr_no": "125"
            },
            {
                "food_item": "mango kulfi",
                "sr_no": "126"
            },
            {
                "food_item": "mango lassi",
                "sr_no": "127"
            },
            {
                "food_item": "Methi Muthia( Fried and baked)",
                "sr_no": "128"
            },
            {
                "food_item": "Mexican fried cookies",
                "sr_no": "129"
            },
            {
                "food_item": "Mexican wedding cookies",
                "sr_no": "130"
            },
            {
                "food_item": "migas",
                "sr_no": "131"
            },
            {
                "food_item": "Mini Cheddars",
                "sr_no": "132"
            },
            {
                "food_item": "Molletes",
                "sr_no": "133"
            },
            {
                "food_item": "Montadito",
                "sr_no": "134"
            },
            {
                "food_item": "mutton galouti kebab",
                "sr_no": "135"
            },
            {
                "food_item": "noodles",
                "sr_no": "136"
            },
            {
                "food_item": "Nutcracker",
                "sr_no": "137"
            },
            {
                "food_item": "Nutella Quesadillas",
                "sr_no": "138"
            },
            {
                "food_item": "okonomiyaki",
                "sr_no": "139"
            },
            {
                "food_item": "papadum",
                "sr_no": "140"
            },
            {
                "food_item": "pasta carbonara",
                "sr_no": "141"
            },
            {
                "food_item": "patatas braves",
                "sr_no": "142"
            },
            {
                "food_item": "pav bhaji",
                "sr_no": "143"
            },
            {
                "food_item": "Peach Cobbler",
                "sr_no": "144"
            },
            {
                "food_item": "Pecan Pie",
                "sr_no": "145"
            },
            {
                "food_item": "peri peri chicken satay",
                "sr_no": "146"
            },
            {
                "food_item": "Pinchitos",
                "sr_no": "147"
            },
            {
                "food_item": "Pollo al ajillo",
                "sr_no": "148"
            },
            {
                "food_item": "Polvoron",
                "sr_no": "149"
            },
            {
                "food_item": "pork ribs",
                "sr_no": "150"
            },
            {
                "food_item": "pumpkin pie",
                "sr_no": "151"
            },
            {
                "food_item": "ratatouille",
                "sr_no": "152"
            },
            {
                "food_item": "schezwan chilli chicken",
                "sr_no": "153"
            },
            {
                "food_item": "scotch egg",
                "sr_no": "154"
            },
            {
                "food_item": "Sesame seed balls",
                "sr_no": "155"
            },
            {
                "food_item": "shahi paneer",
                "sr_no": "156"
            },
            {
                "food_item": "Shrub",
                "sr_no": "157"
            },
            {
                "food_item": "Southern-fried prawns",
                "sr_no": "158"
            },
            {
                "food_item": "strawberry gelato",
                "sr_no": "159"
            },
            {
                "food_item": "Sunday Roast",
                "sr_no": "160"
            },
            {
                "food_item": "Tandoori prawns",
                "sr_no": "161"
            },
            {
                "food_item": "tartiflette",
                "sr_no": "162"
            },
            {
                "food_item": "Tea",
                "sr_no": "163"
            },
            {
                "food_item": "Thai Lettuce Wraps",
                "sr_no": "164"
            },
            {
                "food_item": "tofu with rice",
                "sr_no": "165"
            },
            {
                "food_item": "Tortilla espanola",
                "sr_no": "166"
            },
            {
                "food_item": "Tostada",
                "sr_no": "167"
            },
            {
                "food_item": "uttapam",
                "sr_no": "168"
            },
            {
                "food_item": "Veg kofta",
                "sr_no": "169"
            },
            {
                "food_item": "Vegan fried okra",
                "sr_no": "170"
            },
            {
                "food_item": "Vegetable Chow Mein",
                "sr_no": "171"
            },
            {
                "food_item": "Yakisoba",
                "sr_no": "172"
            },
            {
                "food_item": "Aloo gobhi",
                "sr_no": "173"
            },
            {
                "food_item": "ambrosia",
                "sr_no": "174"
            },
            {
                "food_item": "barbecue ribs",
                "sr_no": "175"
            },
            {
                "food_item": "Bocadillo",
                "sr_no": "176"
            },
            {
                "food_item": "brown rice",
                "sr_no": "177"
            },
            {
                "food_item": "Brownies",
                "sr_no": "178"
            },
            {
                "food_item": "Butter chicken pinwheels",
                "sr_no": "179"
            },
            {
                "food_item": "cake mix cookies",
                "sr_no": "180"
            },
            {
                "food_item": "caprese salad with pesto sauce",
                "sr_no": "181"
            },
            {
                "food_item": "Carrot Cake",
                "sr_no": "182"
            },
            {
                "food_item": "cheddar crisps",
                "sr_no": "183"
            },
            {
                "food_item": "chicken quesadillas",
                "sr_no": "184"
            },
            {
                "food_item": "coqauvin",
                "sr_no": "185"
            },
            {
                "food_item": "dabeli",
                "sr_no": "186"
            },
            {
                "food_item": "Devilâ€™s food cake",
                "sr_no": "187"
            },
            {
                "food_item": "dragons beard candy",
                "sr_no": "188"
            },
            {
                "food_item": "focaccia barese",
                "sr_no": "189"
            },
            {
                "food_item": "garlic penne alfredo",
                "sr_no": "190"
            },
            {
                "food_item": "goat milk and corn panna cotta with blackberries",
                "sr_no": "191"
            },
            {
                "food_item": "Grilled Stuffed JalapeÃ±os",
                "sr_no": "192"
            },
            {
                "food_item": "hamburger",
                "sr_no": "193"
            },
            {
                "food_item": "Hibachi fried rice",
                "sr_no": "194"
            },
            {
                "food_item": "Hong dou tang",
                "sr_no": "195"
            },
            {
                "food_item": "hotdogs",
                "sr_no": "196"
            },
            {
                "food_item": "Jam Roly Poly",
                "sr_no": "197"
            },
            {
                "food_item": "kachori",
                "sr_no": "198"
            },
            {
                "food_item": "kaju katli",
                "sr_no": "199"
            },
            {
                "food_item": "kheer",
                "sr_no": "200"
            },
            {
                "food_item": "kothimbir vadi",
                "sr_no": "201"
            },
            {
                "food_item": "Lemon tart",
                "sr_no": "202"
            },
            {
                "food_item": "Malabar fish biryani",
                "sr_no": "203"
            },
            {
                "food_item": "masala dosa",
                "sr_no": "204"
            },
            {
                "food_item": "Mexican fried cookies",
                "sr_no": "205"
            },
            {
                "food_item": "momos",
                "sr_no": "206"
            },
            {
                "food_item": "moong dal tadka",
                "sr_no": "207"
            },
            {
                "food_item": "mostachon de fresa",
                "sr_no": "208"
            },
            {
                "food_item": "Nutella Quesadillas",
                "sr_no": "209"
            },
            {
                "food_item": "pan roasted chicken",
                "sr_no": "210"
            },
            {
                "food_item": "pasta con pomodore e bascillica",
                "sr_no": "211"
            },
            {
                "food_item": "pav bhaji",
                "sr_no": "212"
            },
            {
                "food_item": "pearl milk tea",
                "sr_no": "213"
            },
            {
                "food_item": "Pinchitos",
                "sr_no": "214"
            },
            {
                "food_item": "puran poli",
                "sr_no": "215"
            },
            {
                "food_item": "Queso Dip with nachos",
                "sr_no": "216"
            },
            {
                "food_item": "red tortoise cake",
                "sr_no": "217"
            },
            {
                "food_item": "San Jacobo",
                "sr_no": "218"
            },
            {
                "food_item": "shahi paneer",
                "sr_no": "219"
            },
            {
                "food_item": "snow candy",
                "sr_no": "220"
            },
            {
                "food_item": "soy milk",
                "sr_no": "221"
            },
            {
                "food_item": "Spicy Chicken Wings with Blue Cheese Dip",
                "sr_no": "222"
            },
            {
                "food_item": "Spring rolls",
                "sr_no": "223"
            },
            {
                "food_item": "sticky baked chicken wings",
                "sr_no": "224"
            },
            {
                "food_item": "sweet tea",
                "sr_no": "225"
            },
            {
                "food_item": "Sweet-and-Sour Meatballs",
                "sr_no": "226"
            },
            {
                "food_item": "tacos",
                "sr_no": "227"
            },
            {
                "food_item": "Taiyaki",
                "sr_no": "228"
            },
            {
                "food_item": "Takikomi Gohan",
                "sr_no": "229"
            },
            {
                "food_item": "tempura",
                "sr_no": "230"
            },
            {
                "food_item": "uttapam",
                "sr_no": "231"
            },
            {
                "food_item": "Vanilla Pound cake",
                "sr_no": "232"
            },
            {
                "food_item": "veg cutlet",
                "sr_no": "233"
            },
            {
                "food_item": "Veg kofta",
                "sr_no": "234"
            },
            {
                "food_item": "Victoria Sponge Cake",
                "sr_no": "235"
            },
            {
                "food_item": "Wontons",
                "sr_no": "236"
            },
            {
                "food_item": "Yakitori",
                "sr_no": "237"
            },
            {
                "food_item": "Yorkshire Pudding",
                "sr_no": "238"
            },
            {
                "food_item": "5 spice peanuts",
                "sr_no": "239"
            },
            {
                "food_item": "apple pie",
                "sr_no": "240"
            },
            {
                "food_item": "Baked fry samosa",
                "sr_no": "241"
            },
            {
                "food_item": "Baked Mozzarella Bites",
                "sr_no": "242"
            },
            {
                "food_item": "Banoffee pie",
                "sr_no": "243"
            },
            {
                "food_item": "basundi",
                "sr_no": "244"
            },
            {
                "food_item": "Biscuits",
                "sr_no": "245"
            },
            {
                "food_item": "bonda",
                "sr_no": "246"
            },
            {
                "food_item": "bow ties",
                "sr_no": "247"
            },
            {
                "food_item": "Bread rolls",
                "sr_no": "248"
            },
            {
                "food_item": "caesar salad spears",
                "sr_no": "249"
            },
            {
                "food_item": "Castella",
                "sr_no": "250"
            },
            {
                "food_item": "charente mouclade",
                "sr_no": "251"
            },
            {
                "food_item": "cheesy chicken tikka",
                "sr_no": "252"
            },
            {
                "food_item": "Chicken Chimichangas",
                "sr_no": "253"
            },
            {
                "food_item": "chicken fajitas",
                "sr_no": "254"
            },
            {
                "food_item": "Chicken Liver Toast",
                "sr_no": "255"
            },
            {
                "food_item": "chicken marsala",
                "sr_no": "256"
            },
            {
                "food_item": "Chicken Pasty",
                "sr_no": "257"
            },
            {
                "food_item": "chicken seekh kebab",
                "sr_no": "258"
            },
            {
                "food_item": "chicken taquitos",
                "sr_no": "259"
            },
            {
                "food_item": "chicken tikka masala",
                "sr_no": "260"
            },
            {
                "food_item": "Chicken with Red Mole Sauce",
                "sr_no": "261"
            },
            {
                "food_item": "chilli con carne",
                "sr_no": "262"
            },
            {
                "food_item": "Chocolate Chip Cookies",
                "sr_no": "263"
            },
            {
                "food_item": "Chocolate mousse",
                "sr_no": "264"
            },
            {
                "food_item": "Cochinita Pibil",
                "sr_no": "265"
            },
            {
                "food_item": "cottage pie",
                "sr_no": "266"
            },
            {
                "food_item": "crisp baked tandoori chicken",
                "sr_no": "267"
            },
            {
                "food_item": "Crockpot Bbq Beer Chicken",
                "sr_no": "268"
            },
            {
                "food_item": "croquetas",
                "sr_no": "269"
            },
            {
                "food_item": "Crumpets",
                "sr_no": "270"
            },
            {
                "food_item": "Custard tart",
                "sr_no": "271"
            },
            {
                "food_item": "deviled eggs with country ham",
                "sr_no": "272"
            },
            {
                "food_item": "Dry chilli paneer",
                "sr_no": "273"
            },
            {
                "food_item": "egg tart",
                "sr_no": "274"
            },
            {
                "food_item": "falooda",
                "sr_no": "275"
            },
            {
                "food_item": "fried rice",
                "sr_no": "276"
            },
            {
                "food_item": "full eng breakfast",
                "sr_no": "277"
            },
            {
                "food_item": "guacamole",
                "sr_no": "278"
            },
            {
                "food_item": "Jaffa Cakes",
                "sr_no": "279"
            },
            {
                "food_item": "Japanese Gohan",
                "sr_no": "280"
            },
            {
                "food_item": "kashmiri dum aloo",
                "sr_no": "281"
            },
            {
                "food_item": "khandvi",
                "sr_no": "282"
            },
            {
                "food_item": "Khandvi",
                "sr_no": "283"
            },
            {
                "food_item": "lobster rolls",
                "sr_no": "284"
            },
            {
                "food_item": "Lotus leaf wrap",
                "sr_no": "285"
            },
            {
                "food_item": "Lynchburg Lemonade",
                "sr_no": "286"
            },
            {
                "food_item": "malai kofta",
                "sr_no": "287"
            },
            {
                "food_item": "manchurian",
                "sr_no": "288"
            },
            {
                "food_item": "Mango halwa",
                "sr_no": "289"
            },
            {
                "food_item": "Mantecados",
                "sr_no": "290"
            },
            {
                "food_item": "Maque Choux with Rice",
                "sr_no": "291"
            },
            {
                "food_item": "matar paneer",
                "sr_no": "292"
            },
            {
                "food_item": "Methi Muthia( Fried and baked)",
                "sr_no": "293"
            },
            {
                "food_item": "Mexican wedding cookies",
                "sr_no": "294"
            },
            {
                "food_item": "Montadito",
                "sr_no": "295"
            },
            {
                "food_item": "Mud pie",
                "sr_no": "296"
            },
            {
                "food_item": "naan",
                "sr_no": "297"
            },
            {
                "food_item": "Natillas de Leche",
                "sr_no": "298"
            },
            {
                "food_item": "negroni",
                "sr_no": "299"
            },
            {
                "food_item": "noodles",
                "sr_no": "300"
            },
            {
                "food_item": "onigiri",
                "sr_no": "301"
            },
            {
                "food_item": "Opera cake",
                "sr_no": "302"
            },
            {
                "food_item": "orange squash",
                "sr_no": "303"
            },
            {
                "food_item": "palak paneer",
                "sr_no": "304"
            },
            {
                "food_item": "panettone",
                "sr_no": "305"
            },
            {
                "food_item": "Peach Cobbler",
                "sr_no": "306"
            },
            {
                "food_item": "Pecan Cheese Wafers",
                "sr_no": "307"
            },
            {
                "food_item": "peri peri chicken satay",
                "sr_no": "308"
            },
            {
                "food_item": "Pimm's",
                "sr_no": "309"
            },
            {
                "food_item": "Polvoron",
                "sr_no": "310"
            },
            {
                "food_item": "pork ribs",
                "sr_no": "311"
            },
            {
                "food_item": "Pork scratchings",
                "sr_no": "312"
            },
            {
                "food_item": "rajma chawal",
                "sr_no": "313"
            },
            {
                "food_item": "Red Velvet cake",
                "sr_no": "314"
            },
            {
                "food_item": "reuben sandwich",
                "sr_no": "315"
            },
            {
                "food_item": "salt and pepper chicken wings",
                "sr_no": "316"
            },
            {
                "food_item": "Sambhar",
                "sr_no": "317"
            },
            {
                "food_item": "schezwan chilli chicken",
                "sr_no": "318"
            },
            {
                "food_item": "Scones",
                "sr_no": "319"
            },
            {
                "food_item": "Shrimp toast",
                "sr_no": "320"
            },
            {
                "food_item": "Shrub",
                "sr_no": "321"
            },
            {
                "food_item": "Shumai",
                "sr_no": "322"
            },
            {
                "food_item": "Sopapilla cheesecake",
                "sr_no": "323"
            },
            {
                "food_item": "Souffle",
                "sr_no": "324"
            },
            {
                "food_item": "Spicy Chicken Taquitos",
                "sr_no": "325"
            },
            {
                "food_item": "Texas Caviar",
                "sr_no": "326"
            },
            {
                "food_item": "tiramisu",
                "sr_no": "327"
            },
            {
                "food_item": "Tong Sui",
                "sr_no": "328"
            },
            {
                "food_item": "torta della nonna",
                "sr_no": "329"
            },
            {
                "food_item": "Tortilla espanola",
                "sr_no": "330"
            },
            {
                "food_item": "Tostada",
                "sr_no": "331"
            },
            {
                "food_item": "Tres leches Cake",
                "sr_no": "332"
            },
            {
                "food_item": "Trifle",
                "sr_no": "333"
            },
            {
                "food_item": "turnip and apple salad",
                "sr_no": "334"
            },
            {
                "food_item": "vada",
                "sr_no": "335"
            },
            {
                "food_item": "veal blanquette",
                "sr_no": "336"
            },
            {
                "food_item": "Yaki Udon Noodles",
                "sr_no": "337"
            },
            {
                "food_item": "Yakisoba",
                "sr_no": "338"
            },
            {
                "food_item": "almond cookies",
                "sr_no": "339"
            },
            {
                "food_item": "asian style banana fritters",
                "sr_no": "340"
            },
            {
                "food_item": "bacalao",
                "sr_no": "341"
            },
            {
                "food_item": "Bananas Foster",
                "sr_no": "342"
            },
            {
                "food_item": "bangers and mash",
                "sr_no": "343"
            },
            {
                "food_item": "Bao",
                "sr_no": "344"
            },
            {
                "food_item": "Battenberg Cake",
                "sr_no": "345"
            },
            {
                "food_item": "bbq grilled corn",
                "sr_no": "346"
            },
            {
                "food_item": "Bourbon, black cherry & bacon brownies",
                "sr_no": "347"
            },
            {
                "food_item": "bread pakora",
                "sr_no": "348"
            },
            {
                "food_item": "bruschetta",
                "sr_no": "349"
            },
            {
                "food_item": "caprese chicken",
                "sr_no": "350"
            },
            {
                "food_item": "chai",
                "sr_no": "351"
            },
            {
                "food_item": "chana dal barfi",
                "sr_no": "352"
            },
            {
                "food_item": "charente mouclade",
                "sr_no": "353"
            },
            {
                "food_item": "cheese fondue",
                "sr_no": "354"
            },
            {
                "food_item": "cheese souffle",
                "sr_no": "355"
            },
            {
                "food_item": "Cheesecake",
                "sr_no": "356"
            },
            {
                "food_item": "cheung fun",
                "sr_no": "357"
            },
            {
                "food_item": "Chicken puff",
                "sr_no": "358"
            },
            {
                "food_item": "Chocolate chilli cake",
                "sr_no": "359"
            },
            {
                "food_item": "chole bhature",
                "sr_no": "360"
            },
            {
                "food_item": "Choriqueso",
                "sr_no": "361"
            },
            {
                "food_item": "Choux pastry",
                "sr_no": "362"
            },
            {
                "food_item": "clam chowder",
                "sr_no": "363"
            },
            {
                "food_item": "crab cakes with horseradish cream",
                "sr_no": "364"
            },
            {
                "food_item": "Crispy chicken pakora",
                "sr_no": "365"
            },
            {
                "food_item": "crunchy iceberg dumplings",
                "sr_no": "366"
            },
            {
                "food_item": "Daifuku",
                "sr_no": "367"
            },
            {
                "food_item": "dim sums",
                "sr_no": "368"
            },
            {
                "food_item": "Dou Sha Bao",
                "sr_no": "369"
            },
            {
                "food_item": "east west spring rolls",
                "sr_no": "370"
            },
            {
                "food_item": "Empanada",
                "sr_no": "371"
            },
            {
                "food_item": "enchiladas",
                "sr_no": "372"
            },
            {
                "food_item": "Eton Mess",
                "sr_no": "373"
            },
            {
                "food_item": "Fish pakora",
                "sr_no": "374"
            },
            {
                "food_item": "fried rice with water and chestnut",
                "sr_no": "375"
            },
            {
                "food_item": "Gambas al Ajillo",
                "sr_no": "376"
            },
            {
                "food_item": "garlic pizza",
                "sr_no": "377"
            },
            {
                "food_item": "Ginger Beer",
                "sr_no": "378"
            },
            {
                "food_item": "Gordita",
                "sr_no": "379"
            },
            {
                "food_item": "gratin dauphinois",
                "sr_no": "380"
            },
            {
                "food_item": "grilled vegetable lasagne",
                "sr_no": "381"
            },
            {
                "food_item": "Honey-Glazed Almonds",
                "sr_no": "382"
            },
            {
                "food_item": "indian omelette",
                "sr_no": "383"
            },
            {
                "food_item": "Jiaozi",
                "sr_no": "384"
            },
            {
                "food_item": "Kakigori",
                "sr_no": "385"
            },
            {
                "food_item": "kare-raisu",
                "sr_no": "386"
            },
            {
                "food_item": "keema pav",
                "sr_no": "387"
            },
            {
                "food_item": "lemon chicken piccata",
                "sr_no": "388"
            },
            {
                "food_item": "Mantecados",
                "sr_no": "389"
            },
            {
                "food_item": "margherita pizza",
                "sr_no": "390"
            },
            {
                "food_item": "maysure dosa",
                "sr_no": "391"
            },
            {
                "food_item": "Mud pie",
                "sr_no": "392"
            },
            {
                "food_item": "mushroom risotto",
                "sr_no": "393"
            },
            {
                "food_item": "mutton galouti kebab",
                "sr_no": "394"
            },
            {
                "food_item": "Nutcracker",
                "sr_no": "395"
            },
            {
                "food_item": "paneer 65",
                "sr_no": "396"
            },
            {
                "food_item": "panzenella",
                "sr_no": "397"
            },
            {
                "food_item": "pasta carbonara",
                "sr_no": "398"
            },
            {
                "food_item": "peri peri fish fingers",
                "sr_no": "399"
            },
            {
                "food_item": "Pimm's",
                "sr_no": "400"
            },
            {
                "food_item": "poha",
                "sr_no": "401"
            },
            {
                "food_item": "Pollo Oaxaca",
                "sr_no": "402"
            },
            {
                "food_item": "pumpkin Oyaki",
                "sr_no": "403"
            },
            {
                "food_item": "RumChata",
                "sr_no": "404"
            },
            {
                "food_item": "Sambhar",
                "sr_no": "405"
            },
            {
                "food_item": "Shortbread",
                "sr_no": "406"
            },
            {
                "food_item": "shredded carrot Salad",
                "sr_no": "407"
            },
            {
                "food_item": "Simple chutney sandwich",
                "sr_no": "408"
            },
            {
                "food_item": "sooji ka halwa",
                "sr_no": "409"
            },
            {
                "food_item": "torrone",
                "sr_no": "410"
            },
            {
                "food_item": "tortilla",
                "sr_no": "411"
            },
            {
                "food_item": "upma",
                "sr_no": "412"
            },
            {
                "food_item": "veg kurma",
                "sr_no": "413"
            },
            {
                "food_item": "Wagashi",
                "sr_no": "414"
            },
            {
                "food_item": "water chestnut cake",
                "sr_no": "415"
            },
            {
                "food_item": "Yosenabe",
                "sr_no": "416"
            },
            {
                "food_item": "aloo bhujia",
                "sr_no": "417"
            },
            {
                "food_item": "aloo tikki",
                "sr_no": "418"
            },
            {
                "food_item": "Annin Tofu",
                "sr_no": "419"
            },
            {
                "food_item": "arancini",
                "sr_no": "420"
            },
            {
                "food_item": "Bacon Badger",
                "sr_no": "421"
            },
            {
                "food_item": "Barbecue Potato Chips",
                "sr_no": "422"
            },
            {
                "food_item": "Basque style chicken",
                "sr_no": "423"
            },
            {
                "food_item": "Battenberg Cake",
                "sr_no": "424"
            },
            {
                "food_item": "black pudding",
                "sr_no": "425"
            },
            {
                "food_item": "blueberry cobbler",
                "sr_no": "426"
            },
            {
                "food_item": "Boston Cream Pie",
                "sr_no": "427"
            },
            {
                "food_item": "Bourbon, black cherry & bacon brownies",
                "sr_no": "428"
            },
            {
                "food_item": "bread pakora",
                "sr_no": "429"
            },
            {
                "food_item": "brioche crab melts",
                "sr_no": "430"
            },
            {
                "food_item": "chai",
                "sr_no": "431"
            },
            {
                "food_item": "charente mouclade",
                "sr_no": "432"
            },
            {
                "food_item": "chicken 65",
                "sr_no": "433"
            },
            {
                "food_item": "churros",
                "sr_no": "434"
            },
            {
                "food_item": "Coconut Shrimp with Fiery Mango Sauce",
                "sr_no": "435"
            },
            {
                "food_item": "corn cannelloni",
                "sr_no": "436"
            },
            {
                "food_item": "Cranberry Crostini",
                "sr_no": "437"
            },
            {
                "food_item": "crisp baked tandoori chicken",
                "sr_no": "438"
            },
            {
                "food_item": "Crispy chicken pakora",
                "sr_no": "439"
            },
            {
                "food_item": "crunch wrap",
                "sr_no": "440"
            },
            {
                "food_item": "crunchy iceberg dumplings",
                "sr_no": "441"
            },
            {
                "food_item": "Crystal Dumplings",
                "sr_no": "442"
            },
            {
                "food_item": "Cullen skink",
                "sr_no": "443"
            },
            {
                "food_item": "Custard tart",
                "sr_no": "444"
            },
            {
                "food_item": "dahi vada",
                "sr_no": "445"
            },
            {
                "food_item": "Dandelion and Burdock",
                "sr_no": "446"
            },
            {
                "food_item": "deep dish spaghetti pizza",
                "sr_no": "447"
            },
            {
                "food_item": "Dry chilli paneer",
                "sr_no": "448"
            },
            {
                "food_item": "east west spring rolls",
                "sr_no": "449"
            },
            {
                "food_item": "Egg rolls",
                "sr_no": "450"
            },
            {
                "food_item": "egg tart",
                "sr_no": "451"
            },
            {
                "food_item": "eight treasure rice pudding",
                "sr_no": "452"
            },
            {
                "food_item": "Escalivada",
                "sr_no": "453"
            },
            {
                "food_item": "foie gras",
                "sr_no": "454"
            },
            {
                "food_item": "fried chicken and waffles",
                "sr_no": "455"
            },
            {
                "food_item": "Fried green peppers",
                "sr_no": "456"
            },
            {
                "food_item": "fried rice",
                "sr_no": "457"
            },
            {
                "food_item": "full eng breakfast",
                "sr_no": "458"
            },
            {
                "food_item": "garlic pizza",
                "sr_no": "459"
            },
            {
                "food_item": "gazpacho",
                "sr_no": "460"
            },
            {
                "food_item": "gratin dauphinois",
                "sr_no": "461"
            },
            {
                "food_item": "Grilled chicken escalope",
                "sr_no": "462"
            },
            {
                "food_item": "grilled vegetable lasagne",
                "sr_no": "463"
            },
            {
                "food_item": "Gringas",
                "sr_no": "464"
            },
            {
                "food_item": "guilinggao",
                "sr_no": "465"
            },
            {
                "food_item": "gulab jamun",
                "sr_no": "466"
            },
            {
                "food_item": "honey chilli potato",
                "sr_no": "467"
            },
            {
                "food_item": "kaali dal",
                "sr_no": "468"
            },
            {
                "food_item": "kebabs",
                "sr_no": "469"
            },
            {
                "food_item": "khandvi",
                "sr_no": "470"
            },
            {
                "food_item": "kulfi",
                "sr_no": "471"
            },
            {
                "food_item": "La Zi Ji",
                "sr_no": "472"
            },
            {
                "food_item": "lasagne",
                "sr_no": "473"
            },
            {
                "food_item": "lassi",
                "sr_no": "474"
            },
            {
                "food_item": "Lynchburg Lemonade",
                "sr_no": "475"
            },
            {
                "food_item": "macarons",
                "sr_no": "476"
            },
            {
                "food_item": "Mantecados",
                "sr_no": "477"
            },
            {
                "food_item": "Methi Muthia( Fried and baked)",
                "sr_no": "478"
            },
            {
                "food_item": "Mexican Sopes",
                "sr_no": "479"
            },
            {
                "food_item": "Mini Cheddars",
                "sr_no": "480"
            },
            {
                "food_item": "naan",
                "sr_no": "481"
            },
            {
                "food_item": "negroni",
                "sr_no": "482"
            },
            {
                "food_item": "no bake key lime pie",
                "sr_no": "483"
            },
            {
                "food_item": "Okinawan Doughnuts",
                "sr_no": "484"
            },
            {
                "food_item": "okonomiyaki",
                "sr_no": "485"
            },
            {
                "food_item": "paella",
                "sr_no": "486"
            },
            {
                "food_item": "palak paneer",
                "sr_no": "487"
            },
            {
                "food_item": "paneer burji",
                "sr_no": "488"
            },
            {
                "food_item": "Pantxineta",
                "sr_no": "489"
            },
            {
                "food_item": "papadum",
                "sr_no": "490"
            },
            {
                "food_item": "paratha",
                "sr_no": "491"
            },
            {
                "food_item": "Pimm's",
                "sr_no": "492"
            },
            {
                "food_item": "pisto",
                "sr_no": "493"
            },
            {
                "food_item": "potato shots",
                "sr_no": "494"
            },
            {
                "food_item": "roasted eggplant spread",
                "sr_no": "495"
            },
            {
                "food_item": "rumbledethumps",
                "sr_no": "496"
            },
            {
                "food_item": "Sambhar",
                "sr_no": "497"
            },
            {
                "food_item": "sesame prawn toast",
                "sr_no": "498"
            },
            {
                "food_item": "Sesame seed balls",
                "sr_no": "499"
            },
            {
                "food_item": "Somen",
                "sr_no": "500"
            },
            {
                "food_item": "Sopapilla cheesecake",
                "sr_no": "501"
            },
            {
                "food_item": "spring rolls",
                "sr_no": "502"
            },
            {
                "food_item": "steak and kidney pie",
                "sr_no": "503"
            },
            {
                "food_item": "sweet and sour chicken balls",
                "sr_no": "504"
            },
            {
                "food_item": "sweet pea pesto crostini",
                "sr_no": "505"
            },
            {
                "food_item": "Tamagoyaki",
                "sr_no": "506"
            },
            {
                "food_item": "tandoori chicken",
                "sr_no": "507"
            },
            {
                "food_item": "Tandoori lamb chops",
                "sr_no": "508"
            },
            {
                "food_item": "tofu with rice",
                "sr_no": "509"
            },
            {
                "food_item": "torrone semifreddo",
                "sr_no": "510"
            },
            {
                "food_item": "Tuna Carpaccio",
                "sr_no": "511"
            },
            {
                "food_item": "turnip and apple salad",
                "sr_no": "512"
            },
            {
                "food_item": "Turnip cake",
                "sr_no": "513"
            },
            {
                "food_item": "Vegetable Wellington",
                "sr_no": "514"
            },
            {
                "food_item": "Zonahorias Alinadas",
                "sr_no": "515"
            },
            {
                "food_item": "zongzi",
                "sr_no": "516"
            },
            {
                "food_item": "air fried bacon",
                "sr_no": "517"
            },
            {
                "food_item": "Angel food cake",
                "sr_no": "518"
            },
            {
                "food_item": "bagel lox",
                "sr_no": "519"
            },
            {
                "food_item": "baguette",
                "sr_no": "520"
            },
            {
                "food_item": "baked buffalo wings",
                "sr_no": "521"
            },
            {
                "food_item": "Bakewell Tart",
                "sr_no": "522"
            },
            {
                "food_item": "Bedfordshire clanger",
                "sr_no": "523"
            },
            {
                "food_item": "Beef Wellington",
                "sr_no": "524"
            },
            {
                "food_item": "bellini",
                "sr_no": "525"
            },
            {
                "food_item": "Birria",
                "sr_no": "526"
            },
            {
                "food_item": "cheese balls",
                "sr_no": "527"
            },
            {
                "food_item": "cheese burger",
                "sr_no": "528"
            },
            {
                "food_item": "Cheese Tamale",
                "sr_no": "529"
            },
            {
                "food_item": "churros chips",
                "sr_no": "530"
            },
            {
                "food_item": "Corn chaat",
                "sr_no": "531"
            },
            {
                "food_item": "crisp crab",
                "sr_no": "532"
            },
            {
                "food_item": "croissant",
                "sr_no": "533"
            },
            {
                "food_item": "dal vada",
                "sr_no": "534"
            },
            {
                "food_item": "deep fried wontons",
                "sr_no": "535"
            },
            {
                "food_item": "dhokla",
                "sr_no": "536"
            },
            {
                "food_item": "dumplings",
                "sr_no": "537"
            },
            {
                "food_item": "Eclairs",
                "sr_no": "538"
            },
            {
                "food_item": "Egg Foo young",
                "sr_no": "539"
            },
            {
                "food_item": "fideua",
                "sr_no": "540"
            },
            {
                "food_item": "Flan",
                "sr_no": "541"
            },
            {
                "food_item": "focaccia bread",
                "sr_no": "542"
            },
            {
                "food_item": "Fruit and barfi",
                "sr_no": "543"
            },
            {
                "food_item": "gajar ka halwa",
                "sr_no": "544"
            },
            {
                "food_item": "Glamorgan sausage",
                "sr_no": "545"
            },
            {
                "food_item": "goli bajje",
                "sr_no": "546"
            },
            {
                "food_item": "Green Tomatoes with Garlicky RÃ©moulade",
                "sr_no": "547"
            },
            {
                "food_item": "grilled coconut lobster",
                "sr_no": "548"
            },
            {
                "food_item": "Hush Puppies",
                "sr_no": "549"
            },
            {
                "food_item": "Idli fry",
                "sr_no": "550"
            },
            {
                "food_item": "indian frybread",
                "sr_no": "551"
            },
            {
                "food_item": "Katsudon",
                "sr_no": "552"
            },
            {
                "food_item": "Korokke",
                "sr_no": "553"
            },
            {
                "food_item": "lancanshire Hotpot",
                "sr_no": "554"
            },
            {
                "food_item": "Mango pudding",
                "sr_no": "555"
            },
            {
                "food_item": "moong daal ka halwa",
                "sr_no": "556"
            },
            {
                "food_item": "mushroom risotto",
                "sr_no": "557"
            },
            {
                "food_item": "Nashville Hot Chicken",
                "sr_no": "558"
            },
            {
                "food_item": "Nasu dengaku",
                "sr_no": "559"
            },
            {
                "food_item": "nian gao",
                "sr_no": "560"
            },
            {
                "food_item": "osmanthus wine",
                "sr_no": "561"
            },
            {
                "food_item": "Pa amb tomÃ quet",
                "sr_no": "562"
            },
            {
                "food_item": "paid chaat",
                "sr_no": "563"
            },
            {
                "food_item": "Pastel de elote",
                "sr_no": "564"
            },
            {
                "food_item": "Pigs in a Blanket",
                "sr_no": "565"
            },
            {
                "food_item": "pineapple sandwich",
                "sr_no": "566"
            },
            {
                "food_item": "Pozole",
                "sr_no": "567"
            },
            {
                "food_item": "puri bhaji",
                "sr_no": "568"
            },
            {
                "food_item": "ramen noodles",
                "sr_no": "569"
            },
            {
                "food_item": "samosa",
                "sr_no": "570"
            },
            {
                "food_item": "Sausage rolls",
                "sr_no": "571"
            },
            {
                "food_item": "shabushabu",
                "sr_no": "572"
            },
            {
                "food_item": "shirley temple",
                "sr_no": "573"
            },
            {
                "food_item": "Soft Beer Pretzels",
                "sr_no": "574"
            },
            {
                "food_item": "Sopa Seca",
                "sr_no": "575"
            },
            {
                "food_item": "Spicy Edamame",
                "sr_no": "576"
            },
            {
                "food_item": "Spinach Noodles",
                "sr_no": "577"
            },
            {
                "food_item": "steak bruscheta",
                "sr_no": "578"
            },
            {
                "food_item": "steak tartare",
                "sr_no": "579"
            },
            {
                "food_item": "thepla",
                "sr_no": "580"
            },
            {
                "food_item": "Veg in the hole",
                "sr_no": "581"
            },
            {
                "food_item": "Veggies Yorkshire Stew",
                "sr_no": "582"
            },
            {
                "food_item": "white peach tart",
                "sr_no": "583"
            }
        ]
    const searchKeys = ["food_item"]
    let searchText = request.query.text;
    const results = JSON.stringify(sh.search(_dataArray, searchKeys, searchText));
    console.log(results);  
    response.send({ data: {results} });
});


