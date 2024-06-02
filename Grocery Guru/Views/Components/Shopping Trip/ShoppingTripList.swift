import SwiftUI

struct ShoppingTripList: View {

    private let trips: [ShoppingTrip]

    init(_ trips: [ShoppingTrip]) {
        self.trips = trips
    }

    var body: some View {
        ForEach(trips, id: \.hashValue) { trip in
            HStack {
                VStack(alignment: .leading) {
                    Text(DateFormatter.fullDateStyleFormatter.string(from: .now))
                    Text("\(trip.items.count) Items")
                        .font(.caption)
                }

                Spacer()

                Button {

                } label: {
                    Image(systemName: "chevron.right")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(Constants.Padding.M)
            .background(Color.surfaceSecondary)
            .clipShape(.rect(cornerRadius: Constants.Padding.S))
            .shadow(radius: 1, y: 1)
        }
    }
}

#Preview {
    VStack {
        ShoppingTripList(
            [ShoppingTrip(
                date: Date(),
                items: [.init(name: "dasd", amount: 2, category: .bakery)]
            )]
        )
    }
}
