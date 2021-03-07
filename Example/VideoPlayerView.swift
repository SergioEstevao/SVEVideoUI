import SwiftUI
import SVEVideoUI
import AVFoundation

struct VideoPlayerView: View {
    
    struct Constants {
        static let backAndForwardSeconds =  10.0
    }
    
    @State var videoURL = Bundle.main.url(forResource: "video", withExtension: "mp4")
        
    @State var showsControls = true
    @State var videoGravity = AVLayerVideoGravity.resizeAspect
    @State var loop = false
    @State var isMuted = true
    @State var isPlaying = true
    
    @State var startVideoSeconds:Double = 5.0
    
    @State var backInSeconds:Double = 0.0
    @State var forwardInSeconds:Double = 0.0
    
    var body: some View {
        ScrollView {
            VStack() {
                
                let videoURL2 = URL(string: "http://nickernet-mbp1.local:3000/static/thingsAbove/6C7FDFED-59C9-4838-9D93-4B2B2D42BE21/session_1_.mp4")
                
                if let videoURL = videoURL2 {
                                        
                    Video(url: videoURL, startVideoAtSeconds: $startVideoSeconds)
                        .isPlaying($isPlaying)
                        .isMuted($isMuted)
                        .playbackControls(showsControls)
                        .loop($loop)
                        .videoGravity(videoGravity)
                        .backInSeconds($backInSeconds)
                        .forwardInSeconds($forwardInSeconds)
                        .frame(width: nil, height: CGFloat(exactly:300), alignment: .center)
                }
                
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
                    
                    HStack {
                        Button(action: {
                            print("Back pressed")
                            backInSeconds = Constants.backAndForwardSeconds
                        }) {
                            Image(systemName: "gobackward.10")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        .frame(width: 50, height: 50)
                        
                        Button(action: {
                            print("Play pressed")
                            
                            if isPlaying {
                                isPlaying = false
                            }
                            else {
                                isPlaying = true
                            }
                            
                        }) {
                            if isPlaying {
                                Image(systemName: "pause")
                                    .resizable()
                                    .frame(width: 25, height: 30)

                            }
                            else {
                                Image(systemName: "play.fill")
                                    .resizable()
                                    .frame(width: 25, height: 30)

                            }
                        }
                        .frame(width: 50, height: 50)
                        
                        Button(action: {
                            print("Forward pressed")
                            forwardInSeconds = Constants.backAndForwardSeconds
                        }) {
                            Image(systemName: "goforward.10")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        .frame(width: 50, height: 50)
                        
                    }.padding(.top)
                    
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
