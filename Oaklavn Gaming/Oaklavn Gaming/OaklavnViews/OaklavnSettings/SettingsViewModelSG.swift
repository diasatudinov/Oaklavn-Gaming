//
//  SettingsViewModelSG.swift
//  Oaklavn Gaming
//
//  Created by Dias Atudinov on 08.05.2025.
//


import SwiftUI

class SettingsViewModelSG: ObservableObject {
    @AppStorage("musicEnabled") var musicEnabled: Bool = true
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
    @AppStorage("vibraEnabled") var vibraEnabled: Bool = true
}