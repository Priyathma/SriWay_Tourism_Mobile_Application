import 'package:flutter/material.dart';
import 'package:sriway/route/route_constants.dart';
import 'package:sriway/screens/auth/login_screen.dart';
import 'package:sriway/screens/auth/signup_screen.dart';
import 'package:sriway/screens/flight.dart';
import 'package:sriway/screens/guide.dart';
import 'package:sriway/screens/home_screen.dart';
import 'package:sriway/screens/hotel.dart';
import 'package:sriway/screens/map.dart';
import 'package:sriway/screens/rental.dart';
import 'package:sriway/screens/splash_screen.dart'; // Import RentalsPage

// Route management for navigation
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashScreenRoute:
      return _getPageRoute(const SplashScreen());

    case loginScreenRoute:
      return _getPageRoute(const LoginScreen());

    case signupScreenRoute:
      return _getPageRoute(const SignupScreen());

    case homeScreenRoute:
      return _getPageRoute(HomeScreen());

    // Service Pages
    case hotelsScreenRoute:
      return _getPageRoute(const HotelsPage());

    case flightsScreenRoute:
      return _getPageRoute(const FlightPage());

    case rentalsScreenRoute:
      return _getPageRoute(const RentalPage());

    case guidesScreenRoute:
      return _getPageRoute(const Guide());

    case mapScreenRoute:
      return _getPageRoute(const MapPage());

    // Default case when no matching route is found
    default:
      return _getPageRoute(_errorRoute(settings.name));
  }
}

// Helper function to create a page route
MaterialPageRoute _getPageRoute(Widget page) {
  return MaterialPageRoute(builder: (context) => page);
}

// Default error route when no route is found
Widget _errorRoute(String? routeName) {
  return Scaffold(
    body: Center(child: Text('No route defined for "$routeName"')),
  );
}
