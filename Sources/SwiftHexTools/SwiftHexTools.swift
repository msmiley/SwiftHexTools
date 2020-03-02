import Foundation

///
/// Extensions to native String type
///
public extension String {
  ///
  /// Render String as hexdump
  ///
  var hexdump: String {
    return SwiftHexTools.hexdump([UInt8](self.utf8))
  }

  ///
  /// Render String as hexstream
  ///
  var hexstream: String {
    return SwiftHexTools.hexstream([UInt8](self.utf8))
  }
  
}

///
/// Extensions to native Int type
///
public extension Int {
  /// Convert Int to hex
  var hex: String {
    return String(self, radix: 16)
  }
}

///
/// Extensions to native UInt type
///
public extension UInt {
  /// Convert UInt to hex
  var hex: String {
    return String(self, radix: 16)
  }
}

//
// Struct implementing main library members
//
public struct SwiftHexTools {
  
  ///
  /// Hex-dump representation of the given array of bytes. Uses optional offset
  /// and length to subscript the array.
  ///
  /// - parameter bytes: the byte array
  /// - parameter offset: the offset into the array
  /// - parameter length: the length to render
  /// - parameter showInt: enables integer columns
  ///
  public static func hexdump(_ bytes: [UInt8], offset: Int = 0, length: Int = 0, showInt: Bool = false) -> String {
    var limit = length
    if length == 0 {
      limit = bytes.count
    }
    var dump = ""
    if bytes.count > 0 {
      for i in stride(from: 0, to: limit, by: 16) {
        dump += String(format: "%05d  ", offset + i)
        for j in 0...15 {
          if i+j < limit {
            dump += String(format: "%02X ", bytes[offset + i + j])
          } else {
            dump += "   "
          }
          if j == 7 {
            dump += " "
          }
        }
        
        dump += " "
        
        // char representation, use '.' in place of non-printables
        for j in 0...15 {
          if i+j < limit {
            let ch = bytes[offset + i + j]
            if ch > 32 && ch < 127 {
              dump += String(format: "%c", ch)
            } else {
              dump += "."
            }
          } else {
            dump += " "
          }
          if j == 7 {
            dump += "  "
          }
        }
        
        // optional int representation, (3 digit padded 0<=x<=255)
        if showInt {
          dump += "  "
          for j in 0...15 {
            if i+j < limit {
              let ch = bytes[offset + i + j]
              dump += String(format: "%03d", ch)
            } else {
              dump += "   "
            }
            if j < 15 {
              dump += " "
            }
            if j == 7 {
              dump += " "
            }
          }
        }

        dump += "\n"
      }
    }
    return dump
  }
  
  ///
  /// Renders a hex stream (two capital hex chars) of the specified input bytes.
  /// Optionally uses a provided string as a delimiter.
  ///
  /// - parameter bytes: the byte array
  /// - parameter offset: the offset into the array
  /// - parameter length: the length to render
  /// - parameter delimiter: the delimiter to use
  ///
  public static func hexstream(_ bytes: [UInt8], offset: Int = 0, length: Int = 0, delimiter: String = "") -> String {
    var limit = length
    if length == 0 {
      limit = bytes.count
    }
    var ret = ""
    if bytes.count > 0 {
      for i in offset..<(offset + limit) {
        ret += String(format: "%02X", bytes[i])
        if i < offset + limit - 1 {
          ret += delimiter
        }
      }
    }
    return ret
  }
  
}


