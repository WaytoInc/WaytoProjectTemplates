ext {
    V_CODE = "1"
    V_NAME = "1.0.0"
    schema = "${schema}"

    application_id = "${packageName}"
    plugin_name = "${packageName}"
}

apply from: allGradle.key

android {
    defaultConfig {
       buildConfigField "String", "CUSTOM_URL", '"http://116.7.249.34:17100/"'
//     buildConfigField "String", "CUSTOM_URL", '"https://xhsimapi.wayto.com.cn/"'

       buildConfigField "String", "MQTT_URL", '"tcp://xhsimapi.wayto.com.cn:1883"'
       buildConfigField "String", "MQTT_VISITOR", '"wxvisual/topic/rz/app"'

       buildConfigField "String", "MQTT_TELEPHONE", '"wxvisual/topic/user/"' //{userId}

       buildConfigField "String", "AGORA_APPID", '"960644f3218845e5aef0ab9166256473"'
       buildConfigField "String", "AGORA_APPCERT", '"9f944e8c86e0428fa413c22001b95d4c"'

       testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
    }

    productFlavors {
        //develop
        _dev {
            //buildConfigField "String", "CUSTOM_URL", '"http://api.dev.wayto.com.cn:8080/"'
        }
        //preview
        pre {
            //buildConfigField "String", "CUSTOM_URL", '"http://api.dev.wayto.com.cn:8080/"'
        }
        //apk
        apk {
            //buildConfigField "String", "CUSTOM_URL", '"http://47.107.208.147:38500/"'
        }
    }
    packagingOptions {
        exclude 'META-INF/LGPL2.1'
        exclude 'META-INF/LICENSE'
        exclude 'META-INF/NOTICE'
    }
}

dependencies {
    implementation project(allModule.plugin)
    implementation project(allModule.objectbox)
//    implementation project(allModule.Camera)
//    implementation project(allModule.agora)
//    implementation project(allModule.tesstwo)
//    implementation project(allModule.opencv)
//    implementation project(allModule.ex)
//    implementation project(allModule.mapbox)
//    implementation project(allModule.map)
//    implementation project(allModule.rcode)
//    implementation project(allModule.mqtt)
//    implementation project(allModule.websocket)

    testImplementation 'junit:junit:4.12'
    androidTestImplementation 'androidx.test.ext:junit:1.1.1'
    androidTestImplementation 'androidx.test.espresso:espresso-core:3.2.0'

//    //高版本需要AndroidX的支持
//    def lottieVersion = "3.1.0"
//    api("com.airbnb.android:lottie:$lottieVersion") {
//        exclude group: 'androidx.appcompat'
//        exclude group: 'androidx.annotation'
//    }
}

apply from: allGradle.plugin
apply from: allGradle.v7a
apply plugin: 'kotlin-kapt'
apply plugin: 'io.objectbox'

apply from: allGradle.makeDex
apply from: allGradle.excludeDex