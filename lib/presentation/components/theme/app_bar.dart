import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/api/repositories/weather_repository.dart';
import 'package:weather_app/data/sqlite_db/dao/weather_dao.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/entities/weather_location.dart';
import 'package:weather_app/presentation/pages/home_page.dart';

class AppBarWeather extends StatefulWidget {
  final String title;
  final double? fontSize;
  final int? flex;
  final double? padding;
  final Function()? leadingOnTap;
  final IconData leadingIcon;
  final IconData rightIcon;
  final Color color;

  const AppBarWeather({
    Key? key,
    required this.title,
    this.leadingOnTap,
    this.fontSize,
    required this.leadingIcon,
    required this.rightIcon,
    this.flex,
    this.padding,
    required this.color,
  }) : super(key: key);

  @override
  State<AppBarWeather> createState() => _AppBarWeatherState();
}

class _AppBarWeatherState extends State<AppBarWeather> {
  WeatherRepository weatherRepository = WeatherRepository();
  LocationDAO locationDAO = LocationDAO();

  void getLocationData() async {
    late Position currentPosition;
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      currentPosition = position;
    }).catchError((e) => print(e));

    locationDAO.save(WeatherLocation(0, currentPosition.latitude.toString(),
        currentPosition.longitude.toString()));

    List<WeatherLocation> location = await locationDAO.findAll();

    Weather weather = await weatherRepository.getWeatherByLocation(
        lat: location[0].latitude.toString(),
        lon: location[0].longitude.toString());
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(weather: weather);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 30.0, bottom: 20.0),
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    getLocationData();
                  });
                },
                child: Icon(
                  widget.leadingIcon,
                  size: 30.0,
                  color: widget.color,
                ),
              ),
              Expanded(
                flex: widget.flex ?? 0,
                child: Padding(
                  padding: EdgeInsets.only(left: widget.padding ?? 0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: widget.fontSize ?? 24.0, color: widget.color),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
              ),
              Icon(
                widget.rightIcon,
                size: 30.0,
                color: widget.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
