# SwiftyRegex

Regular Expression for Swift programming language.


## Samples

### is match

    "123456" =~ "^\\d+$" // true


### replace

    "aaa".sub("a", newStr: "2") // "2aa"


### replace all

    "aaa".gsub("a", newStr: "2") // "222"


### scan

    "(123) 456-7890".scan("\\d+") // ["123", "456", "7890"]


### split

    "aaa123bbb456ccc789ddd".split("\\d+") // ["aaa", "bbb", "ccc", "ddd"]


## Installation

### Carthage

Add the following to Carfile:

    github "tylerlong/SwiftyRegex"

Run the following command to install:

    carthage update --platform Mac


## License

MIT

Copyright © 2015 Tyler Long
