/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A representation of a single landmark.
*/

import Foundation
import SwiftUI
import CoreLocation

struct Post: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var url: String
    var source: String

    var imageUrl: String
}
