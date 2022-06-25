import 'package:flutter/material.dart';
import 'package:weather_app/data/api/repositories/weather_repository.dart';
import 'package:weather_app/domain/entities/forecast_day.dart';
import 'package:weather_app/presentation/components/theme/app_bar.dart';
import 'package:weather_app/presentation/components/widgets/wind_humidity_text.dart';

class WeatherChange extends StatefulWidget {
  final Color colorLinearTop;
  final Color colorLinearBottom;
  final String image;
  final String textDescription;
  final Color colorText;
  final dynamic widget;

  const WeatherChange({
    Key? key,
    required this.colorLinearTop,
    required this.colorLinearBottom,
    required this.image,
    required this.textDescription,
    required this.widget,
    required this.colorText,
  }) : super(key: key);

  @override
  State<WeatherChange> createState() => _WeatherChangeState();
}

class _WeatherChangeState extends State<WeatherChange> {
  final ScrollController _scrollController = ScrollController();
  List<Forecastday> conditionList = [];
  bool hasMore = true;
  bool isLoading = false;
  int page = 3;

  final WeatherRepository _weatherRepository = WeatherRepository();

  @override
  void initState() {
    super.initState();
    fetch();

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        fetch();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future refresh() async {
    setState(() {
      isLoading = false;
      hasMore = true;
      page = 1;
      conditionList.clear();
    });

    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [widget.colorLinearTop, widget.colorLinearBottom])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBarWeather(
            title: widget.widget.weather.location.name,
            rightIcon: Icons.calendar_today,
            leadingIcon: Icons.location_on,
            leadingOnTap: () {},
            color: widget.colorText,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.asset(widget.image),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          widget.textDescription,
                          style: TextStyle(
                              color: widget.colorText, fontSize: 18.0),
                        ),
                      ),
                      Text(
                        '${widget.widget.weather.current.tempC.toStringAsFixed(0)}°C',
                        style:
                            TextStyle(color: widget.colorText, fontSize: 52.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WindHumidityText(
                              color: widget.colorText,
                              text:
                                  ' ${widget.widget.weather.current.windKph.toStringAsFixed(0)} km/h',
                              icon: Icons.air,
                            ),
                            const SizedBox(
                              width: 80.0,
                            ),
                            WindHumidityText(
                              color: widget.colorText,
                              icon: Icons.water,
                              text:
                                  ' ${widget.widget.weather.current.humidity.toStringAsFixed(0)} %',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: conditionList.length + 1,
                        itemBuilder: (context, int index) {
                          if (index < conditionList.length) {
                            return GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "Dia: ${conditionList[index].date}"),
                                          Text(
                                              "Média: ${conditionList[index].day.avgtempC}"),
                                          Text(
                                              "Máxima: ${conditionList[index].day.maxtempC}"),
                                        ]),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
                              child: hasMore
                                  ? const Center(child: Text('Carregando...'))
                                  : const Center(
                                      child: Text(
                                      'Não possui mais dados de clima',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future fetch() async {
    if (isLoading) return;
    isLoading = true;
    List<Forecastday> newForecastday = await _weatherRepository
        .getWeatherFutureData(widget.widget.weather.location.name, page);

    setState(() {
      changeAddCondition(newForecastday);
    });
  }

  void changeAddCondition(List<Forecastday> forecastday) {
    page++;
    isLoading = false;
    if (forecastday.length < 3) {
      hasMore = false;
    }

    for (int index = 0; index < forecastday.length; index++) {
      conditionList.add(forecastday[index]);
    }
  }
}
