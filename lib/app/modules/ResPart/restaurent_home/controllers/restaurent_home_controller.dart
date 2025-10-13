import 'package:get/get.dart';

class RestaurentHomeController extends GetxController {
  var userName = "Sbs".obs;
  var location = "Gobardanga".obs;

  var searchHint = "Looking for food...".obs;
  var hintList = [
    "Looking for food...",
    "Want Biryani?",
    "Pizza cravings?",
    "Sweet Tooth?",
  ];
  var hintIndex = 0.obs;

  var categories = [
    {"name": "Biryani", "icon": "🍛"},
    {"name": "Pizza", "icon": "🍕"},
    {"name": "Burger", "icon": "🍔"},
    {"name": "Dessert", "icon": "🍰"},
    {"name": "Drinks", "icon": "🥤"},
  ].obs;

  var restaurants = [
    {
      "name": "Aminia Restaurant",
      "images": [
        "https://picsum.photos/400/200?1",
        "https://picsum.photos/400/200?2"
      ],
      "rating": 4.5,
      "foodType": "Mughlai, Biryani",
      "avgFood": "4.4",
      "avgTime": "30 min",
      "price": "₹250 for one"
    },
    {
      "name": "Domino's Pizza",
      "images": [
        "https://picsum.photos/401/200?3",
        "https://picsum.photos/401/200?4"
      ],
      "rating": 4.2,
      "foodType": "Italian, Pizza",
      "avgFood": "4.1",
      "avgTime": "25 min",
      "price": "₹200 for one"
    },
    {
      "name": "KFC",
      "images": [
        "https://picsum.photos/402/200?5",
        "https://picsum.photos/402/200?6"
      ],
      "rating": 4.0,
      "foodType": "Chicken, Fast Food",
      "avgFood": "4.0",
      "avgTime": "20 min",
      "price": "₹180 for one"
    },
  ].obs;

  void startHintRotation() {
    Future.delayed(const Duration(seconds: 3), () {
      hintIndex.value = (hintIndex.value + 1) % hintList.length;
      searchHint.value = hintList[hintIndex.value];
      startHintRotation();
    });
  }

  @override
  void onInit() {
    startHintRotation();
    super.onInit();
  }
}