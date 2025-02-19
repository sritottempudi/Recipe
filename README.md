Here's the properly formatted **GitHub README template** with **correct Markdown formatting** for the **Modules Overview** section:

---

# 🍽 Recipes App

Welcome to the **Recipes App**! This project is built using **Clean Architecture**, ensuring a **modular, scalable, and testable** codebase. It follows a **Swift Package** structure to keep concerns separate and improve maintainability.

---
![HomeScreen](https://github.com/user-attachments/assets/b64b5a99-874a-430f-987f-c837ec28fefe)
![DetailScreen](https://github.com/user-attachments/assets/d33e2455-d4a7-4b86-8859-043dc0020fed)


## 🏗 Project Overview

The Recipes App allows users to **browse a collection of recipes** with **lazy loading** for both data and images, ensuring **efficient performance** and **reduced memory usage**. It features a **detailed recipe page** that provides comprehensive recipe information along with useful links for further exploration.

---

## 📂 Modules Overview

The app is divided into multiple **Swift Packages**, each handling a specific responsibility:

### 📡 Network
- Handles all API interactions using `URLSession`.
- Manages network requests, response handling, and error management.

### 📜 DataModels
- Defines the core **data structures** used throughout the app.
- Ensures a **clean separation** between the **data layer** and the **UI**.

### 🛠 Common
- Contains **reusable utilities, extensions, and helper functions**.
- Includes **UI components, logging utilities, and shared constants**.

### 🥘 Recipe
- Manages all **recipe-related features and business logic**.
- Implements **lazy loading** for efficient data and image fetching.
- Provides the **Recipe Details Page**, displaying:
  - Full recipe
  - Ingredients
  - Preparation steps
  - Useful links

---

## 🚀 Features

✅ **Lazy Loading**: Recipes and images are loaded on demand, improving performance and reducing unnecessary data usage.  
✅ **Recipe List**: Browse a collection of recipes with a smooth scrolling experience.  
✅ **Recipe Details Page**: View full details about a recipe, including ingredients, preparation steps, and links to additional resources.  
✅ **Clean Architecture**: Follows **separation of concerns**, making the app **scalable** and **maintainable**.  
✅ **Swift Packages**: Each module is **independent**, ensuring **modular** and **efficient** code management.  
✅ **Dependency Injection**: Improves **flexibility** and **testability** by injecting dependencies rather than creating direct instances.  
✅ **Protocol-Oriented Design**: Uses **protocols** to enable **better testability** and **abstraction**, making **unit testing more effective**.  

---

## 🛠 Technologies Used

- **Swift** 🦅  
- **SwiftUI** 🎨 *(for building UI components)*  
- **URLSession** 🌐 *(for networking)*  
- **Unit Testing** 🧪 *(for ensuring app stability and correctness)*  
- **Dependency Injection** 🏗 *(for better modularity and testability)*  
- **Protocols** 📜 *(for improved abstraction and flexibility)*  

---

## ⚠️ Shortcomings Due to Time Constraints

🚧 **Design Improvements** 🎨  
🚧 The app mainly focuses on **displaying recipes** without much complex business logic.  
🚧 Features like **favoriting recipes, filtering, or searching** were **not implemented** due to time constraints.  
🚧 **Missing App Icon** 🖼  

---


