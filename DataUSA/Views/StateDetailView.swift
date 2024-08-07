import SwiftUI

struct StateDetailView: View {
    @Bindable var viewModel: ViewModel

    var body: some View {
        if let emptyViewTitle = viewModel.emptyViewTitle {
            Text(emptyViewTitle)
                .alert(viewModel.alertMessage,
                       isPresented: $viewModel.displayAlert
                ) {
                    Button(
                        Constants.Text.okButtonTitle,
                        role: .cancel
                    ) {
                        Task {
                            do {
                                try await viewModel.updateStateEntries()
                            } catch {
                                viewModel.displayAlert = true
                                viewModel.alertMessage = error.localizedDescription
                                print(error)
                            }
                        }
                    }
                }
                .task {
                    do {
                        try await viewModel.updateStateEntries()
                    } catch {
                        viewModel.displayAlert = true
                        viewModel.alertMessage = error.localizedDescription
                        print(error)
                    }
                }
            } else {
                List(viewModel.stateCellViewModels) { stateCellViewModel in
                    StateCellView(viewModel: stateCellViewModel)
                }
                .navigationTitle(viewModel.navigationTitle)
                Text(viewModel.footerTitle)
                    .opacity(Constants.UI.lightFontOpacity)
                    .bold()
                    .task {
                do {
                    try await viewModel.updateStateEntries()
                } catch {
                    print(error)
                }
            }
        }
    }
}

#Preview {
    StateDetailView(viewModel: StateDetailView.ViewModel(state: DataService.generateLatestStateData().first))
}
