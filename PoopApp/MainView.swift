import SwiftUI

enum TypePoop: String {
    case sleepy
    case happy
    case normal
}

struct MainView: View {
    @State private var k: Int = 0
    let goal: Int
    
    var body: some View {
        ZStack {
            BackgroundVideoView()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                UnevenRoundedRectangle(topLeadingRadius: 320, topTrailingRadius: 320)
                    .fill(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 740)
            }
            .ignoresSafeArea(edges: .bottom)

            VStack(spacing: 20) {
                switch k {
                case 0:
                    Image(.sleepy)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                case 1..<goal:
                    Image(.normal)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                case goal...:
                    Image(.happy)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                default:
                    Text("Error")
                }
                
                VStack(spacing: 8) {
                    let currentProgress = min(Double(k) / Double(goal), 1.0)
                    
                    ProgressView(value: currentProgress)
                        .tint(k >= goal ? .green : .yellow)
                        .scaleEffect(x: 1, y: 3, anchor: .center)
                        .frame(width: 300)
                    
                    Text("\(k)")
                        .font(.headline)
                        .foregroundStyle(.gray)
                }
                .padding(.bottom, 10)
                    
                Button {
                    withAnimation(.easeInOut) {
                        k += 1
                    }
                } label: {
                    Text("I pooped!")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.yellow)
                        .cornerRadius(20)
                }
            }
        }
    }
}

#Preview {
    MainView(goal:3)
}
