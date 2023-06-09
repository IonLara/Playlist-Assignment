//
//  Song.swift
//  Assignment4
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

struct Song {
  enum Style: String {
    case pop, rock, alternative, rnb, hiphop, classical
  }
  // title of the song
  private(set) var title: String
  // artist of the song
  private(set) var artist: String
  // category of the song
  private(set) var category: Style
  // file size, stored in kilobytes
  private(set) var size: Int
  
  init(title: String, artist: String, category: Style, size: Int) {
    self.title = title
    self.artist = artist
    self.category = category
    self.size = size
  }
  
  mutating func setSong(title: String, artist: String, category: Style, size: Int) {
    self.title = title
    self.artist = artist
    self.category = category
    self.size = size
  }
}

extension Song: CustomStringConvertible {
  // Size should be printed in Megabytes (use 1000 kilobytes = 1 MB for this calculation), to 1 decimal place.
  // The category abbreviations used should be: Pop, Rock, Alt, Cls, HH, RnB
  // Example:       (35 spaces)                         (20 spaces)     (12 spaces)
  // | Title                               | Artist                   | Style       | Size (MB)
  var description: String {
      //Set the spaces after the words of each category to mantain same table size
      let titleSpace = String(repeating: " ", count: 35 - title.count)
      let artistSpace = String(repeating: " ", count: 20 - artist.count)
      //--------------------------------------------------------------------------
      //This sets the string used for each of the categories as well as the spaces after
      var catString = ""
      switch category {
      case .pop:
          catString = "Pop\(String(repeating: " ", count: 9))"
      case .rock:
          catString = "Rock\(String(repeating: " ", count: 8))"
      case .alternative:
          catString = "Alt\(String(repeating: " ", count: 9))"
      case .hiphop:
          catString = "HH\(String(repeating: " ", count: 10))"
      case .classical:
          catString = "Cls\(String(repeating: " ", count: 9))"
      case .rnb:
          catString = "RnB\(String(repeating: " ", count: 9))"
      }
      //Get the size of the song as a string with only one decimal
      let sizeString = String(format: "%.1f", Double(size) / 1000)
      //Give the description in a table like manner
    return "| \(title)\(titleSpace)| \(artist)\(artistSpace)| \(catString)| \(sizeString)"
  }
}
