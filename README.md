# DogRetriever

DogRetriever is a SwiftUI-based iOS application that allows users to explore various dog breeds through a scrollable list and searchable text field. 
By selecting a breed, users can view detailed characteristics and browse multiple images of each dog breed.

## Features

- **Browse Dog Breeds:** Access a comprehensive list of dog breeds with quick search functionality and an auto-complete text field (case-insensitive).
- **Detailed Breed Information:** Tap on any breed to see its unique characteristics and a gallery of images.
- **Bilingual Support:** Available in English and French.
- **Responsive Design:** Optimized for all iPhone screen sizes, with adaptive layouts in both portrait and landscape orientations.
- **Light/Dark Mode:** Supports light and dark themes to match the user’s system preference.
- **Offline Caching:** Images are cached to allow offline viewing of previously visited breeds.

## Technical Highlights

- **SwiftUI & Combine:** The app is primarily built using SwiftUI for a clean, responsive UI, with a portion of functionality implemented in Combine (ImageLoader) to showcase its feasibility alongside modern async/await patterns.
- **Dependency Injection:** Utilizes Swinject for dependency injection, minimizing library dependencies and promoting modular, testable code architecture.
- **Unit Testing:** Comprehensive unit tests have been implemented to demonstrate how to proceed, the codebase is not enterily covered to keep the development of this demo app in a smaller range of time

## Additional Notes

This project emphasizes a minimal external dependency approach, focusing on native iOS development practices.

![homescreen](https://github.com/user-attachments/assets/ddb726f8-c783-4bd2-9f30-6b09d019bad6)

![dogpage](https://github.com/user-attachments/assets/c4147cf6-faaa-48cc-82bc-ac9fc8d46694)

![dark](https://github.com/user-attachments/assets/411bb542-e408-4848-823d-9b31a119789a)
