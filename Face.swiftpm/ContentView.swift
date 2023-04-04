import SwiftUI
import RealityKit
import ARKit

struct ContentView: View {
    @ObservedObject var arViewModel: ARViewModel = ARViewModel()
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    HStack {
                        Text("제이슨")
                            .font(.title)
                            .bold()
                            .foregroundColor(arViewModel.tiltLeft ? .green : .secondary)
                        Spacer()
                        Text("사야")
                            .font(.title)
                            .bold()
                            .foregroundColor(arViewModel.tiltRight ? .green : .secondary)
                    }
                    Text("What's your favorite food?")
                        .font(.headline)
                        .padding()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(.regularMaterial))
                Spacer()
            }
            .padding()
        }
        
    } // body
}

struct ARViewContainer: UIViewRepresentable {
    var arViewModel: ARViewModel
    
    func makeUIView(context: Context) -> ARView {
        arViewModel.startSessionDelegate()
        return arViewModel.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
}

