# Lascade Task 

A Flutter application built using the design provided in Figma and the [FakeStore API](https://fakestoreapi.com/) for fetching data. The project demonstrates state management using the `Provider` package while making API calls.

## Features
- Implements the Figma design provided by Cascade.
- Fetches product data from the FakeStore API.
- State management is handled using the `Provider` package.

## Getting Started

### Prerequisites
- Flutter installed on your system. [Install Flutter](https://docs.flutter.dev/get-started/install).
- FakeStore API requires no setup, but you need an active internet connection for data fetching.

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
- `lib/`: Contains the main application code.
  - `models/`: Data models.
  - `providers/`: State management logic with `Provider`.
  - `screens/`: UI screens.
  - `widgets/`: Reusable widgets.

## API Used
[FakeStore API](https://fakestoreapi.com/) is used to fetch product data, which powers the app's content.
