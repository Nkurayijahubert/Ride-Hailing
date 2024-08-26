## Ride-Hailing App

This repository contains the code for the Ride-Hailing app. The app uses the GetX package for state management, making it scalable, modular, and easy to maintain. Below is an overview of the project structure, explaining the purpose of each directory and providing insights into the architecture.

## Project Structure

## 1. controllers/

This directory contains GetX controllers, which manage the state and business logic of the application. Each controller corresponds to a specific view, providing a clean separation between UI and logic.

    •	Example: HomeController.dart for managing state and logic of the Home screen.

## 2. models/

Defines data models that are used to serialize and deserialize JSON data received from API calls. These models represent the structure of the data used within the app.

    •	Examples: UserModel.dart, ComplainModel.dart.

## 3. views/

Holds the UI components, including screens and widgets. It is further organized to separate full screens from reusable components.

    •	Subfolder: widgets/ - Contains reusable UI components shared across different views.

## 4. services/

Handles interactions with external services, such as API calls and authentication. This layer abstracts the specifics of these interactions, providing a simple interface for the rest of the app to use.

    •	Example: ApiService.dart includes methods for making HTTP requests like GET, POST, PUT, and DELETE.

## 5. repositories/

Acts as an abstraction layer between the services and controllers. It contains business logic related to data processing and handling before sending it to controllers.

    •	Example: CarDetailsRepository.dart fetches and processes data from ApiService.

## 6. bindings/

Defines dependencies for controllers and services. This is where you manage dependency injection using GetX, making it easy to manage the lifecycle of controllers and services.

    •	Example: Each screen has a corresponding binding file, such as HomeBinding.dart, which specifies which controllers and services to initialize.

## 7. routes/

Manages the application routing and navigation. It defines named routes and maps them to their respective screens, making navigation between different parts of the app straightforward.

    •	Example: app_routes.dart contains the definition of all routes used in the application.

## 8. utils/

Includes utility functions, helpers, and constants used throughout the app. This helps in avoiding code duplication and makes the app easier to maintain.

    •	Examples: constants.dart for application-wide constant values, helpers.dart for utility functions.

## Benefits of This Structure

    1.	Separation of Concerns: Each part of the app is separated into different layers, making it easier to manage, develop, and scale.
    2.	Modularity: Features and components are modular, allowing independent updates and reuse.
    3.	Scalability: The structure supports the addition of new features without cluttering the existing codebase.
    4.	Testability: Decoupled components make it easier to write unit and integration tests.

## Key Concepts in GetX State Management

    •	GetX Controller (HomeController): Manages the state and logic for specific widgets or views. It extends GetxController, which provides lifecycle methods and state management capabilities.
    •	Reactive Variables (obs): By appending .obs to a variable, it becomes reactive. This allows automatic UI updates whenever the variable’s value changes, facilitating a responsive and dynamic user interface.

Getting Started

To get started with the project, clone this repository and follow the setup instructions below:

    1.	Clone the repository: git clone https://github.com/Nkurayijahubert/Ride-Hailing.git
    2.	Install dependencies: flutter pub get
    3.	Run the app: flutter run

Ensure that your development environment is set up with Flutter and the required SDKs. Follow the official Flutter documentation for setup instructions.
