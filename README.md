# 🏎️ Formula 1 Companion App

## 📌 Project Overview

This is an iOS application designed to provide a comprehensive companion for Formula 1 enthusiasts. Beyond simply displaying F1 data, this app serves as a playground to explore and implement modern iOS development best practices such as **SwiftUI**, **MVVM (Model-View-ViewModel)**, and **Clean Architecture**.

As a developer, I'm focused on building **scalable**, **maintainable**, and **testable** applications. This project reflects those principles from the ground up in a real-world scenario.

---

## ✨ Features

- **Driver Roster**  
  View a list of all current Formula 1 drivers. Each entry includes essential info like name, nationality, and current team.

- **Team Lineup**  
  Browse a list of all constructors (teams), with basic information such as team name, country of origin, and potentially key drivers.

- **Detailed Information** *(Planned)*  
  Expandable views for in-depth data on drivers and teams (e.g., career stats, car specs, historical data).

- **Responsive UI**  
  Built entirely with **SwiftUI** to ensure a clean, intuitive, and native experience across all iOS devices.

---

## 🏗 Architectural Deep Dive: SwiftUI, MVVM & Clean Architecture

This app is structured using **Clean Architecture**, complemented by **MVVM**, and built entirely in **SwiftUI**.

### SwiftUI

- **Declarative UI**: Concise and readable UI code using SwiftUI’s declarative syntax.
- **State Management**: Utilizes `@State`, `@ObservedObject`, and `@EnvironmentObject` for reactive UIs.
- **View Composition**: Complex views are built by composing smaller, reusable components.

### MVVM

- **View**: SwiftUI views that observe the ViewModel and handle user interaction.
- **ViewModel**: Transforms domain data, exposes commands, and is independent of the platform.
- **Model**: Contains business logic and raw data (aligned with the Domain layer in Clean Architecture).

### Clean Architecture

Emphasizes clear boundaries between layers:

#### 🧠 Domain Layer
- **Entities**: Core business models (e.g., `Driver`, `Team`) — pure Swift structs.
- **Use Cases**: Encapsulated logic like `FetchAllDriversUseCase`.
- **Repository Interfaces**: Abstract data operations (`DriversRepository`, `TeamsRepository`).

#### 💾 Data Layer
- **Repository Implementations**: Concrete classes that fulfill domain repository contracts.
- **Data Sources**: Interfaces to external sources like Firebase Firestore.

#### 🖼 Presentation Layer
- **Views**: SwiftUI UI components.
- **ViewModels**: Handle UI state and communicate with Use Cases.

---

## 🧰 Technologies Used

- **Swift** – Primary programming language  
- **SwiftUI** – Declarative UI framework  
- **Xcode** – Development environment  
- **Firebase Firestore SDK** – Remote database integration  
- **MVVM** – Architectural pattern  
- **Clean Architecture** – Design paradigm for separation of concerns

---

## 🚀 Getting Started

### Prerequisites

- **Xcode 14.0+**
- **macOS 13.0+**
- A configured Firebase project with Firestore enabled  
  *(Include `GoogleService-Info.plist` in your Xcode project)*

### Installation

Clone the repository:
```bash
git clone https://github.com/matidr/Formula1-iOS.git
```

Navigate to the project directory:
```bash
cd f1_ios_app
```

Install CocoaPods (if needed):
```bash
sudo gem install cocoapods
```

Install Firebase dependencies:
```bash
pod install
```

> ⚠️ **Always open the `.xcworkspace` file, not `.xcodeproj`.**

Open the project in Xcode:
```bash
open F1App.xcworkspace
```

Select a simulator or physical device, then **Build & Run**!
