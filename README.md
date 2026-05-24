# WeatherForecast

An iOS app that shows the current weather for your location, built with SwiftUI.

## Features

- Requests the user's current location via CoreLocation
- Fetches real-time weather data from the OpenWeatherMap API
- Displays temperature, weather condition, min/max temp, wind speed, and humidity

## Requirements

- iOS 17+
- Xcode 15+
- An [OpenWeatherMap API key](https://openweathermap.org/api)

## Setup

The API key is loaded from a local `Config.xcconfig` file that is excluded from version control.

1. Create `Config.xcconfig` in the project root:
   ```
   API_KEY = your_api_key_here
   ```
2. In Xcode, assign the config file to both Debug and Release configurations:
   - Click the project (blue icon) → **Info** tab → expand **Debug** and **Release** → set the **WeatherForecast** row to `Config`
3. Build and run.

## Project Structure

```
WeatherForecast/
├── Managers/
│   ├── LocationManager.swift   # CoreLocation wrapper (@Observable)
│   └── WeatherManager.swift    # OpenWeatherMap API client + ResponseBody model
├── Views/
│   ├── WeatherContentView.swift # Root view, coordinates location + weather state
│   ├── WeatherView.swift        # Main weather display
│   ├── WeatherRow.swift         # Reusable stat row (wind, humidity, etc.)
│   ├── WelcomeView.swift        # Prompts user to share location
│   └── LoadingView.swift        # Spinner shown while fetching
└── Extensions.swift             # Double.roundDouble() for temperature formatting
```

## API

Weather data is fetched from the [OpenWeatherMap Current Weather API](https://openweathermap.org/current):
```
GET https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={key}&units=metric
```
