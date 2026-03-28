plugins {
    id("com.android.application")
    // id("kotlin-android")
    id("org.jetbrains.kotlin.android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.frontend"
    // compileSdk = flutter.compileSdkVersion
    compileSdk = 36

    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        // jvmTarget = JavaVersion.VERSION_11.toString()
        jvmTarget = "17"
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.frontend"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        // minSdk = flutter.minSdkVersion
        minSdk = flutter.minSdkVersion
        
        // targetSdk = flutter.targetSdkVersion
        targetSdk = 36
        // versionCode = flutter.versionCode
        versionCode = 1
        // versionName = flutter.versionName
        versionName = "1.0"
        multiDexEnabled = true
    }

    buildTypes {
        release {
          isShrinkResources = false
          isMinifyEnabled = false
            // proguardFiles(
            //     getDefaultProguardFile("proguard-android-optimize.txt"),
            //     "proguard-rules.pro")
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
dependencies {
    // implementation "org.jetbrains.kotlin:kotlin-stdlib:$kotlin_version"
    implementation("org.jetbrains.kotlin:kotlin-stdlib:1.9.22")

    // Flutter required libs
    implementation("androidx.core:core-ktx:1.12.0")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.10.0")

    // Camera (match pubspec)
    implementation("androidx.camera:camera-core:1.3.2")
    implementation("androidx.camera:camera-camera2:1.3.2")
    implementation("androidx.camera:camera-lifecycle:1.3.2")
}
