import SwiftUI

struct NationCellView: View {
    var viewModel: ViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(viewModel.title)
                .font(.body)
                .bold()
                .opacity(Constants.UI.regularFontOpacity)
            Text(viewModel.subtitle)
                .font(.callout)
                .opacity(Constants.UI.lightFontOpacity)
        }
    }
}

#Preview {
    let nation = DataService.generateLatestNationData().first!
    return NationCellView(viewModel: NationCellView.ViewModel(nation: nation))
}
