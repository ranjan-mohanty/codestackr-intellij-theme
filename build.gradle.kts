plugins {
    id("java")
    id("org.jetbrains.intellij.platform") version "2.10.4"
}

group = "com.codestackr"
version = "1.3.0"

repositories {
    mavenCentral()
    intellijPlatform {
        defaultRepositories()
    }
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(21))
    }
}

dependencies {
    intellijPlatform {
        intellijIdeaCommunity("2024.3")
    }
}

intellijPlatform {
    buildSearchableOptions = false
    
    pluginConfiguration {
        ideaVersion {
            sinceBuild = "193"
            untilBuild = provider { null }
        }
    }
    
    // Configure basic verification with current build platform only (fast)
    // Comprehensive testing across multiple versions happens in CI on tag push
    pluginVerification {
        ides {
            // Only verify against the version we're building with
            create("IC", "2024.3")
        }
    }
    
    signing {
        certificateChain = providers.environmentVariable("CERTIFICATE_CHAIN")
        privateKey = providers.environmentVariable("PRIVATE_KEY")
        password = providers.environmentVariable("PRIVATE_KEY_PASSWORD")
    }
    
    publishing {
        token = providers.environmentVariable("PUBLISH_TOKEN")
    }
}

// Configure IDE versions for compatibility testing
// This is only used when explicitly running verifyPlugin with IDE downloads
val compatibilityIdeVersions = listOf(
    "2019.3", "2020.3", "2021.3", "2022.3", "2023.3"
)

tasks {
    // verifyPlugin task - by default just verifies structure (no IDEs)
    // For compatibility testing, IDEs are configured via the workflow
    
    register<Exec>("format") {
        group = "formatting"
        description = "Format markdown files"
        commandLine("sh", "scripts/format.sh")
    }
    
    register<Exec>("verify") {
        group = "verification"
        description = "Verify plugin and run checks"
        dependsOn("verifyPlugin")
        commandLine("sh", "scripts/verify.sh")
    }
}
