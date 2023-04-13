//
//  ContentView.swift
//  ZoomView
//
//  Created by developer mg on 13/04/2023.
//

import SwiftUI


struct ContentView: View {
    @State private var uiimage = UIImage(named: "cat")
    
    var body: some View {
        VStack (alignment: .center){
            ZoomAndPanAndRotationView(image: uiimage!)
                .ignoresSafeArea(.all)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//struct ContentView: View {
//    @State private var uiimage = UIImage(named: "cat")
//
//    @GestureState private var scaleState: CGFloat = 1
//    @GestureState private var offsetState = CGSize.zero
//
//    @State private var offset = CGSize.zero
//    @State private var scale: CGFloat = 1
//
//    var magnification: some Gesture {
//        MagnificationGesture()
//            .updating($scaleState) { currentState, gestureState, _ in
//                gestureState = currentState
//            }
//            .onEnded { value in
//                scale *= value
//            }
//    }
//
//    var dragGesture: some Gesture {
//        DragGesture()
//            .updating($offsetState) { currentState, gestureState, _ in
//                gestureState = currentState.translation
//            }.onEnded { value in
//                offset.height += value.translation.height
//                offset.width += value.translation.width
//            }
//    }
//
//    var body: some View {
//        VStack{
//            Text("Test1")
//            Image(uiImage: uiimage!)
//                .resizable()
//                .scaledToFit()
//                .scaleEffect(self.scale * scaleState)
//                .offset(x: offset.width + offsetState.width, y: offset.height + offsetState.height)
//                .gesture(SimultaneousGesture(magnification, dragGesture))
//            Text("Test2")
//        }
//    }
//}
