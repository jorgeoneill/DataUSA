import SwiftUI

struct MainView: View {
    var viewModel: ViewModel

    var body: some View {
        if let emptyViewTitle = viewModel.emptyViewTitle {
            Text(emptyViewTitle)
                .task {
                    do {
                        try await viewModel.updateNation()
                    } catch {
                        print(error)
                    }
                }
            } else {
            NavigationStack {
                List {
                    Section(header: Text(Constants.Text.nationSectionHeader)) {
                        if let nationCellViewModel = viewModel.nationCellViewModel {
                            NavigationLink {
                                NationDetailView(viewModel: nationCellViewModel.detailViewModel)
                            } label: {
                                NationCellView(viewModel: nationCellViewModel)
                            }
                        }
                    }
                    Section(header: Text(Constants.Text.stateSectionHeader)) {
                        ForEach(viewModel.stateCellViewModels) { cellViewModel in
                            NavigationLink {
                                //Text("DetailView")
                                StateDetailView(viewModel: cellViewModel.detailViewModel)
                            } label: {
                                StateCellView(viewModel: cellViewModel)
                            }
                        }
                    }
                }
                .navigationTitle(viewModel.navigationTitle)
                Text(viewModel.footerTitle)
                    .opacity(Constants.UI.lightFontOpacity)
                    .bold()
            
            }
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
     MainView(viewModel: MainView.ViewModel())
 }
