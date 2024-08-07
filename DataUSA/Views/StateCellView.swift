import SwiftUI

struct StateCellView: View {
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
    let state = DataService.generateLatestStateData().first!
    return StateCellView(viewModel: StateCellView.ViewModel(state: state))
}

