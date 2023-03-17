//
//  main.swift
//  Playlist
//
//  Created by Ion Sebastian Rodriguez Lara on 15/03/23.
//

import Foundation

var running = true
var playlist = Playlist()
menuLoop: while running {
    showMenu()
    if let input = readLine() {
        switch input.lowercased() {
        case "a": //Add song
            print("Add a new song to the playlist!")
            var newTitle = ""
            var newArtist = ""
            var newCat: Song.Style = .pop
            var newSize = 0
        title: while true {
            print("Enter a new song's title:")
            if let titleInput = readLine() {
                newTitle = titleInput
                break
            }
            print("Invalid title. Please re-enter:")
        }
        artist: while true {
            print("Enter a new song's artist:")
            if let artistInput = readLine() {
                newArtist = artistInput
                break
            }
            print("Invalid artist. Please re-enter:")
        }
        category: while true {
            print("Enter a new song's category (P: Pop, R: Rock, A: Alternative, B: RnB, H: Hiphop, C: Classical)")
            if let categoryInput = readLine() {
                switch categoryInput.lowercased() {
                case "p":
                    newCat = .pop
                    break category
                case "r":
                    newCat = .rock
                    break category
                case "a":
                    newCat = .alternative
                    break category
                case "b":
                    newCat = .rnb
                    break category
                case "h":
                    newCat = .hiphop
                    break category
                case "c":
                    newCat = .classical
                    break category
                default :
                    print("Invalid category. Please re-enter:")
                }
            }
        }
        size: while true {
            print("Enter a new song's size:")
            if let sizeInput = readLine() {
                if let sizeInt = Int(sizeInput) {
                    newSize = sizeInt
                    break
                }
                print("Invalid size. Please re-enter:")
            } else {
                print("Invalid size. Please re-enter:")
            }
        }
            playlist.addSong(Song(title: newTitle, artist: newArtist, category: newCat, size: newSize))
            print()
            continue
        case "f":
            print("Find a song in the playlist!")
            while true {
                print("Enter your search Keyword:")
                if let searchInput = readLine() {
                    let songs: ([Song], [Song]) = playlist.findSongs(searchInput)
                    print("=== Matched Titles ===")
                    for song in songs.0 {
                        print(song)
                    }
                    print("=== \(songs.0.count) matches ===")
                    print("=== Matched Artists ===")
                    for song in songs.1 {
                        print(song)
                    }
                    print("=== \(songs.1.count) matches ===")
                    print()
                    break
                }
                print("Invalid Input. Please re-enter:")
            }
        case "d":
            print("Delete a song from the playlist!")
            while true {
                print("Enter the title of the song you want to remove from your playlist:")
                if let deleteInput = readLine() {
                    let done = playlist.deleteSong(deleteInput)
                    if done {
                        print("Successfully removed the song from the playlist.")
                        print()
                        break
                    } else {
                        print("No song found with title: \(deleteInput).")
                        print()
                        break
                    }
                }
                print("Invalid Input. Please re-enter:")
            }
        case "s":
            print("Show the entire playlist!")
            playlist.showPlaylist()
        case "c":
            print("Show by category!")
            var cat = Song.Style.pop
        cat: while true {
                print("Enter a category to display: (P: Pop, R: Rock, A: Alternative, B: RnB, H: Hiphop, C: Classical)")
                if let catInput = readLine() {
                    switch catInput.lowercased() {
                    case "p":
                        cat = .pop
                        break cat
                    case "r":
                        cat = .rock
                        break cat
                    case "a":
                        cat = .alternative
                        break cat
                    case "b":
                        cat = .rnb
                        break cat
                    case "h":
                        cat = .hiphop
                        break cat
                    case "c":
                        cat = .classical
                        break cat
                    default:
                        print("Invalid categroy. Please re-enter:")
                    }
                }
            }
            playlist.showByCat(cat)
        case "z":
            print("Show playlist size!")
            playlist.checkSize()
        case "m":
            print("Show this menu!")
            continue
        case "x":
            break menuLoop
        default:
            print("Invalid Input. Please re-enter:")
            continue
        }
    } else {
        print("Invalid Input. Please re-enter:")
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
