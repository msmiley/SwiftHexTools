# SwiftHexTools

Tools for working with hex in Swift. Useful when looking at raw buffers.

Includes extensions to the String class to provide convenient access to these functions. Note that the String extension are currently parameter-less and perform the default operation.

## Functions

### hexdump(_ bytes: [UInt8], offset: Int = 0, length: Int = 0, showInt: Bool = false) -> String

Returns a String with a hex-editor-like formatted rendering of the provided bytes. Includes an integer (0 to 255) of the bytes if showInt is set to true.

### hexstream(_ bytes: [UInt8], offset: Int = 0, length: Int = 0, delimiter: String = "")

Returns a String with a single-line representation of strings/bytes to hex with an optional delimiter.


## Examples

```swift
import SwiftHexTools

let x: [UInt8] = Array(0...255)
SwiftHexTools().hexdump(x)
```

```
00000  00 01 02 03 04 05 06 07  08 09 0A 0B 0C 0D 0E 0F  ........  ........
00016  10 11 12 13 14 15 16 17  18 19 1A 1B 1C 1D 1E 1F  ........  ........
00032  20 21 22 23 24 25 26 27  28 29 2A 2B 2C 2D 2E 2F  .!"#$%&'  ()*+,-./
00048  30 31 32 33 34 35 36 37  38 39 3A 3B 3C 3D 3E 3F  01234567  89:;<=>?
00064  40 41 42 43 44 45 46 47  48 49 4A 4B 4C 4D 4E 4F  @ABCDEFG  HIJKLMNO
00080  50 51 52 53 54 55 56 57  58 59 5A 5B 5C 5D 5E 5F  PQRSTUVW  XYZ[\]^_
00096  60 61 62 63 64 65 66 67  68 69 6A 6B 6C 6D 6E 6F  `abcdefg  hijklmno
00112  70 71 72 73 74 75 76 77  78 79 7A 7B 7C 7D 7E 7F  pqrstuvw  xyz{|}~.
00128  80 81 82 83 84 85 86 87  88 89 8A 8B 8C 8D 8E 8F  ........  ........
00144  90 91 92 93 94 95 96 97  98 99 9A 9B 9C 9D 9E 9F  ........  ........
00160  A0 A1 A2 A3 A4 A5 A6 A7  A8 A9 AA AB AC AD AE AF  ........  ........
00176  B0 B1 B2 B3 B4 B5 B6 B7  B8 B9 BA BB BC BD BE BF  ........  ........
00192  C0 C1 C2 C3 C4 C5 C6 C7  C8 C9 CA CB CC CD CE CF  ........  ........
00208  D0 D1 D2 D3 D4 D5 D6 D7  D8 D9 DA DB DC DD DE DF  ........  ........
00224  E0 E1 E2 E3 E4 E5 E6 E7  E8 E9 EA EB EC ED EE EF  ........  ........
00240  F0 F1 F2 F3 F4 F5 F6 F7  F8 F9 FA FB FC FD FE FF  ........  ........
```

```swift
import SwiftHexTools

let x: [UInt8] = Array(0...255)
SwiftHexTools().hexstream(x, offset: 0, length: 16, delimiter: " ")
```

```
00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
```


## License

[ISC License](https://en.wikipedia.org/wiki/ISC_license)

Copyright (c) 2016, Mike Smiley <msmiley@alumni.rice.edu>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
