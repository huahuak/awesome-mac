//
//  Airpods.swift
//  ohmymac
//
//  Created by Hua on 2025/1/8.
//

import Foundation
import CoreAudio
import AudioToolbox
import ISSoundAdditions

func startAirpodsService() {
    registerDefaultAudioDeviceChangeListener()
}

func audioDeviceChanged(
    objectID: AudioObjectID,
    numberOfAddresses: UInt32,
    addresses: UnsafePointer<AudioObjectPropertyAddress>,
    context: UnsafeMutableRawPointer?
) -> OSStatus {
    print("Audio device changed")
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
        do {
            if try Sound.output.readVolume() > 0.25 {
                try Sound.output.setVolume(0.25)
                notify(msg: "Reset Volume")
            }
        } catch {
            debugNotify(msg: "Sound control exception!")
        }
    }
    return noErr
}

private func registerDefaultAudioDeviceChangeListener() {
    var defaultDevicePropertyAddress = AudioObjectPropertyAddress(
        mSelector: kAudioHardwarePropertyDefaultOutputDevice,
        mScope: kAudioObjectPropertyScopeGlobal,
        mElement: kAudioObjectPropertyElementMain
    )
    
    let audioObjectID = AudioObjectID(kAudioObjectSystemObject)
    
    let status = AudioObjectAddPropertyListener(
        audioObjectID,
        &defaultDevicePropertyAddress,
        audioDeviceChanged,
        nil
    )
    
    if status == noErr {
        print("Listener registered successfully")
    } else {
        print("Failed to register listener: \(status)")
    }
}

private func removeDefaultAudioDeviceChangeListener() {
    var defaultDevicePropertyAddress = AudioObjectPropertyAddress(
        mSelector: kAudioHardwarePropertyDefaultOutputDevice,
        mScope: kAudioObjectPropertyScopeGlobal,
        mElement: kAudioObjectPropertyElementMain
    )
    
    let audioObjectID = AudioObjectID(kAudioObjectSystemObject)
    
    let status = AudioObjectRemovePropertyListener(
        audioObjectID,
        &defaultDevicePropertyAddress,
        audioDeviceChanged,
        nil
    )
    
    if status == noErr {
        print("Listener removed successfully")
    } else {
        print("Failed to remove listener: \(status)")
    }
}
