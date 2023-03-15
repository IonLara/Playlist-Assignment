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
        var count = 0
        var size = 0.0
        
        let line = String(repeating: "-", count: 86)
        print(line)
        print("| Title                              | Artist              | Style       | Size (MB)")
        print(line)
        for song in songs {
            print(song)
            count += 1
            size += Double(song.size) / 1000
        }
        print(line)
        print("Total: \(count) songs in the playlist.")
        print("Size: \(size) MB.")
    }
}
