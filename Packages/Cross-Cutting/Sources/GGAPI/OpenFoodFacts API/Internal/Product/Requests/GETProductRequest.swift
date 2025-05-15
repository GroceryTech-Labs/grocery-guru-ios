final class GETProductRequest: ProductAPIRequest, @unchecked Sendable {
    init(_ barcode: String) {
        super.init("/product/\(barcode)?fields=product_name,nutriments")
    }
}
