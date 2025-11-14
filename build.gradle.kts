plugins {
    id("java")
    id("org.jetbrains.intellij") version "1.17.4"
}

group = "com.codestackr"
version = "1.1.0"

repositories {
    mavenCentral()
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

intellij {
    version.set("2023.2")
    type.set("IC")
    plugins.set(listOf())
}

tasks {
    buildSearchableOptions {
        enabled = false
    }
    patchPluginXml {
        sinceBuild.set("232")
        untilBuild.set("")
    }

    signPlugin {
        certificateChain.set(System.getenv("CERTIFICATE_CHAIN"))
        privateKey.set(System.getenv("PRIVATE_KEY"))
        password.set(System.getenv("PRIVATE_KEY_PASSWORD"))
    }

    publishPlugin {
        token.set(System.getenv("PUBLISH_TOKEN"))
    }

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
