import XCTest
@testable import SwiftHexTools

class SwiftHexToolsTests: XCTestCase {
  
  func testHexDumpBasic() {
    let x: [UInt8] = Array(0...255)
    XCTAssertEqual(SwiftHexTools.hexdump(x),
      // note the following includes some escaped characters, namely \" and \\
      "00000  00 01 02 03 04 05 06 07  08 09 0A 0B 0C 0D 0E 0F  ........  ........\n" +
      "00016  10 11 12 13 14 15 16 17  18 19 1A 1B 1C 1D 1E 1F  ........  ........\n" +
      "00032  20 21 22 23 24 25 26 27  28 29 2A 2B 2C 2D 2E 2F  .!\"#$%&'  ()*+,-./\n" +
      "00048  30 31 32 33 34 35 36 37  38 39 3A 3B 3C 3D 3E 3F  01234567  89:;<=>?\n" +
      "00064  40 41 42 43 44 45 46 47  48 49 4A 4B 4C 4D 4E 4F  @ABCDEFG  HIJKLMNO\n" +
      "00080  50 51 52 53 54 55 56 57  58 59 5A 5B 5C 5D 5E 5F  PQRSTUVW  XYZ[\\]^_\n" +
      "00096  60 61 62 63 64 65 66 67  68 69 6A 6B 6C 6D 6E 6F  `abcdefg  hijklmno\n" +
      "00112  70 71 72 73 74 75 76 77  78 79 7A 7B 7C 7D 7E 7F  pqrstuvw  xyz{|}~.\n" +
      "00128  80 81 82 83 84 85 86 87  88 89 8A 8B 8C 8D 8E 8F  ........  ........\n" +
      "00144  90 91 92 93 94 95 96 97  98 99 9A 9B 9C 9D 9E 9F  ........  ........\n" +
      "00160  A0 A1 A2 A3 A4 A5 A6 A7  A8 A9 AA AB AC AD AE AF  ........  ........\n" +
      "00176  B0 B1 B2 B3 B4 B5 B6 B7  B8 B9 BA BB BC BD BE BF  ........  ........\n" +
      "00192  C0 C1 C2 C3 C4 C5 C6 C7  C8 C9 CA CB CC CD CE CF  ........  ........\n" +
      "00208  D0 D1 D2 D3 D4 D5 D6 D7  D8 D9 DA DB DC DD DE DF  ........  ........\n" +
      "00224  E0 E1 E2 E3 E4 E5 E6 E7  E8 E9 EA EB EC ED EE EF  ........  ........\n" +
      "00240  F0 F1 F2 F3 F4 F5 F6 F7  F8 F9 FA FB FC FD FE FF  ........  ........\n")
  }
  
  func testHexDumpWithLength() {
    let x: [UInt8] = Array(0...255)
    XCTAssertEqual(SwiftHexTools.hexdump(x, offset: 0, length: 16),
      "00000  00 01 02 03 04 05 06 07  08 09 0A 0B 0C 0D 0E 0F  ........  ........\n")
  }
  
  func testHexDumpWithOffsetAndLength() {
    let x: [UInt8] = Array(0...255)
    XCTAssertEqual(SwiftHexTools.hexdump(x, offset: 12, length: 16),
      "00012  0C 0D 0E 0F 10 11 12 13  14 15 16 17 18 19 1A 1B  ........  ........\n")
  }
  
  func testHexDumpWithShortLength() {
    let x: [UInt8] = Array(0...255)
    XCTAssertEqual(SwiftHexTools.hexdump(x, offset: 12, length: 3),
      "00012  0C 0D 0E                                          ...               \n")
  }

  func testHexDumpWithEmptyArray() {
    let x: [UInt8] = []
    XCTAssertEqual(SwiftHexTools.hexdump(x, offset: 12, length: 3), "")
  }
  
  func testHexDumpWithIntMultiline() {
    let x: [UInt8] = Array(0...255)
    XCTAssertEqual(SwiftHexTools.hexdump(x, length: 137, showInt: true),
      "00000  00 01 02 03 04 05 06 07  08 09 0A 0B 0C 0D 0E 0F  ........  ........  000 001 002 003 004 005 006 007  008 009 010 011 012 013 014 015\n" +
      "00016  10 11 12 13 14 15 16 17  18 19 1A 1B 1C 1D 1E 1F  ........  ........  016 017 018 019 020 021 022 023  024 025 026 027 028 029 030 031\n" +
      "00032  20 21 22 23 24 25 26 27  28 29 2A 2B 2C 2D 2E 2F  .!\"#$%&'  ()*+,-./  032 033 034 035 036 037 038 039  040 041 042 043 044 045 046 047\n" +
      "00048  30 31 32 33 34 35 36 37  38 39 3A 3B 3C 3D 3E 3F  01234567  89:;<=>?  048 049 050 051 052 053 054 055  056 057 058 059 060 061 062 063\n" +
      "00064  40 41 42 43 44 45 46 47  48 49 4A 4B 4C 4D 4E 4F  @ABCDEFG  HIJKLMNO  064 065 066 067 068 069 070 071  072 073 074 075 076 077 078 079\n" +
      "00080  50 51 52 53 54 55 56 57  58 59 5A 5B 5C 5D 5E 5F  PQRSTUVW  XYZ[\\]^_  080 081 082 083 084 085 086 087  088 089 090 091 092 093 094 095\n" +
      "00096  60 61 62 63 64 65 66 67  68 69 6A 6B 6C 6D 6E 6F  `abcdefg  hijklmno  096 097 098 099 100 101 102 103  104 105 106 107 108 109 110 111\n" +
      "00112  70 71 72 73 74 75 76 77  78 79 7A 7B 7C 7D 7E 7F  pqrstuvw  xyz{|}~.  112 113 114 115 116 117 118 119  120 121 122 123 124 125 126 127\n" +
      "00128  80 81 82 83 84 85 86 87  88                       ........  .         128 129 130 131 132 133 134 135  136                            \n")
  }
  
  func testHexStream() {
    let x: [UInt8] = Array(0...255)
    XCTAssertEqual(SwiftHexTools.hexstream(x, offset: 0, length: 16), "000102030405060708090A0B0C0D0E0F")
  }

  func testHexStreamWithDelimiter() {
    let x: [UInt8] = Array(0...255)
    XCTAssertEqual(SwiftHexTools.hexstream(x, offset: 0, length: 16, delimiter: ","), "00,01,02,03,04,05,06,07,08,09,0A,0B,0C,0D,0E,0F")
  }
  
  func testStringHexDumpExtension() {
    let x: String = "abcdefghijklmnopqrstuvwxyz1234567890"
    XCTAssertEqual(x.hexdump,
      "00000  61 62 63 64 65 66 67 68  69 6A 6B 6C 6D 6E 6F 70  abcdefgh  ijklmnop\n" +
      "00016  71 72 73 74 75 76 77 78  79 7A 31 32 33 34 35 36  qrstuvwx  yz123456\n" +
      "00032  37 38 39 30                                       7890              \n")
  }
  
  func testStringHexStreamExtension() {
    let x = "hello"
    XCTAssertEqual(x.hexstream, "68656C6C6F")
  }

  func testIntHexExtension() {
    let x: Int = 32
    XCTAssertEqual(x.hex, "20")
  }
  
  func testUIntHexExtension() {
    let x: UInt = 32
    XCTAssertEqual(x.hex, "20")
  }
}
