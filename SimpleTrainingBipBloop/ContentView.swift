//
//  ContentView.swift
//  SimpleTrainingBipBloop
//
//  Created by vladukha on 20.11.2020.
//

import SwiftUI


struct ContentView: View {
	
	@State var seconds:Int = 0
	
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
			Spacer()
			Image(systemName: "minus")
				.resizable()
				.scaledToFit()
			Button(action: {
				//dogay
			}) {
				Image(systemName: "play.rectangle")
					.resizable()
					.scaledToFit()
					.padding()
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
