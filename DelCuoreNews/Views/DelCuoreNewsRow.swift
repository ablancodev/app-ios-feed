/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of landmarks.
*/

import SwiftUI

func artwork(art: String) -> Image
{
    // let art = "https://via.placeholder.com/150"
    if let url = URL(string: art), let data = try? Data(contentsOf: url), let image = UIImage(data: data)
    {
        return Image(uiImage: image)
    }
    else
    {
        return Image(systemName: "book")
    }
}

struct DelCuoreNewsRow: View {
    var landmark: Post

    var body: some View {
        HStack {
            /*
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            */
            artwork(art: landmark.imageUrl).renderingMode(.original)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.pink, lineWidth: 2))
                
            VStack(alignment: .leading) {
                Text(landmark.title)
                Text(landmark.source).font(.system(size: 12, weight: .light, design: .serif))
                    .foregroundColor(.gray)
            }

            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DelCuoreNewsRow(landmark: landmarks[0])
            DelCuoreNewsRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
