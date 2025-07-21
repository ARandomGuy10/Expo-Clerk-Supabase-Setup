# Expo Clerk Supabase Starter

A clean starter template for building mobile applications with Expo, Clerk for authentication, and Supabase as the backend.

## Features

- 🔐 **Clerk Authentication** - Seamless user authentication and management
- 🚀 **Supabase Integration** - Real-time database and backend services
- 📱 **Expo Router** - File-based routing for your React Native app
- ⚡ **TypeScript** - Type-safe code for better developer experience
- 🔄 **Environment Variables** - Easy configuration management

## Prerequisites

- Node.js (v18 or later)
- npm or yarn
- Expo CLI (`npm install -g expo-cli`)
- Expo Go app (for testing on physical devices)
- Supabase account
- Clerk account

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/ARandomGuy10/Expo-Clerk-Supabase-Setup.git
   cd Expo-Clerk-Supabase-Setup
   ```

2. **Install dependencies**
   ```bash
   npm install
   # or
   yarn
   ```

3. **Set up environment variables**
   Create a `.env` file in the root directory with the following variables:
   ```
   EXPO_PUBLIC_CLERK_PUBLISHABLE_KEY=your_clerk_publishable_key
   EXPO_PUBLIC_SUPABASE_URL=your_supabase_project_url
   EXPO_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

4. **Set up Supabase**
   - Create a new project in Supabase
   - Run the SQL migration from `supabase/migrations/20250101000000_initial_schema.sql` in the SQL editor
   - Go to Authentication > URL Configuration and add your app's redirect URLs

5. **Set up Clerk**
   - Create a new application in Clerk
   - Configure the redirect URLs in the Clerk dashboard
   - Add your Clerk publishable key to the `.env` file

6. **Start the development server**
   ```bash
   npx expo start
   ```

## Project Structure

```
.
├── app/                    # App routes using Expo Router
├── assets/                 # Static assets (images, fonts, etc.)
├── hooks/                  # Custom React hooks
├── supabase/               # Supabase configuration and migrations
│   └── migrations/         # Database migrations
├── utils/                  # Utility functions and helpers
├── .env                    # Environment variables
├── app.json                # Expo configuration
└── package.json            # Project dependencies and scripts
```

## Available Scripts

- `npm start` - Start the development server
- `npm run android` - Run on Android device/emulator
- `npm run ios` - Run on iOS simulator (macOS only)
- `npm run web` - Run on web browser

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Expo](https://expo.dev/)
- [Clerk](https://clerk.com/)
- [Supabase](https://supabase.com/)
