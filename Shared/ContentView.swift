//
//  ContentView.swift
//  Shared
//
//  Created by Ethan Lai on 6/27/21.
//

import SwiftUI
import AVFoundation



struct splashView: View {

    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            if self.isActive {
                // go to main view
                ContentView()
            } else {
                //Image("AwesomeSplash")
// An alternative Text version of the splash screen
                Text("Fart!")
                    .font(Font.largeTitle)
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}


struct ContentView: View {
    var body: some View {
        Button(action: {
            playAudioAsset("gross")
          }, label: {
            Text("Fart")
                .padding()
    })
        
        }
}


var audioPlayer: AVAudioPlayer!

// Here is a simple function to play a sound from Assets.xcassets
func playAudioAsset(_ assetName : String) {
   guard let audioData = NSDataAsset(name: assetName)?.data else {
      fatalError("Unable to find asset \(assetName)")
   }

   do {
      audioPlayer = try AVAudioPlayer(data: audioData)
      audioPlayer.play()
   } catch {
      fatalError(error.localizedDescription)
   }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
