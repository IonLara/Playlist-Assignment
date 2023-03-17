//
//  Playlist.swift
//  Assignment4
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

struct Playlist {
    private(set) var songs: [Song] = [] //The array holding the different songs
}

extension Playlist { //Altering playlist (Adding & Deleting)
    
    mutating func addSong(_ song: Song) { //A function that adds a new song
        songs.append(song)
    }
    
    mutating func deleteSong(_ title: String) -> Bool { //Look for a song with specific title and delete it from array
        for i in 0..<songs.count { //Check all songs
            if songs[i].title.lowercased() == title.lowercased() { //Delete the song if found
                songs.remove(at: i)
                return true //Return that deletion was succesful
            }
        }
        return false //Return false if no song was found
    }
}

extension Playlist { //Functions to display the playlists
    
    func showPlaylist() { //Show all the songs in the playlist in order of first added
        display(songs)
    }
    
    func showByCat(_ cat: Song.Style) { //Show all the songs in a specific category
        var songsInCat: [Song] = [] //Temporary array to hold the songs in category
        var genreString = "" //String used for the header of display
        
        for song in songs { //Search all songs and add the ones that match the category
            if song.category == cat {
                songsInCat.append(song)
            }
        }
        
        switch cat { //Switch to define the name of the genre for header
        case .pop:
            genreString = "Pop"
        case .rock:
            genreString = "Rock"
        case .alternative:
            genreString = "Alternative"
        case .rnb:
            genreString = "RnB"
        case .hiphop:
            genreString = "HipHop"
        case .classical:
            genreString = "Classical"
        }
        //Print header
        print("\(genreString) songs:")
        //Show songs found
        display(songsInCat)
    }
}

extension Playlist { //Information based functions (Finding & Checking size)
    
    func findSongs(_ text: String) -> (byTitle: [Song], byArtist: [Song]) { //Find songs with matching titles and artist names
        var titles: [Song] = [] //Array for songs that matched title
        var artists: [Song] = [] //Array for songs that matched artist name
        
        for song in songs { //Search by title
            if song.title.lowercased().contains(text.lowercased()) {
                titles.append(song) //Add matching songs
            }
        }
        
        for song in songs {  //Search by artist
            if song.artist.lowercased().contains(text.lowercased()) {
                artists.append(song) //Add matching songs
            }
        }
        return (titles, artists) //Return both arrays
    }
    
    func checkSize() { //Check total size used by songs in KB
        var size = 0 //Initialize the variable that we'll return
        for song in songs {
            size += song.size //Add size of each song
        }
        print("Total size: \(size) KB")
        print()
    }
}

extension Playlist { //Extra function to help with main methods
    
    func display(_ list: [Song]) { //Function that displays all the songs in given array in a table like manner
        var count = 0 //How many songs are there
        var size = 0.0 //Total size used in MB
        let line = String(repeating: "-", count: 86) //String for the line dividers of table
        
        print(line)
        print("| Title                              | Artist              | Style       | Size (MB)") //Header
        print(line)
        
        for song in list { //Print all the songs in array given and add them to count and their size
            print(song)
            count += 1
            size += ((Double(song.size) / 1000) * 10).rounded() / 10 //Add sizes rounded
        }
        
        let sizeString = String(format: "%.1f", size) //Format size as a string with only one decimal
        
        print(line)
        print("Total: \(count) songs in the playlist.")
        print("Size: \(sizeString) MB.")
        print()
    }
}
