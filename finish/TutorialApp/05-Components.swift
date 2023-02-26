import SwiftUI

struct ComponentsView: View {
    @State var sliderValue = 0.8
    @State var count = 1
    @State var date = Date()
    @State var menuSelection = "🍕"
    @State var pickerDayTime = true
    @State var stepNumber = 20
    
    var body: some View {
        VStack(spacing: 20) {
            Slider(value: $sliderValue)
            Stepper("Value: \(stepNumber)", value: $stepNumber, in: 0...30)
            Picker("", selection: $pickerDayTime) {
                Image(systemName: "sun.max")
                    .tag(true)
                Image(systemName: "moon")
                    .tag(false)
            }
            .pickerStyle(.segmented)
            DatePicker("Date", selection: $date, displayedComponents: .date)
            Menu("On the Menu: \(menuSelection)") {
                ForEach(["🍕", "🥦", "🌮"], id: \.self) { food in
                    Button(food) {
                        menuSelection = food
                    }
                }
            }
            Button("Count: \(count)") {
                count += 1
            }
        }
        .padding()
    }
}

struct ComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentsView()
    }
}
