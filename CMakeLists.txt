cmake_minimum_required(VERSION 3.15) 

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED 17)

project(juceaudio VERSION 0.1.0)

add_subdirectory(JUCE)

# If you don't add company name then in DAW it probably won't be listed correctly
juce_add_plugin(JuceAudioPlugin
    PLUGIN_MANUFACTURER_CODE Dshr 
    PLUGIN_CODE Dem0 
    FORMATS VST3 Standalone 
    COMPANY_NAME "bsnacks000"
    PRODUCT_NAME "JuceAudioPlugin"
)

target_sources(JuceAudioPlugin
    PRIVATE 
        PluginEditor.cpp 
        PluginProcessor.cpp 
)

target_compile_definitions(JuceAudioPlugin
    PUBLIC 
        JUCE_WEB_BROWSER=0
        JUCE_USE_CURL=0 
        JUCE_VST3_CAN_REPLACE_VST2=0
)

# juce_add_binary_data(JuceAudioPluginData SOURCES ...)

target_link_libraries(JuceAudioPlugin 
    PRIVATE 
        # JuceAudioPluginData
        juce::juce_audio_utils 
    PUBLIC 
        juce::juce_recommended_config_flags 
        juce::juce_recommended_lto_flags 
        juce::juce_recommended_warning_flags
)