//
//  FlagViewModel.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 30/10/23.
//

import Foundation
import Combine


class FlagViewModel: ObservableObject {
    
    @Published var flagsPublisher: [Flag] = []
    @Published var selectedFlagPublisher: Flag
    
    private var flags:[Flag] = [
        Flag(nameFlag: "gay", imageFlag: "🏳️‍🌈", ladaNumber: 00),
        Flag(nameFlag: "Argentina", imageFlag: "🇦🇷", ladaNumber: 54),
        Flag(nameFlag: "México", imageFlag: "🇲🇽", ladaNumber: 55),
        Flag(nameFlag: "Estados Unidos", imageFlag: "🇺🇸", ladaNumber: 222),
        Flag(nameFlag: "Colombia", imageFlag: "🇨🇴", ladaNumber: 88),
        Flag(nameFlag: "Canada", imageFlag: "🇨🇦", ladaNumber: 895),
        Flag(nameFlag: "Francia", imageFlag: "🇫🇷", ladaNumber: 332),
        Flag(nameFlag: "Alemania", imageFlag: "🇩🇪", ladaNumber: 056),
        Flag(nameFlag: "Rusia", imageFlag: "🇷🇺", ladaNumber: 96),
        Flag(nameFlag: "Suiza", imageFlag: "🇨🇭", ladaNumber: 112),
        Flag(nameFlag: "Corea", imageFlag: "🇰🇷", ladaNumber: 36),
        Flag(nameFlag: "Japon", imageFlag: "🇯🇵", ladaNumber: 104),
        Flag(nameFlag: "Inglaterra", imageFlag: "🇬🇧", ladaNumber: 21),
        Flag(nameFlag: "Brasil", imageFlag: "🇧🇷", ladaNumber: 513),
        Flag(nameFlag: "Italia", imageFlag: "🇮🇪", ladaNumber: 23),
        Flag(nameFlag: "Australia", imageFlag: "🇻🇬", ladaNumber: 12)
    ]
    
    init () {
        flagsPublisher = flags
        selectedFlagPublisher = Flag(nameFlag: "México", imageFlag: "🇸🇳", ladaNumber: 55)
    }
    
    func setFlag(word: String) -> Void {
        
        if word == "" {
            flagsPublisher = flags
        } else {
            var arrayFlag: [Flag] = []
            
            
            for flag in flags {
                if flag.nameFlag.lowercased().contains(word.lowercased()) {
                    arrayFlag.append(flag)
                }
            }
            flagsPublisher = arrayFlag
        }
    }
}
