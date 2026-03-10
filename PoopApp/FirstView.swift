import SwiftUI

struct FirstView: View {
    @State private var dailyGoal: Int?
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("fon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.3)
                    .ignoresSafeArea()
                VStack(spacing: 15) {
                    Text("Ваша цель на сегодня:")
                        .font(.title)
                        .foregroundColor(.orange)
                        .bold()
                    TextField("Введите число", value: $dailyGoal, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .frame(width: 250)
                    
                    NavigationLink(destination: MainView(goal: dailyGoal ?? 0)) {
                        Text("Начать")
                            .font(.headline)
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }
                .padding()
            }
        }
    }
}
