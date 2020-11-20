//
//  ContentView.swift
//  SimpleTrainingBipBloop
//
//  Created by vladukha on 20.11.2020.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
	
	@State var seconds:Int = 0
	@State var beepSound: AVAudioPlayer?
	let path = Bundle.main.path(forResource: "beep.mp3", ofType:nil)!
	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	@State var isActive = false
	
	
    var body: some View {
		VStack {
			Text("\(seconds)")
				.font(.system(size: 40, weight: .heavy, design: .default))
				.padding(.top)
			HStack {
				Button(action: {
					if seconds > 0
					{
						seconds -= 1
					}
				}) {
					Image(systemName: "minus.square")
						.resizable()
						.scaledToFit()
						.padding(.horizontal)
				}
				Button(action: {
					if seconds < 60
					{
						seconds += 1
					}
				}) {
					Image(systemName: "plus.square")
						.resizable()
						.scaledToFit()
						.padding(.horizontal)
				}
			}
			//Spacer()
			Button(action: {
				
			}) {
				Text("Random")
					.font(.system(size: 40, weight: .heavy, design: .default))
			}
			
			Button(action: {
				self.isActive = true
				do {
					let url = URL(fileURLWithPath: path)
					beepSound = try AVAudioPlayer(contentsOf: url)
					
				} catch {
					print("there was no sound")
				}
			}) {
				Image(systemName: "play.rectangle")
					.resizable()
					.scaledToFit()
					.padding()
			}
		}
		.onReceive(timer) { time in
			if self.isActive {
				if self.seconds > 0 {
					self.seconds -= 1
				} else {
					//---------
					beepSound?.play()
					//--------
					self.isActive = false
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
