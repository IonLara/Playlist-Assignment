//
//  main.swift
//  Playlist
//
//  Created by Ion Sebastian Rodriguez Lara on 15/03/23.
//

import Foundation

print("Hello, World!")

var song = Song(title: "Waa", artist: "Wham", category: .pop, size: 3800)
var song2 = Song(title: "Love me", artist: "Lolololo", category: .hiphop, size: 5000)

var pl = Playlist()
pl.addSong(song)
pl.addSong(song2)
pl.showPlaylist()
