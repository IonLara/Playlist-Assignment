//
//  main.swift
//  Playlist
//
//  Created by Ion Sebastian Rodriguez Lara on 15/03/23.
//

import Foundation

var playlist = Playlist() //The playlist instance used for program

menuLoop: while true { //The main loop that shows the menu and handles all the logic
    showMenu()
    
    if let input = readLine() { //Get and unwrap the user input choosing activity
        //Use a switch to run logic depending on the chosen option
        switch input.lowercased() {
        //Add a new song
        case "a":
            print("Add a new song to the playlist!")
            //Initialize variables for new song
            var newTitle = ""
            var newArtist = ""
            var newCat: Song.Style = .pop
            var newSize = 0
            //---------------------------------
        title: while true { //Get and unwrap input for the title of new song
            print("Enter a new song's title:")
            if let titleInput = readLine() {
                newTitle = titleInput
                break
            }
            print("Invalid title. Please re-enter:")
        }
        artist: while true { //Get and unwrap input for the artist name of new song
            print("Enter a new song's artist:")
            if let artistInput = readLine() {
                newArtist = artistInput
                break
            }
            print("Invalid artist. Please re-enter:")
        }
        category: while true { //Get input for new song's category and unwrap it
            print("Enter a new song's category (P: Pop, R: Rock, A: Alternative, B: RnB, H: Hiphop, C: Classical)")
            if let categoryInput = readLine() {
                switch categoryInput.lowercased() { //Switch to set categry based on user input
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
        size: while true { //Get and unwrap input for the size of new song
            print("Enter a new song's size:")
            if let sizeInput = readLine() { //Unwrap it
                if let sizeInt = Int(sizeInput) { //Check it's a valid Int
                    newSize = sizeInt
                    break
                }
                print("Invalid size. Please re-enter:")
            } else {
                print("Invalid size. Please re-enter:")
            }
        }
            //Add a song with received values
            playlist.addSong(Song(title: newTitle, artist: newArtist, category: newCat, size: newSize))
            print()
            continue
        //Find a song in the playlist
        case "f":
            print("Find a song in the playlist!")
            while true {
                print("Enter your search Keyword:")
                if let searchInput = readLine() { //Get and unwrap the search word(s)
                    //Variable to store songs mathching in title and songs matching in artist name
                    let songs: ([Song], [Song]) = playlist.findSongs(searchInput)
                    //Print songs with matching titles
                    print("=== Matched Titles ===")
                    for song in songs.0 {
                        print(song)
                    }
                    print("=== \(songs.0.count) matches ===")
                    //Print songs with matching artists
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
        //Delete a song in the playlist
        case "d":
            print("Delete a song from the playlist!")
            while true {
                print("Enter the title of the song you want to remove from your playlist:")
                if let deleteInput = readLine() { //Get and unwrap input
                    let done = playlist.deleteSong(deleteInput) //Try to delete song and save if succesfully done so
                    if done { //If a song was found and deleted
                        print("Successfully removed the song from the playlist.")
                        print()
                        break
                    } else { //If no songs matched the title given
                        print("No song found with title: \(deleteInput).")
                        print()
                        break
                    }
                }
                print("Invalid Input. Please re-enter:")
            }
        //Show all songs in playlist
        case "s":
            print("Show the entire playlist!")
            playlist.showPlaylist()
        //Show all songs in chosen category
        case "c":
            print("Show by category!")
            var cat = Song.Style.pop
        cat: while true { //Get input for category
                print("Enter a category to display: (P: Pop, R: Rock, A: Alternative, B: RnB, H: Hiphop, C: Classical)")
                if let catInput = readLine() { //Unwrap the input
                    switch catInput.lowercased() { //Set the category used based on user input
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
            playlist.showByCat(cat) //Display the songs in given category
        //Show the total space used by songs
        case "z":
            print("Show playlist size!")
            playlist.checkSize()
        //Show the menu again
        case "m":
            print("Show this menu!")
            continue
        //Exit the program
        case "x":
            break menuLoop
        //In case of invalid input when choosing activities
        default:
            print("Invalid Input. Please re-enter:")
            continue
        }
    } else { //In case that user provides invalid input
        print("Invalid Input. Please re-enter:")
        continue
    }
}

func showMenu() { //Function to show all the menu items
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
