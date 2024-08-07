import SwiftUI

struct NationDetailView: View {
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
                List(viewModel.nationCellViewModels) { nationCellViewModel in
                    NationCellView(viewModel: nationCellViewModel)
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
    NationDetailView(viewModel: NationDetailView.ViewModel(nation: DataService.generateLatestNationData().first))
}


