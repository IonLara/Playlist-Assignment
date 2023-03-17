//
//  Playlist.swift
//  Assignment4
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

struct Playlist {
    private(set) var songs: [Song] = []
    
    mutating func addSong(_ song: Song) {
        songs.append(song)
    }
    
    func findSongs(_ text: String) -> (byTitle: [Song], byArtist: [Song]) {
        var titles: [Song] = []
        var artists: [Song] = []
        
        for song in songs { //Search by title
            if song.title.lowercased().contains(text.lowercased()) {
                titles.append(song)
            }
        }
        
        for song in songs {  //Search by artist
            if song.artist.lowercased().contains(text.lowercased()) {
                artists.append(song)
            }
        }
        return (titles, artists)
    }
    
    mutating func deleteSong(_ title: String) -> Bool {
        for i in 0..<songs.count {
            if songs[i].title.lowercased() == title.lowercased() {
                songs.remove(at: i)
                return true
            }
        }
        return false
    }
    
    func showPlaylist() { //92 spaces total
        display(songs)
    }
    
    func showByCat(_ cat: Song.Style) {
        var songsInCat: [Song] = []
        var genreString = ""
        for song in songs {
            if song.category == cat {
                songsInCat.append(song)
            }
        }
        switch cat {
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
        print("\(genreString) songs:")
        display(songsInCat)
    }
    
    func checkSize() {
        var size = 0
        for song in songs {
            size += song.size
        }
        print("Total size: \(size) KB")
        print()
    }
    
    func display(_ list: [Song]) {
        var count = 0
        var size = 0.0
        
        let line = String(repeating: "-", count: 86)
        print(line)
        print("| Title                              | Artist              | Style       | Size (MB)")
        print(line)
        for song in list {
            print(song)
            count += 1
            size += ((Double(song.size) / 1000) * 10).rounded() / 10
        }
        let sizeString = String(format: "%.1f", size)
        print(line)
        print("Total: \(count) songs in the playlist.")
        print("Size: \(sizeString) MB.")
        print()
    }
}
