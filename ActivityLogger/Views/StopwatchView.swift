//
//  StopWatchView.swift
//  ActivityLogger
//
//  Created by Josiah Pilon on 2024-02-09.
//
import SwiftUI
struct StopwatchView: View {
    @ObservedObject var viewModel = StopwatchViewModel()

    var body: some View {
        VStack {
            Text(viewModel.timeElapsed)
                .font(.largeTitle)
                .padding()

            HStack {
                Button(action: {
                    if viewModel.isRunning {
                        viewModel.pause()
                    } else {
                        viewModel.start()
                    }
                }) {
                    Text(viewModel.isRunning ? "Pause" : "Start")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(viewModel.isRunning ? Color.red : Color.green)
                        .cornerRadius(25)
                }

                Button(action: viewModel.reset) {
                    Text("Reset")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.blue)
                        .cornerRadius(25)
                }
                .padding(.leading, 20)
            }
            .padding()
        }
    }
}

#Preview {
  StopwatchView()
      .previewLayout(.sizeThatFits)
      .padding()
}

