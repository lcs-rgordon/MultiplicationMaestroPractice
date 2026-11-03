//
//  QuizView.swift
//  MultiplicationMaestro
//

import SwiftUI

struct QuizView: View {

    // MARK: - Stored properties
    @State var viewModel = QuizViewModel()

    // MARK: - Computed properties
    var body: some View {
        VStack(spacing: 20) {

            // The question
            Text("\(viewModel.multiplicand) × \(viewModel.multiplier)")
                .font(.system(size: 64))

            // The answer, and whether it was right
            HStack {
                TextField("Your answer", text: $viewModel.inputGiven)
                    .textFieldStyle(.roundedBorder)
                    .font(.largeTitle)

                if viewModel.answerChecked == true {
                    if viewModel.answerCorrect == true {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(.green)
                    } else {
                        Image(systemName: "x.square")
                            .foregroundStyle(.red)
                    }
                }
            }
            .font(.largeTitle)

            // Check the answer, or move on
            if viewModel.answerChecked == false {
                Button("Check Answer") {
                    viewModel.checkAnswer()
                }
                .buttonStyle(.borderedProminent)
            } else {
                Button("New Question") {
                    viewModel.newQuestion()
                }
                .buttonStyle(.bordered)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    QuizView()
}
