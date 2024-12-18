#  Mercedez Benz Coding Challenge: GitHub Users App

### by: Alexander Jackson

## Overview

This iOS application allows users to:
    1. View list of GitHub Users fetched from GitHub REST API.
    2. Tap on any user to navigate to profile screen showing user information.
        * Note: if error occurs when profile is fetched, error view will be presented instead. *

## App Features

### Screen 1: List of GitHub Users
    - Fetches and displays a list of GitHub users from the endpoint:
        * Endpoint: https://api.github.com/users *
    - Each list entry shows user information
        - username
        - avartar thumbnail
    - When a user taps on entry, the app navigates to the user profile screen with further details on user.
    
### Screen 2: GitHub User Profile
    - Displays specific details of the selected user fetched from:
        * Endpoint: https://api.github.com/users/{USER_ID} *
    
    - The displayed user profile information:
        - Name
        - Profile Image
        - User Bio
        - Public Repositories Count
        - Followers & Folllowing Count
    * User Profile Information is Read-only *

## Technical Requirements

    - Minimum iOS Verison: 15.0
        - * Requested iOS version 14.0, due to the latset stable release (Xcode 16.2) the Xcode application only allows for minimum version iOS 15.0 *
    - Language: * Swift *
    - UIFramework: * UIKit *
    - Architecture: * MVVM (Model-View-ViewModel) *
    - Error Handling: * Comprehensive error handling for network requests and edge cases. *
    - Unit Testing: * Ensures reliability and test coverage. *
    - Code Style: * Clean, maintainable code with SOLID principles and coding best practices *
    
## Project Structure

#### MercedesBenzCodingChallenge
| Folder Names  | Purpose|
| ------------- |:-------------:|
| AppDelegate   | AppDelegate, SceneDelegate, and entry point |
| ImageStorage  | Image service to download, storage & cache images. |
| Model         | Data models for GitHub users & profile |
| Network       |API client and network layer|
| Repository                       | API client specific to user & profile|
| Resources                        | Images, assets, and constants|
| Views                            |UIKit views for UI components|
| Views/Controllers                | ViewControllers for screens|
| ViewModels                       | Business logic and network handling|
| MercedesBenzCodingChallengeTests | Unit tests for ViewModels and Networking|

## Key Components
    1. Networking Layer
        - Uses URLSession for API calls.
        - Handles response parsing and error scenarios gracefully.
        
    2. MVVM Architecture
        - Models: Data structures for the GitHub API.
        - ViewModels: Business logic and API requests.
        - Views: UI components managed programmatically.
        
    3. Screens
        - Screen1 (User List):
        - UITableView to display users.
        - Screen2 (User Profile):
        - UIImageView for avatars.
        - UILabel for textual user details.
        
    4. Error Handling
        - Displays user-friendly alerts for:
        - Network errors
        - API failures
        - Empty or invalid data
