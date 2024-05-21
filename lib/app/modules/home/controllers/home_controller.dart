import 'package:get/get.dart';
import 'package:travel/app/models/place.dart';

class HomeController extends GetxController {
  int selectedPlaces = 0;
  int selectedNav = 0;
  List<String> popularPlaces = [
    "Most Viewed",
    "Nearby",
    "Latest",
  ];

  List<Place> placeList = [
    Place(
        country: 'Tokyo',
        image: 'assets/images/mount_fuji.png',
        place: 'Mount Fuji',
        location: 'Tokyo, Japan',
        rating: '4.5',
        price: 500,
        time: "8 hours",
        temperature: "16 °C",
        overview:
            "Mount Fuji is an iconic symbol of Japan and one of the most renowned mountains in the world. It is an active stratovolcano that stands at 3,776 meters (12,389 feet) tall, making it the highest peak in Japan. Mount Fuji is a UNESCO World Heritage Site and attracts millions of visitors each year for hiking, sightseeing, and cultural experiences.",
        detail:
            "Mount Fuji, or Fuji-san in Japanese, holds significant cultural and spiritual importance in Japan. It has been the subject of countless works of art, literature, and religious practices throughout history. Climbing Mount Fuji is a popular activity, especially during the official climbing season from July to August. The ascent to the summit is relatively straightforward, with well-marked trails, mountain huts for resting, and breathtaking views along the way. At the summit, climbers can witness a spectacular sunrise known as 'Goraiko,' which is considered a spiritual experience by many."),
    Place(
        country: 'Paris',
        image: 'assets/images/paris.png',
        place: 'Eiffel Tower',
        location: 'Paris, France',
        rating: '4.0',
        price: 410,
        time: "6 hours",
        temperature: "23 °C",
        overview:
            "The Eiffel Tower, originally built as a temporary exhibit for the 1889 World's Fair, has become the most iconic symbol of Paris and one of the most recognizable landmarks in the world. Standing at 324 meters (1,063 feet) tall, it was the tallest man-made structure in the world until the completion of the Chrysler Building in New York City in 1930. The Eiffel Tower offers breathtaking panoramic views of Paris from its observation decks, making it a must-visit attraction for tourists from around the globe.",
        detail:
            "Designed by Gustave Eiffel, the Eiffel Tower is an engineering marvel of its time. It is made of iron and consists of three levels that are accessible by stairs or elevators. Visitors can explore the first and second levels, which feature restaurants, souvenir shops, and exhibition spaces. The third level, located at the top of the tower, offers unobstructed views of Paris and beyond. At night, the Eiffel Tower is illuminated by thousands of twinkling lights, creating a magical spectacle that captivates visitors and locals alike."),
    Place(
        country: 'Cairo',
        image: 'assets/images/cairo.png',
        place: 'Cairo Tower',
        location: 'Cairo, Egypt',
        rating: '4.4',
        price: 300,
        time: "4 hours",
        temperature: "21 °C",
        overview:
            "The Cairo Tower, also known as the Cairo Skyline or Borg Al-Qahira, is a free-standing concrete tower located in the heart of Cairo, Egypt. Standing at 187 meters (614 feet) tall, it is one of the tallest structures in Egypt and offers panoramic views of the city and the Nile River. The Cairo Tower was built in 1961 by the Egyptian government as a symbol of modernization and progress.",
        detail:
            "Designed by Egyptian architect Naoum Shebib, the Cairo Tower is an architectural masterpiece that combines elements of Pharaonic and Islamic design. Its distinctive lotus-shaped design is inspired by the ancient Egyptian symbol of rebirth and regeneration. Visitors can take an elevator ride to the observation deck, which is located at a height of 150 meters (490 feet) above ground. From there, they can enjoy stunning views of Cairo's skyline, including the Pyramids of Giza, the Sphinx, and the historic landmarks along the Nile River banks."),
    Place(
        country: 'Andes',
        image: 'assets/images/andes.png',
        place: 'Andes Sheyl',
        location: 'Andes, Argentine',
        rating: '4.8',
        price: 250,
        time: "2 hours",
        temperature: "25 °C",
        overview:
            "The Andes is the longest continental mountain range in the world, stretching over 7,000 kilometers (4,300 miles) along the western coast of South America. It spans seven countries, including Argentina, Chile, Bolivia, Peru, Ecuador, Colombia, and Venezuela. The Andes are known for their stunning natural beauty, diverse ecosystems, and rich cultural heritage. They offer a wide range of outdoor activities, including hiking, mountaineering, skiing, and wildlife watching.",
        detail:
            "The Andes are characterized by their rugged terrain, towering peaks, and dramatic landscapes. They are home to several of the highest peaks in the Americas, including Aconcagua, the highest mountain outside of Asia, and Chimborazo, the point on Earth closest to the stars. The Andes also boast a rich biodiversity, with thousands of plant and animal species found nowhere else on Earth. Indigenous peoples have inhabited the Andes for thousands of years, and their cultures and traditions continue to thrive in the region."),
  ];

  void setSelectedPlaces(int index) {
    selectedPlaces = index;
    update();
  }

  void setSelectedNav(int index) {
    selectedNav = index;
    update();
  }
}
