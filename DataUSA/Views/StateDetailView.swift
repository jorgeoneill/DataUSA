import SwiftUI

struct StateDetailView: View {
    var viewModel: ViewModel

    var body: some View {
        if let emptyViewTitle = viewModel.emptyViewTitle {
            Text(emptyViewTitle)
                .task {
                    do {
                        try await viewModel.updateStatesList()
                    } catch {
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
                    try await viewModel.updateStatesList()
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
