import SwiftUI

struct NationDetailView: View {
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
                                try await viewModel.updateNationEntries()
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
                        try await viewModel.updateNationEntries()
                    } catch {
                        viewModel.displayAlert = true
                        viewModel.alertMessage = error.localizedDescription
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
                    try await viewModel.updateNationEntries()
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


