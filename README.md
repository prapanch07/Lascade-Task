# Lascade Task 

A Flutter application built using the design provided in Figma and the [FakeStore API](https://fakestoreapi.com/) for fetching data. The project demonstrates state management using the `Provider` package while making API calls.

## Features
- Implements the Figma design provided by Cascade.
- Fetches product data from the FakeStore API.
- State management is handled using the `Provider` package.
- Additionally, the app includes a dynamic greeting feature—if it’s morning, the app will wish "Good Morning," and if it’s afternoon, it will wish "Good Afternoon," all based on real-time data.

## Getting Started

check out here for the apk : [click here](https://drive.google.com/file/d/1HsBRx28S5hWHUvGi9tauX8JMm8SVvn20/view?usp=share_link).

### Prerequisites
- Flutter installed on your system. [Install Flutter](https://docs.flutter.dev/get-started/install).
- FakeStore API requires no setup, but you need an active internet connection for data fetching.

### demo
[![YouTube Shorts Video](https://img.youtube.com/vi/EaZUkhtZsLM/maxresdefault.jpg)](https://youtube.com/shorts/EaZUkhtZsLM?feature=shared)


### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/cascade-flutter-app.git
   cd cascade-flutter-app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

### Project Structure
- `assets/`: Contains static resources used in the app which includes icons,images ....
- `fonts/`: Contains custom font files that can be used throughout the app for typography.
- `lib/`: Contains the main application code.
  - `models/`: Data models.
  - `providers/`: State management logic with `Provider`.
  - `screens/`: UI screens.
  - `widgets/`: Reusable widgets.

## API Used
[FakeStore API](https://fakestoreapi.com/) is used to fetch product data, which powers the app's content.
