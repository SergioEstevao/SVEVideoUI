import SwiftUI
import SVEVideoUI
import AVFoundation

struct VideoPlayerView: View {
    @State var videoURL = Bundle.main.url(forResource: "video", withExtension: "mp4")!
    @State var showsControls = true
    @State var videoGravity = AVLayerVideoGravity.resizeAspect
    @State var loop = false
    @State var isMuted = true
    @State var isPlaying = true
    
    var body: some View {
        ScrollView {
            VStack() {
                Video(url: videoURL)
                    .isPlaying($isPlaying)
                    .isMuted($isMuted)
                    .playbackControls(showsControls)
                    .loop($loop)
                    .videoGravity(videoGravity)
                    .frame(width: nil, height: CGFloat(exactly:300), alignment: .center)
                Group() {
                    Toggle(isOn: $showsControls ) {
                        Text("Show Controls")
                    }
                    Toggle(isOn: $loop ) {
                        Text("Loop")
                    }
                    Toggle(isOn: $isMuted ) {
                        Text("Muted")
                    }
                    Toggle(isOn: $isPlaying ) {
                        Text("Is Playing")
                    }
                    Picker("Video Gravity", selection: $videoGravity) {
                        Text(AVLayerVideoGravity.resizeAspect.rawValue.replacingOccurrences(of: "AVLayerVideoGravity", with: "")).tag(AVLayerVideoGravity.resizeAspect)
                        Text(AVLayerVideoGravity.resize.rawValue.replacingOccurrences(of: "AVLayerVideoGravity", with: "")).tag(AVLayerVideoGravity.resize)
                        Text(AVLayerVideoGravity.resizeAspectFill.rawValue.replacingOccurrences(of: "AVLayerVideoGravity", with: "")).tag(AVLayerVideoGravity.resizeAspectFill)
                    }.pickerStyle(SegmentedPickerStyle())
                }.padding(.horizontal)
            }
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
