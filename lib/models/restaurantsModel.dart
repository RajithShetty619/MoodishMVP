class RestListModel {
  final String restaurant_Name;
  final String cuisines;
  final String features;
  final String restaurant_Type;
  final String operational_after_Midnight;
  final String restaurant_Location;
  final String rating;
  final String international_phone_number;
  final String price_level;
  final String website;
  final String photo_url;
  final List<dynamic> reviews;
  final String sr_no;
  final String address;
  final bool like;

  RestListModel(
      {this.restaurant_Name,
      this.cuisines,
      this.features,
      this.restaurant_Type,
      this.operational_after_Midnight,
      this.restaurant_Location,
      this.rating,
      this.international_phone_number,
      this.price_level,
      this.website,
      this.photo_url,
      this.sr_no,
      this.reviews,
      this.address,
      this.like});
  /* 
   AFTER ANY CHANGES OR ANY ERROR IN THIS FILE, RUN THIS COMMAND
run command: flutter packages pub run build_runner build --delete-conflicting-outputs
  {
          "Cost_for_two(Rs.)": "1500",
          "Cuisines": "North Indian, Continental, Italian",
          "Features": "Hot Stuff by Bira 91",
          "Home_Delivery": "TRUE",
          "Operational_hours": "12noon – 1am (Mon-Sun)",
          "Restaurant_Type": "Casual Dining,Bar",
          "Delivery_Time(mins)": "45",
          "Rating_Category": "Good",
          "Operational_after_Midnight": "TRUE",
          "Cuisine_count": "3",
          "Restaurant_Location": "CBD-Belapur",
          "Restaurant_Name": "Jumping Frog",
          "Rating": "3.9",
          "Votes": "648",
          "done": "0",
          "location_lat": 19.0100664,
          "location_long": 73.0371634,
          "icon_url": "https://maps.gstatic.com/mapfiles/place_api/icons/bar-71.png",
          "rating": 4,
          "international_phone_number": "+91 91372 91466",
          "reviews": [
              {
                  "author_name": "Meera S",
                  "author_url": "https://www.google.com/maps/contrib/117742714173402028430/reviews",
                  "language": "en",
                  "profile_photo_url": "https://lh3.ggpht.com/-xKwZZlTWYOI/AAAAAAAAAAI/AAAAAAAAAAA/W3glhSBriyc/s128-c0x00000000-cc-rp-mo/photo.jpg",
                  "rating": 4,
                  "relative_time_description": "a month ago",
                  "text": "Amazing Ambiances.\nExcellent no-frills infrastructure. \nDelicious food.  \nBeing there with friends",
                  "time": 1595935394
              },
              {
                  "author_name": "Jprasad",
                  "author_url": "https://www.google.com/maps/contrib/108615777432705221869/reviews",
                  "language": "en",
                  "profile_photo_url": "https://lh3.ggpht.com/-OAHF-myi48o/AAAAAAAAAAI/AAAAAAAAAAA/SHOoeZp5YHY/s128-c0x00000000-cc-rp-mo-ba5/photo.jpg",
                  "rating": 4,
                  "relative_time_description": "7 months ago",
                  "text": "Pros :\nGood ambience. Good food. Good Dj, great Music. \n\nCons :\nNot much crowd .\nBit expensive",
                  "time": 1579428594
              },
              {
                  "author_name": "aniket shedage",
                  "author_url": "https://www.google.com/maps/contrib/104347316158669658673/reviews",
                  "language": "en",
                  "profile_photo_url": "https://lh5.ggpht.com/-mFNBG4MOBtM/AAAAAAAAAAI/AAAAAAAAAAA/z5QXRClU-LE/s128-c0x00000000-cc-rp-mo-ba4/photo.jpg",
                  "rating": 4,
                  "relative_time_description": "8 months ago",
                  "text": "Nice ambience. Good food. Service is good.",
                  "time": 1576786748
              },
              {
                  "author_name": "Anumol Augustine",
                  "author_url": "https://www.google.com/maps/contrib/104883309227682779409/reviews",
                  "language": "en",
                  "profile_photo_url": "https://lh4.ggpht.com/-xb3e_slShgs/AAAAAAAAAAI/AAAAAAAAAAA/87n2R7Y3MAI/s128-c0x00000000-cc-rp-mo-ba3/photo.jpg",
                  "rating": 5,
                  "relative_time_description": "a year ago",
                  "text": "Great ambience great food for great life😄. Quite good for family parties and friends too. Ground floor is good for family parties and the upper floor with loud music is best for groups. Food is well served. Loved the place. We had order pizza's and variety of veg and non veg starter's , beer, mocktail and cocktails.The best part was desert they a less number of them but yes was delicious . We had tried the devils chocolate cake and sizzling brownie with icream everything was just yum !! Had a great time.",
                  "time": 1564724873
              },
              {
                  "author_name": "Gaurav Katiyar",
                  "author_url": "https://www.google.com/maps/contrib/102823375368741827298/reviews",
                  "language": "en",
                  "profile_photo_url": "https://lh5.ggpht.com/-KXQ4gT9NSxU/AAAAAAAAAAI/AAAAAAAAAAA/K-M_pUvBOoE/s128-c0x00000000-cc-rp-mo-ba5/photo.jpg",
                  "rating": 3,
                  "relative_time_description": "7 months ago",
                  "text": "The place is located in the hub of Belapur. The place serves alcohol and it is mostly empty, even on the weekends. The crowd that comes here is trendy, college going and decent. \nThey have a floor on the first for dance and for parties, the DJ is fine. It is also a good place for your first date as the place is quiet and empty.",
                  "time": 1580290101
              }
          ],
          "price_level": 2,
          "photo_url": "https://lh3.googleusercontent.com/places/ABKp1IpLh09GD7XhwwyZQTX5y8S5w7tnIL2dqTrdgf9MbmVSDiRbM0KEgOjhIojWgrAQ34m8VXHDS8csOgxu10c75ghAhdKQpT1TfyY=s1600-w400"
      }, */
}
