## Система для аналізу погодних сервісів

Система повинна проводити певні аналізи(наприклад: скільки відсотків прогнозів справджується) сервісів прогнозу погоди.

Для системи необхідно:
* реалізувати роботу з сервісами погоди;
* реалізувати збір прогнозів;
* реалізувати алгоритми аналізу прогнозів;

> В даному документі використовується псевдокод, 
> який був вигаданий в процесі написання.

## Сервіси погоди

Для роботи з сервісами будемо використовувати наступні класи:
```ruby
WeatherService # має наступних нащадків
GismeteoWeatherService : WeatherService
SinoptikWeatherService : WeatherService
YahooWeatherService : WeatherService
WezzooWeatherService : WeatherService
```

```ruby
WeatherService # абстрактний клас, який має наступні віртуальні методи:
{
	boolean HasForecastFor(ForcastRange) # метод для перевірки на який період сервіс може надати прогноз погоди (на завтра, тиждень, 2 тижні...)
	Array<WeatherForecast> GetForecastFor(City, ForcastRange) # метод для отримання прогнозу, в якості параметрів приймає адресу та період прогнозу
}
```

Нащадки класу WeatherService повинні реалізувати описані вище віртуальні методи.

## Збір прогнозів
Збір данних даних буде відбуватись задопомогою класу ForecastFetcher.

```ruby
ForecastFetcher
{
	# поля
	Array<City> cities # Перелік міст для яких буде завантажена погода. Зазвичай міста однакові для всіх сервісів
 
	# методи
	Array<WeatherForecast> CollectForecastsFor(WeatherService, ForcastRange) # завантажує прогнози для міст використовуючи певний сервіс погоди та вказаний період часу
}
```

## Аналіз

Для аналізу даних використаємо абстрактий клас WeatherServiceAnalyzer, в якого буде віртуальний метод Analyze.

```ruby
WeatherServiceAnalyzer
{
	# поля
	WeatherService service
	
    # віртуальні методи
	boolean LoadDataToAnalyzeFor(WeatherService)
	AnalyzeResult Analyze()
}

SimpleTemperatureWeatherServiceAnalyzer : WeatherServiceAnalyzer
{
	Array<City> cities
	
	Array<WeatherForecast> pastForecasts
	Array<WeatherForecast> todayForecasts
	
    # перевизначення віртуальних методів
	boolean LoadDataToAnalyzeFor(WeatherService)
	AnalyzeResult Analyze()
}

CherkassyPrecipitationWeatherServiceAnalyzer : WeatherServiceAnalyzer
{
	City cherkassyCity
	
	Array<WeatherForecast> pastForecasts
	Array<WeatherForecast> todayForecasts
	
    # перевизначення віртуальних методів
	boolean LoadDataToAnalyzeFor(WeatherService)
	AnalyzeResult Analyze()
}

```

## Збір і опрацювання данних
Збір і опрацювання данних буде виконуватись один раз в день.
За виклик цьго процесу буде відповідати клас WeatherScheduler.

```ruby
WeatherScheduler
{
	WeatherUpdater updater
    
	void Serve() # в методі вібдувається зациклення і виклик метода Tick() раз в день
    void Tick() # викликає метод Update обєкта WeatherUpdater
}
```

```ruby

WeatherUpdater
{
	WeatherServicesAnalyzerController analyzer
	WeatherForecastsFetcherController fetcher
	
	void Update()
}

WeatherServicesAnalyzerController
{
	Array<WeatherService> services;
	Array<WeatherServiceAnalyzer> analyzers;

	boolean LoadAvailableServices()
	boolean LoadAvailableAnalyzers()
	
	void AnalyzeAllAndSave()
}

WeatherForecastsFetcherController
{
	Array<WeatherService> services;
	Array<City> cities;
	
	ForecastFetcher fetcher;
	
	boolean LoadAvailableServices()
	boolean LoadAvailableCities()
	
	void FetchAndSave()
}
```
