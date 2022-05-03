import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/presentation/components/theme/colors.dart';
import 'package:weather_app/presentation/components/widgets/weather_change.dart';

class HomePage extends StatefulWidget {
  final Weather weather;

  const HomePage({Key? key, required this.weather}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Limpo - Dia
    if (widget.weather.current.isDay == 1 &&
        widget.weather.current.condition.text == 'Sunny') {
      return WeatherChange(
        colorText: primaryColor,
        colorLinearTop: sunColor1,
        colorLinearBottom: sunColor2,
        image: 'assets/images/sun.png',
        textDescription: 'Ensolarado',
        widget: widget,
      );
    }
    // Limpo - Noite
    if (widget.weather.current.isDay == 0 &&
        widget.weather.current.condition.text == 'Clear') {
      return WeatherChange(
        colorText: Colors.white,
        colorLinearTop: moonColor1,
        colorLinearBottom: Colors.black54,
        image: 'assets/images/moon.png',
        textDescription: 'Limpo',
        widget: widget,
      );
    }
    // Nublado - Dia
    else if (widget.weather.current.isDay == 1 &&
        (widget.weather.current.condition.text == 'Partly cloudy' ||
            widget.weather.current.condition.text == 'Cloudy' ||
            widget.weather.current.condition.text == 'Overcast')) {
      return WeatherChange(
        colorText: primaryColor,
        widget: widget,
        colorLinearTop: cloudDayColor1,
        colorLinearBottom: cloudDayColor2,
        image: 'assets/images/cloudy-day.png',
        textDescription: 'Nublado',
      );
    }
    // Nublado - Noite
    else if (widget.weather.current.isDay == 0 &&
        (widget.weather.current.condition.text == 'Partly cloudy' ||
            widget.weather.current.condition.text == 'Cloudy' ||
            widget.weather.current.condition.text == 'Overcast')) {
      return WeatherChange(
        colorText: Colors.white,
        widget: widget,
        colorLinearTop: cloudNightColor1,
        colorLinearBottom: cloudNightColor2,
        image: 'assets/images/cloudy-night.png',
        textDescription: 'Nublado',
      );
    }
    // Névoa - Dia
    else if (widget.weather.current.isDay == 1 &&
        (widget.weather.current.condition.text == 'Mist' ||
            widget.weather.current.condition.text == 'Fog')) {
      return WeatherChange(
        colorText: primaryColor,
        widget: widget,
        colorLinearTop: cloudDayColor1,
        colorLinearBottom: cloudDayColor2,
        image: 'assets/images/mist.png',
        textDescription: 'Névoa',
      );
    }
    // Névoa - Noite
    else if (widget.weather.current.isDay == 0 &&
        (widget.weather.current.condition.text == 'Mist' ||
            widget.weather.current.condition.text == 'Fog')) {
      return WeatherChange(
        colorText: Colors.white,
        widget: widget,
        colorLinearTop: cloudNightColor1,
        colorLinearBottom: cloudNightColor2,
        image: 'assets/images/mist.png',
        textDescription: 'Névoa',
      );
    }

    // Chuvisco - Dia
    else if (widget.weather.current.isDay == 1 &&
        (widget.weather.current.condition.text == 'Drizzle' ||
            widget.weather.current.condition.text == 'Patchy light drizzle' ||
            widget.weather.current.condition.text == 'Light drizzle')) {
      return WeatherChange(
        colorText: primaryColor,
        widget: widget,
        colorLinearTop: rainDayColor1,
        colorLinearBottom: rainDayColor1,
        image: 'assets/images/drizzle-day.png',
        textDescription: 'Chuvisco',
      );
    }
    // Chuvisco - Noite
    else if (widget.weather.current.isDay == 0 &&
        (widget.weather.current.condition.text == 'Drizzle' ||
            widget.weather.current.condition.text == 'Patchy light drizzle' ||
            widget.weather.current.condition.text == 'Light drizzle')) {
      return WeatherChange(
        colorText: Colors.white,
        widget: widget,
        colorLinearTop: rainNightColor1,
        colorLinearBottom: rainNightColor2,
        image: 'assets/images/drizzle-night.png',
        textDescription: 'Chuvisco',
      );
    }

    // Chuva - Dia
    else if (widget.weather.current.isDay == 1 &&
        (widget.weather.current.condition.text == 'Rain' ||
            widget.weather.current.condition.text == 'Heavy rain' ||
            widget.weather.current.condition.text == 'Moderate rain' ||
            widget.weather.current.condition.text == 'Light rain')) {
      return WeatherChange(
        colorText: primaryColor,
        widget: widget,
        colorLinearTop: rainDayColor1,
        colorLinearBottom: rainDayColor1,
        image: 'assets/images/rain-day.png',
        textDescription: 'Chuva',
      );
    }
    // Chuva - Noite
    else if (widget.weather.current.isDay == 0 &&
        (widget.weather.current.condition.text == 'Rain' ||
            widget.weather.current.condition.text == 'Heavy rain' ||
            widget.weather.current.condition.text == 'Moderate rain' ||
            widget.weather.current.condition.text == 'Light rain')) {
      return WeatherChange(
        colorText: Colors.white,
        widget: widget,
        colorLinearTop: rainNightColor1,
        colorLinearBottom: rainNightColor2,
        image: 'assets/images/rain-night.png',
        textDescription: 'Chuva',
      );
    } else {
      if (widget.weather.current.isDay == 1) {
        return WeatherChange(
          colorText: primaryColor,
          widget: widget,
          colorLinearTop: sunColor1,
          colorLinearBottom: sunColor2,
          image: 'assets/images/sun.png',
          textDescription: 'Limpo',
        );
      } else if (widget.weather.current.isDay == 0) {
        return WeatherChange(
          colorText: Colors.white,
          widget: widget,
          colorLinearTop: moonColor1,
          colorLinearBottom: moonColor2,
          image: 'assets/images/moon.png',
          textDescription: 'Limpo',
        );
      } else {
        return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(child: Text('Error')),
        );
      }
    }
  }
}
