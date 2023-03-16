//
//  main.swift
//  Playlist
//
//  Created by Ion Sebastian Rodriguez Lara on 15/03/23.
//

import Foundation

var running = true

menuLoop: while running {
    showMenu()
    if let input = readLine() {
        switch input.lowercased() {
        case "a": //Add song
            print("Add a new song to the playlist!")
        title: while true {
            print("Enter a new song's title:")
            if let titleInput = readLine() {
                
            } else {
                continue
            }
        }
        case "f":
            
        case "d":
            
        case "s":
            
        case "c":
            
        case "z":
            
        case "m":
            
        case "x":
            break
        default:
            print("Invalid Input. Try again.")
            continue
        }
    } else {
        print("Invalid Input. Try again.")
        continue
    }
}

func showMenu() {
    print("A: Add a song to the playlist")
    print("F: Find a song in the playlist")
    print("D: Delete a song from the playlist")
    print("S: Show the entire playlist")
    print("C: Category Summary")
    print("Z: Show playlist size")
    print("M: Show this menu")
    print("X: Exit the program")
    print("Enter your command from the menu:")
}
