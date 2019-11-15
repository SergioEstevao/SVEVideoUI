# SVEVideoUI

SVEVideoUI is an iOS SwiftUI view that diplays videos.

![Screenshot](screenshots_1.jpg "Screenshot")

## Installation

SVEVideoUI is available through [Swift Package Manager](https://swift.org/package-manager/). To install
it, simply add the following line to your `Package.swit`:
```
dependencies: [
    .package(url: "https://github.com/SergioEstevao/SVEVideoUI.git", from: "0.1")
]
```
## Usage

To use the video player do the following:

### Import header

```` swift
import SVEVideoUI
````

### Create and present the view

```` swift
let videoURL = Bundle.main.url(forResource: "video", withExtension: "mp4")
let videoView = VideoPlayerView(videoURL: videoURL)
view.addSubview(videoView)
videoView.play()
````


### Sample Project

To run the example project, clone the repo, and open the `SVEVideoUI.xcproject` file

## Requirements

 * AVFoundation
 * XCode 11 or above
 * iOS 11 or above

## Contributing

Read our [Contributing Guide](CONTRIBUTING.md) to learn about reporting issues, contributing code, and more ways to contribute.

## Getting in Touch

If you have questions about getting setup or just want to say hi, just drop an issue on Github with your request.

## Author

[Sérgio Estêvão](https://sergioestevao.com)

## License

SVEVideoUI is available under the MIT license. See the [LICENSE file](./LICENSE.md) for more info.

