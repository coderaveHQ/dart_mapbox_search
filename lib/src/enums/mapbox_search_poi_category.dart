/// Enum representing all supported POI categories
enum MapboxSearchPoiCategory {
  /// General services category
  services('services'),

  /// Shopping-related locations
  shopping('shopping'),

  /// Health services and facilities
  healthServices('health_services'),

  /// Office and business locations
  office('office'),

  /// Food and drink establishments
  foodAndDrink('food_and_drink'),

  /// Specific food locations
  food('food'),

  /// Shipping and mailing stores
  shippingStore('shipping_store'),

  /// Restaurants
  restaurant('restaurant'),

  /// Educational institutions
  education('education'),

  /// Landscaping and gardening services
  landscaping('landscaping'),

  /// Schools
  school('school'),

  /// Real estate agents and services
  realEstateAgent('real_estate_agent'),

  /// Outdoor and recreational locations
  outdoors('outdoors'),

  /// Financial services including banks
  financialServices('financial_services'),

  /// Doctor's offices and clinics
  doctorsOffice('doctors_office'),

  /// Grocery stores
  grocery('grocery'),

  /// Nightlife venues like bars and clubs
  nightlife('nightlife'),

  /// Hairdressing and barber services
  hairdresser('hairdresser'),

  /// Lodging and accommodation services
  lodging('lodging'),

  /// Home-related services and stores
  home('home'),

  /// Auto repair shops
  autoRepair('auto_repair'),

  /// Places of worship
  placeOfWorship('place_of_worship'),

  /// Hotels and motels
  hotel('hotel'),

  /// Bars and pubs
  bar('bar'),

  /// Medical practice locations
  medicalPractice('medical_practice'),

  /// Entertainment venues and activities
  entertainment('entertainment'),

  /// Clothing and apparel stores
  clothingStore('clothing_store'),

  /// Consulting services
  consulting('consulting'),

  /// Fast food restaurants
  fastFood('fast_food'),

  /// Banks
  bank('bank'),

  /// Insurance brokers and services
  insuranceBroker('insurance_broker'),

  /// Transportation services and locations
  transportation('transportation'),

  /// Dentists and dental clinics
  dentist('dentist'),

  /// Legal services and lawyers
  lawyer('lawyer'),

  /// Fitness centers and gyms
  fitnessCenter('fitness_center'),

  /// Advertising agencies
  advertisingAgency('advertising_agency'),

  /// Car dealerships
  carDealership('car_dealership'),

  /// Beauty stores and salons
  beautyStore('beauty_store'),

  /// Parks and recreational areas
  park('park'),

  /// Bakeries
  bakery('bakery'),

  /// Electronics shops
  electronicsShop('electronics_shop'),

  /// Travel agencies
  travelAgency('travel_agency'),

  /// Furniture stores
  furnitureStore('furniture_store'),

  /// Pharmacies
  pharmacy('pharmacy'),

  /// Sports-related stores and services
  sports('sports'),

  /// Supermarkets
  supermarket('supermarket'),

  /// Tourist attractions
  touristAttraction('tourist_attraction'),

  /// Beauty salons
  salon('salon'),

  /// Gas stations
  gasStation('gas_station'),

  /// Convenience stores
  convenienceStore('convenience_store'),

  /// State and municipal services
  statesAndMunicipalities('states_and_municipalities'),

  /// Medical clinics
  medicalClinic('medical_clinic'),

  /// Cafes
  cafe('cafe'),

  /// Churches
  church('church'),

  /// Clothing stores (general)
  clothing('clothing'),

  /// Psychotherapists and counseling services
  psychotherapist('psychotherapist'),

  /// University buildings
  universityBuilding('university_building'),

  /// Government offices and services
  government('government'),

  /// Childcare services
  childcare('childcare'),

  /// Coffee shops
  coffee('coffee'),

  /// Copyshops
  copyshop('copyshop'),

  /// Alternative healthcare services
  alternativeHealthcare('alternative_healthcare'),

  /// Tech startups
  techStartup('tech_startup'),

  /// Farms
  farm('farm'),

  /// Pet stores
  petStore('pet_store'),

  /// Wholesale stores
  wholesaleStore('wholesale_store'),

  /// Jewelry stores
  jewelryStore('jewelry_store'),

  /// Hospitals
  hospital('hospital'),

  /// Shoe stores
  shoeStore('shoe_store'),

  /// Post offices
  postOffice('post_office'),

  /// Employment agencies
  employmentAgency('employment_agency'),

  /// ATMs
  atm('atm'),

  /// Phone stores
  phoneStore('phone_store'),

  /// Universities
  university('university'),

  /// Women's clothing stores
  womensClothingStore('womens_clothing_store'),

  /// Florists
  florist('florist'),

  /// Butcher shops
  butcherShop('butcher_shop'),

  /// Spas
  spa('spa'),

  /// Physiotherapists
  physiotherapist('physiotherapist'),

  /// Factories
  factory('factory'),

  /// Photographers
  photographer('photographer'),

  /// Historic sites
  historicSite('historic_site'),

  /// Veterinarians
  veterinarian('veterinarian'),

  /// Chiropractors
  chiropractor('chiropractor'),

  /// Breakfast restaurants
  breakfastRestaurant('breakfast_restaurant'),

  /// Non-governmental organizations (NGOs)
  nongovernmentalOrganization('nongovernmental_organization'),

  /// Sports shops
  sportsShop('sports_shop'),

  /// Department Store
  departmentStore('department_store'),

  /// Nail Salon
  nailSalon('nail_salon'),

  /// Car Rental Service
  carRental('car_rental'),

  /// Temple
  temple('temple'),

  /// Monument
  monument('monument'),

  /// Gift Shop
  giftShop('gift_shop'),

  /// Campground
  campground('campground'),

  /// Vacation Rental
  vacationRental('vacation_rental'),

  /// Taxi Service
  taxi('taxi'),

  /// Hardware Store
  hardwareStore('hardware_store'),

  /// Laundry Service
  laundry('laundry'),

  /// Psychological Services
  psychologicalServices('psychological_services'),

  /// Fishing
  fishing('fishing'),

  /// Coworking Space
  coworkingSpace('coworking_space'),

  /// Information Technology (IT)
  it('it'),

  /// Mexican Restaurant
  mexicanRestaurant('mexican_restaurant'),

  /// Elementary School
  elementarySchool('elementary_school'),

  /// Dessert Shop
  dessertShop('dessert_shop'),

  /// Art
  art('art'),

  /// Book Store
  bookStore('book_store'),

  /// Liquor Store
  liquorStore('liquor_store'),

  /// Optician
  optician('optician'),

  /// Parking Lot
  parkingLot('parking_lot'),

  /// Hospital Unit
  hospitalUnit('hospital_unit'),

  /// Massage Shop
  massageShop('massage_shop'),

  /// Nightclub
  nightclub('nightclub'),

  /// Trade School
  tradeSchool('trade_school'),

  /// Bed and Breakfast
  bedAndBreakfast('bed_and_breakfast'),

  /// Art Gallery
  artGallery('art_gallery'),

  /// Sports Club
  sportsClub('sports_club'),

  /// Driving School
  drivingSchool('driving_school'),

  /// Garden Store
  gardenStore('garden_store'),

  /// Tobacco Shop
  tobaccoShop('tobacco_shop'),

  /// Event Planner
  eventPlanner('event_planner'),

  /// Italian Restaurant
  italianRestaurant('italian_restaurant'),

  /// Paper Goods Store
  paperGoodsStore('paper_goods_store'),

  /// Fabric Store
  fabricStore('fabric_store'),

  /// Garden
  garden('garden'),

  /// Storage
  storage('storage'),

  /// Assisted Living Facility
  assistedLivingFacility('assisted_living_facility'),

  /// Car Wash
  carWash('car_wash'),

  /// Shopping Mall
  shoppingMall('shopping_mall'),

  /// Music Venue
  musicVenue('music_venue'),

  /// Theatre
  theatre('theatre'),

  /// Fashion Accessory Shop
  fashionAccessoryShop('fashion_accessory_shop'),

  /// Warehouse
  warehouse('warehouse'),

  /// Burger Restaurant
  burgerRestaurant('burger_restaurant'),

  /// Library
  library('library'),

  /// Thrift Shop
  thriftShop('thrift_shop'),

  /// Home Repair Service
  homeRepair('home_repair'),

  /// Museum
  museum('museum'),

  /// Arts and Craft Store
  artsAndCraftStore('arts_and_craft_store'),

  /// Theme Park
  themePark('theme_park'),

  /// Funeral Home
  funeralHome('funeral_home'),

  /// Laboratory
  laboratory('laboratory'),

  /// Government Offices
  governmentOffices('government_offices'),

  /// Charity
  charity('charity'),

  /// Field
  field('field'),

  /// Kindergarten
  kindergarten('kindergarten'),

  /// Playground
  playground('playground'),

  /// Toy Store
  toyStore('toy_store'),

  /// Tutor
  tutor('tutor'),

  /// Turkish Restaurant
  turkishRestaurant('turkish_restaurant'),

  /// American Restaurant
  americanRestaurant('american_restaurant'),

  /// Ice Cream Shop
  iceCream('ice_cream'),

  /// Medical Supply Store
  medicalSupplyStore('medical_supply_store'),

  /// Event Space
  eventSpace('event_space'),

  /// Beach
  beach('beach'),

  /// Pizza Restaurant
  pizzaRestaurant('pizza_restaurant'),

  /// Deli
  deli('deli'),

  /// Police Station
  policeStation('police_station'),

  /// Photo Store
  photoStore('photo_store'),

  /// Bus Stop
  busStop('bus_stop'),

  /// Hostel
  hostel('hostel'),

  /// Equipment Rental
  equipmentRental('equipment_rental'),

  /// Cinema
  cinema('cinema'),

  /// Locksmith
  locksmith('locksmith'),

  /// Indian Restaurant
  indianRestaurant('indian_restaurant'),

  /// Counselling
  counselling('counselling'),

  /// Tourist Information
  touristInformation('tourist_information'),

  /// Studio
  studio('studio'),

  /// Health Food Store
  healthFoodStore('health_food_store'),

  /// Pub
  pub('pub'),

  /// Language School
  languageSchool('language_school'),

  /// Seafood Restaurant
  seafoodRestaurant('seafood_restaurant'),

  /// Dance Studio
  danceStudio('dance_studio'),

  /// Information Technology Company
  informationTechnologyCompany('information_technology_company'),

  /// Motorcycle Dealer
  motorcycleDealer('motorcycle_dealer'),

  /// Social Club
  socialClub('social_club'),

  /// Teahouse
  teahouse('teahouse'),

  /// Diner Restaurant
  dinerRestaurant('diner_restaurant'),

  /// Tailor
  tailor('tailor'),

  /// Town Hall
  townhall('townhall'),

  /// Bridal Shop
  bridalShop('bridal_shop'),

  /// Winery
  winery('winery'),

  /// Lake
  lake('lake'),

  /// High School
  highSchool('high_school'),

  /// Chinese Restaurant
  chineseRestaurant('chinese_restaurant'),

  /// Stadium
  stadium('stadium'),

  /// Antique Shop
  antiqueShop('antique_shop'),

  /// Bicycle Shop
  bicycleShop('bicycle_shop'),

  /// Golf Course
  golfCourse('golf_course'),

  /// Marina
  marina('marina'),

  /// Fire Station
  fireStation('fire_station'),

  /// Medical Laboratory
  medicalLaboratory('medical_laboratory'),

  /// Railway Station
  railwayStation('railway_station'),

  /// Trailhead
  trailhead('trailhead'),

  /// Care Services
  careServices('care_services'),

  /// Wine Bar
  wineBar('wine_bar'),

  /// Discount Store
  discountStore('discount_store'),

  /// Arcade
  arcade('arcade'),

  /// Bus Station
  busStation('bus_station'),

  /// Market
  market('market'),

  /// Brewery
  brewery('brewery'),

  /// Swimming Pool
  swimmingPool('swimming_pool'),

  /// Military Base
  militaryBase('military_base'),

  /// Beer Bar
  beerBar('beer_bar'),

  /// Video Store
  videoStore('video_store'),

  /// Martial Arts Studio
  martialArtsStudio('martial_arts_studio'),

  /// Cemetery
  cemetery('cemetery'),

  /// Music Shop
  musicShop('music_shop'),

  /// Cocktail Bar
  cocktailBar('cocktail_bar'),

  /// Conference Center
  conferenceCenter('conference_center'),

  /// Music School
  musicSchool('music_school'),

  /// Mountain
  mountain('mountain'),

  /// Tours
  tours('tours'),

  /// Casino
  casino('casino'),

  /// Steakhouse
  steakhouse('steakhouse'),

  /// Notary service
  notary('notary'),

  /// Snack bar
  snackBar('snack_bar'),

  /// Taco shop
  tacoShop('taco_shop'),

  /// Boutique
  boutique('boutique'),

  /// Plaza
  plaza('plaza'),

  /// Resort
  resort('resort'),

  /// Charging station for electric vehicles
  chargingStation('charging_station'),

  /// Barbeque restaurant
  barbequeRestaurant('barbeque_restaurant'),

  /// Dry cleaners
  dryCleaners('dry_cleaners'),

  /// Japanese restaurant
  japaneseRestaurant('japanese_restaurant'),

  /// Community center
  communityCenter('community_center'),

  /// Yoga studio
  yogaStudio('yoga_studio'),

  /// Frame store
  frameStore('frame_store'),

  /// Waste transfer station
  wasteTransferStation('waste_transfer_station'),

  /// Courthouse
  courthouse('courthouse'),

  /// Design studio
  designStudio('design_studio'),

  /// Juice bar
  juiceBar('juice_bar'),

  /// Tattoo parlour
  tattooParlour('tattoo_parlour'),

  /// Tanning salon
  tanningSalon('tanning_salon'),

  /// Soccer field
  soccerField('soccer_field'),

  /// Buffet restaurant
  buffetRestaurant('buffet_restaurant'),

  /// Recycling center
  recyclingCenter('recycling_center'),

  /// Recreation center
  recreationCenter('recreation_center'),

  /// Motel
  motel('motel'),

  /// Mediterranean restaurant
  mediterraneanRestaurant('mediterranean_restaurant'),

  /// Viewpoint
  viewpoint('viewpoint'),

  /// Sports bar
  sportsBar('sports_bar'),

  /// Asian restaurant
  asianRestaurant('asian_restaurant'),

  /// Biergarten
  biergarten('biergarten'),

  /// Greek restaurant
  greekRestaurant('greek_restaurant'),

  /// Spanish restaurant
  spanishRestaurant('spanish_restaurant'),

  /// Sushi restaurant
  sushiRestaurant('sushi_restaurant'),

  /// Repair shop
  repairShop('repair_shop'),

  /// Baby goods shop
  babyGoodsShop('baby_goods_shop'),

  /// French restaurant
  frenchRestaurant('french_restaurant'),

  /// Animal shelter
  animalShelter('animal_shelter'),

  /// Fishmonger
  fishmonger('fishmonger'),

  /// Forest
  forest('forest'),

  /// Radio studio
  radioStudio('radio_studio'),

  /// Dog park
  dogPark('dog_park'),

  /// Dormitory
  dormitory('dormitory'),

  /// fishing_store
  fishingStore('fishing_store'),

  /// concert_hall
  concertHall('concert_hall'),

  /// news_kiosk
  newsKiosk('news_kiosk'),

  /// food_court
  foodCourt('food_court'),

  /// hobby_shop
  hobbyShop('hobby_shop'),

  /// stable
  stable('stable'),

  /// rehabilitation_center
  rehabilitationCenter('rehabilitation_center'),

  /// luggage_store
  luggageStore('luggage_store'),

  /// cobbler
  cobbler('cobbler'),

  /// university_laboratory
  universityLaboratory('university_laboratory'),

  /// fish_and_chips_restaurant
  fishAndChipsRestaurant('fish_and_chips_restaurant'),

  /// recording_studio
  recordingStudio('recording_studio'),

  /// mosque
  mosque('mosque'),

  /// bowling_alley
  bowlingAlley('bowling_alley'),

  /// wings_joint
  wingsJoint('wings_joint'),

  /// stripclub
  stripclub('stripclub'),

  /// racetrack
  racetrack('racetrack'),

  /// airport
  airport('airport'),

  /// public_artwork
  publicArtwork('public_artwork'),

  /// party_store
  partyStore('party_store'),

  /// dive_bar
  diveBar('dive_bar'),

  /// german_restaurant
  germanRestaurant('german_restaurant'),

  /// sewing_shop
  sewingShop('sewing_shop'),

  /// internet_cafe
  internetCafe('internet_cafe'),

  /// bridge
  bridge('bridge'),

  /// donut_shop
  donutShop('donut_shop'),

  /// military_office
  militaryOffice('military_office'),

  /// nature_reserve
  natureReserve('nature_reserve'),

  /// salad_bar
  saladBar('salad_bar'),

  /// photo_lab
  photoLab('photo_lab'),

  /// gastropub
  gastropub('gastropub'),

  /// thai_restaurant
  thaiRestaurant('thai_restaurant'),

  /// rest_area
  restArea('rest_area'),

  /// bagel_shop
  bagelShop('bagel_shop'),

  /// tax_advisor
  taxAdvisor('tax_advisor'),

  /// speakeasy
  speakeasy('speakeasy'),

  /// cheese_shop
  cheeseShop('cheese_shop'),

  /// furniture_maker
  furnitureMaker('furniture_maker'),

  /// leather_goods
  leatherGoods('leather_goods'),

  /// karaoke_bar
  karaokeBar('karaoke_bar'),

  /// community_college
  communityCollege('community_college'),

  /// tapas_restaurant
  tapasRestaurant('tapas_restaurant'),

  /// hookah_lounge
  hookahLounge('hookah_lounge'),

  /// billiards
  billiards('billiards'),

  /// sandwich_shop
  sandwichShop('sandwich_shop'),

  /// emergency_room
  emergencyRoom('emergency_room'),

  /// tennis_courts
  tennisCourts('tennis_courts'),

  /// boat_rental
  boatRental('boat_rental'),

  /// video_game_store
  videoGameStore('video_game_store'),

  /// camera_shop
  cameraShop('camera_shop'),

  /// arts_center
  artsCenter('arts_center'),

  /// check_cashing
  checkCashing('check_cashing'),

  /// brunch_restaurant
  brunchRestaurant('brunch_restaurant'),

  /// political_party_office
  politicalPartyOffice('political_party_office'),

  /// shoe_repair
  shoeRepair('shoe_repair'),

  /// watch_store
  watchStore('watch_store'),

  /// prison
  prison('prison'),

  /// psychic
  psychic('psychic'),

  /// carpet_store
  carpetStore('carpet_store'),

  /// bookmaker
  bookmaker('bookmaker'),

  /// middle_eastern_restaurant
  middleEasternRestaurant('middle_eastern_restaurant'),

  /// chocolate_shop
  chocolateShop('chocolate_shop'),

  /// water_park
  waterPark('water_park'),

  /// zoo
  zoo('zoo'),

  /// bike_rental
  bikeRental('bike_rental'),

  /// vineyard
  vineyard('vineyard'),

  /// herbalist
  herbalist('herbalist'),

  /// ski_area
  skiArea('ski_area'),

  /// vietnamese_restaurant
  vietnameseRestaurant('vietnamese_restaurant'),

  /// boat_or_ferry
  boatOrFerry('boat_or_ferry'),

  /// cruise
  cruise('cruise'),

  /// television_studio
  televisionStudio('television_studio'),

  /// beach_bar
  beachBar('beach_bar'),

  /// basketball_court
  basketballCourt('basketball_court'),

  /// dialysis_center
  dialysisCenter('dialysis_center'),

  /// carribean_restaurant
  carribeanRestaurant('carribean_restaurant'),

  /// portuguese_restaurant
  portugueseRestaurant('portuguese_restaurant'),

  /// ski_shop
  skiShop('ski_shop'),

  /// hot_dog_stand
  hotDogStand('hot_dog_stand'),

  /// pawnshop
  pawnshop('pawnshop'),

  /// pilates_studio
  pilatesStudio('pilates_studio'),

  /// aquarium
  aquarium('aquarium'),

  /// embassy
  embassy('embassy'),

  /// baseball_field
  baseballField('baseball_field'),

  /// gay_bar
  gayBar('gay_bar'),

  /// latin_american_restaurant
  latinAmericanRestaurant('latin_american_restaurant'),

  /// hunting_store
  huntingStore('hunting_store'),

  /// distillery
  distillery('distillery'),

  /// vape_shop
  vapeShop('vape_shop'),

  /// lounge
  lounge('lounge'),

  /// mattress_store
  mattressStore('mattress_store'),

  /// outlet_store
  outletStore('outlet_store'),

  /// currency_exchange
  currencyExchange('currency_exchange'),

  /// korean_restaurant
  koreanRestaurant('korean_restaurant'),

  /// cannabis_dispensary
  cannabisDispensary('cannabis_dispensary'),

  /// fair_grounds
  fairGrounds('fair_grounds'),

  /// surf_spot
  surfSpot('surf_spot'),

  /// gymnastics
  gymnastics('gymnastics'),

  /// african_restaurant
  africanRestaurant('african_restaurant'),

  /// summer_camp
  summerCamp('summer_camp'),

  /// fireworks_store
  fireworksStore('fireworks_store'),

  /// bubble_tea
  bubbleTea('bubble_tea'),

  /// pier
  pier('pier'),

  /// university_book_store
  universityBookStore('university_book_store'),

  /// ice_rink
  iceRink('ice_rink'),

  /// public_transportation_station
  publicTransportationStation('public_transportation_station'),

  /// light_rail_station
  lightRailStation('light_rail_station'),

  /// surfboard_store
  surfboardStore('surfboard_store'),

  /// turkish_coffeehouse
  turkishCoffeehouse('turkish_coffeehouse'),

  /// skatepark
  skatepark('skatepark'),

  /// frozen_yogurt_shop
  frozenYogurtShop('frozen_yogurt_shop'),

  /// english_restaurant
  englishRestaurant('english_restaurant'),

  /// rafting_spot
  raftingSpot('rafting_spot'),

  /// road
  road('road'),

  /// fountain
  fountain('fountain'),

  /// lighthouse
  lighthouse('lighthouse'),

  /// outdoors_store
  outdoorsStore('outdoors_store'),

  /// climbing
  climbing('climbing'),

  /// airport_terminal
  airportTerminal('airport_terminal'),

  /// go_kart_racing
  goKartRacing('go_kart_racing'),

  /// miniature_golf
  miniatureGolf('miniature_golf'),

  /// food_truck
  foodTruck('food_truck'),

  /// lighting_store
  lightingStore('lighting_store'),

  /// apartment_or_condo
  apartmentOrCondo('apartment_or_condo'),

  /// synagogue
  synagogue('synagogue'),

  /// brazilian_restaurant
  brazilianRestaurant('brazilian_restaurant'),

  /// cave
  cave('cave'),

  /// tunnel
  tunnel('tunnel'),

  /// noodle_restaurant
  noodleRestaurant('noodle_restaurant'),

  /// track
  track('track'),

  /// sports_center
  sportsCenter('sports_center'),

  /// kitchen_store
  kitchenStore('kitchen_store'),

  /// gun_store
  gunStore('gun_store'),

  /// hawaiian_restaurant
  hawaiianRestaurant('hawaiian_restaurant'),

  /// waterfall
  waterfall('waterfall'),

  /// soccer_stadium
  soccerStadium('soccer_stadium'),

  /// boxing_gym
  boxingGym('boxing_gym'),

  /// driving_range
  drivingRange('driving_range'),

  /// pop_up_shop
  popUpShop('pop_up_shop'),

  /// disc_golf_course
  discGolfCourse('disc_golf_course'),

  /// canal
  canal('canal'),

  /// ramen_restaurant
  ramenRestaurant('ramen_restaurant'),

  /// buddhist_temple
  buddhistTemple('buddhist_temple'),

  /// coffee_roaster
  coffeeRoaster('coffee_roaster'),

  /// cuban_restaurant
  cubanRestaurant('cuban_restaurant'),

  /// picnic_shelter
  picnicShelter('picnic_shelter'),

  /// village
  village('village'),

  /// indoor_cycling
  indoorCycling('indoor_cycling'),

  /// airport_gate
  airportGate('airport_gate'),

  /// filipino_restaurant
  filipinoRestaurant('filipino_restaurant'),

  /// skydiving_drop_zone
  skydivingDropZone('skydiving_drop_zone'),

  /// peruvian_restaurant
  peruvianRestaurant('peruvian_restaurant'),

  /// cricket_club
  cricketClub('cricket_club'),

  /// service_area
  serviceArea('service_area'),

  /// railway_platform
  railwayPlatform('railway_platform'),

  /// observatory
  observatory('observatory'),

  /// college
  college('college'),

  /// laser_tag
  laserTag('laser_tag'),

  /// climbing_gym
  climbingGym('climbing_gym'),

  /// intersection
  intersection('intersection'),

  /// sake_bar
  sakeBar('sake_bar'),

  /// indonesian_restaurant
  indonesianRestaurant('indonesian_restaurant'),

  /// football_stadium
  footballStadium('football_stadium'),

  /// island
  island('island'),

  /// neighbourhood
  neighbourhood('neighbourhood'),

  /// planetarium
  planetarium('planetarium'),

  /// carpet_cleaner
  carpetCleaner('carpet_cleaner'),

  /// motorsports_store
  motorsportsStore('motorsports_store'),

  /// optometrist
  optometrist('optometrist'),

  /// scuba_diving_shop
  scubaDivingShop('scuba_diving_shop'),

  /// bus_line
  busLine('bus_line'),

  /// labor_union
  laborUnion('labor_union'),

  /// basketball_stadium
  basketballStadium('basketball_stadium'),

  /// creole_restaurant
  creoleRestaurant('creole_restaurant'),

  /// windmill
  windmill('windmill'),

  /// irish_pub
  irishPub('irish_pub'),

  /// baseball_stadium
  baseballStadium('baseball_stadium'),

  /// persian_restaurant
  persianRestaurant('persian_restaurant'),

  /// tiki_bar
  tikiBar('tiki_bar'),

  /// baggage_claim
  baggageClaim('baggage_claim'),

  /// train
  train('train'),

  /// duty_free_shop
  dutyFreeShop('duty_free_shop'),

  /// tennis_stadium
  tennisStadium('tennis_stadium'),

  /// city
  city('city'),

  /// meeting_room
  meetingRoom('meeting_room'),

  /// airport_ticket_counter
  airportTicketCounter('airport_ticket_counter'),

  /// town
  town('town'),

  /// outdoor_sculpture
  outdoorSculpture('outdoor_sculpture'),

  /// theme_park_attraction
  themeParkAttraction('theme_park_attraction'),

  /// zoo_exhibit
  zooExhibit('zoo_exhibit'),

  /// korean_barbeque_restaurant
  koreanBarbequeRestaurant('korean_barbeque_restaurant'),

  /// river
  river('river'),

  /// gluten_free_restaurant
  glutenFreeRestaurant('gluten_free_restaurant'),

  /// hockey_stadium
  hockeyStadium('hockey_stadium'),

  /// mountain_hut
  mountainHut('mountain_hut'),

  /// beer_festival
  beerFestival('beer_festival'),

  /// sauna
  sauna('sauna'),

  /// champagne_bar
  champagneBar('champagne_bar'),

  /// tree
  tree('tree'),

  /// waffle_shop
  waffleShop('waffle_shop'),

  /// corporate_amenity
  corporateAmenity('corporate_amenity'),

  /// exhibit
  exhibit('exhibit'),

  /// well
  well('well'),

  /// boat_launch
  boatLaunch('boat_launch'),

  /// dam
  dam('dam'),

  /// cable_car
  cableCar('cable_car'),

  /// chairlift
  chairlift('chairlift'),

  /// racecourse
  racecourse('racecourse'),

  /// ski_trail
  skiTrail('ski_trail'),

  /// hunting_area
  huntingArea('hunting_area'),

  /// rugby_stadium
  rugbyStadium('rugby_stadium'),

  /// lgbtq_organization
  lgbtqOrganization('lgbtq_organization'),

  /// county
  county('county'),

  /// state
  state('state'),

  /// waste_disposal
  wasteDisposal('waste_disposal'),

  /// country
  country('country'),

  /// graffiti
  graffiti('graffiti'),

  /// hotel_bar
  hotelBar('hotel_bar'),

  /// moving_target
  movingTarget('moving_target'),

  /// street
  street('street'),

  /// treecare
  treecare('treecare'),

  /// variety_store
  varietyStore('variety_store'),

  /// whiskey_bar
  whiskeyBar('whiskey_bar');

  /// Constructor of MapboxSearchPoiCategory
  const MapboxSearchPoiCategory(this.id);

  /// The id value
  final String id;

  /// Method for returning a POI category based on a provided value
  static MapboxSearchPoiCategory fromIdString(String value) {
    return MapboxSearchPoiCategory.values.firstWhere((p) => p.id == value);
  }
}
