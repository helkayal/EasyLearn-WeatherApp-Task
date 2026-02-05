class CitySearchModel {
  final String city;
  final String country;

  const CitySearchModel({required this.city, required this.country});

  @override
  String toString() => '$city - $country';
}

const List<CitySearchModel> citySearchList = [
  CitySearchModel(city: 'Cairo', country: 'Egypt'),
  CitySearchModel(city: 'Alexandria', country: 'Egypt'),
  CitySearchModel(city: 'Giza', country: 'Egypt'),
  CitySearchModel(city: 'Port Said', country: 'Egypt'),
  CitySearchModel(city: 'Luxor', country: 'Egypt'),
  CitySearchModel(city: 'Suez', country: 'Egypt'),
  CitySearchModel(city: 'Ismailia', country: 'Egypt'),
  CitySearchModel(city: 'London', country: 'United Kingdom'),
  CitySearchModel(city: 'Manchester', country: 'United Kingdom'),
  CitySearchModel(city: 'Liverpool', country: 'United Kingdom'),
  CitySearchModel(city: 'Tokyo', country: 'Japan'),
  CitySearchModel(city: 'Osaka', country: 'Japan'),
  CitySearchModel(city: 'Kyoto', country: 'Japan'),
  CitySearchModel(city: 'Paris', country: 'France'),
  CitySearchModel(city: 'Marseille', country: 'France'),
  CitySearchModel(city: 'Lyon', country: 'France'),
  CitySearchModel(city: 'Berlin', country: 'Germany'),
  CitySearchModel(city: 'Munich', country: 'Germany'),
  CitySearchModel(city: 'Frankfurt', country: 'Germany'),
  CitySearchModel(city: 'New York', country: 'USA'),
  CitySearchModel(city: 'Los Angeles', country: 'USA'),
  CitySearchModel(city: 'Chicago', country: 'USA'),
  CitySearchModel(city: 'Sydney', country: 'Australia'),
  CitySearchModel(city: 'Melbourne', country: 'Australia'),
  CitySearchModel(city: 'Brisbane', country: 'Australia'),
  CitySearchModel(city: 'Toronto', country: 'Canada'),
  CitySearchModel(city: 'Vancouver', country: 'Canada'),
  CitySearchModel(city: 'Montreal', country: 'Canada'),
  CitySearchModel(city: 'Rome', country: 'Italy'),
  CitySearchModel(city: 'Milan', country: 'Italy'),
  CitySearchModel(city: 'Naples', country: 'Italy'),
  CitySearchModel(city: 'Madrid', country: 'Spain'),
  CitySearchModel(city: 'Barcelona', country: 'Spain'),
  CitySearchModel(city: 'Valencia', country: 'Spain'),
  CitySearchModel(city: 'Moscow', country: 'Russia'),
  CitySearchModel(city: 'Saint Petersburg', country: 'Russia'),
  CitySearchModel(city: 'Kazan', country: 'Russia'),
  CitySearchModel(city: 'Beijing', country: 'China'),
  CitySearchModel(city: 'Shanghai', country: 'China'),
  CitySearchModel(city: 'Hong Kong', country: 'China'),
];
