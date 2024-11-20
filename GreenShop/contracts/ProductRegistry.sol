// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    address public owner;
    
    event OwnershipTransfered(address indexed previousOwner, address indexed newOwner);

    constructor () {
        owner = msg.sender;
    }
     
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Invalid new owner address");
        address previousOwner = owner;
        owner = _newOwner;
        emit OwnershipTransfered(previousOwner, _newOwner);
    }
}

contract ProductRegistry  is Ownable {
    struct Product {
        uint256 productId;
        string productName;
        string manufacturer;
        uint256 productionDate;
        uint256 categoryId;
    }

    mapping (uint256 => Product) private products;
    mapping (uint256 => uint256) private productIndex;

    uint256[] private productIds;

    event ProductAdded(uint256 indexed productId, string productName, string manufacturer, uint256 productionDate, uint256 categoryId);
    event ProductUpdatedCategory(uint256 indexed  productId, uint256 categoryId);
    event ProductDeleted(uint256 indexed productId);

    error ProductNotFoundByName(string productName);

    function addProducts(
        uint256 _productId,
        string memory _productName,
        string memory _manufacturer,
        uint256 _productionDate,
        uint256 _categoryId
    ) public onlyOwner {
        require(products[_productId].productId == 0, "Product already exists");

        
        products[_productId] = Product(_productId, _productName, _manufacturer, _productionDate, _categoryId);
        productIds.push(_productId);
        productIndex[_productId] = productIds.length -1;

        emit ProductAdded(_productId, _productName, _manufacturer, _productionDate, _categoryId);
    }

    function updateCategory(
        uint256 _productId,
        uint256 _categoryId
    ) public onlyOwner {
        Product storage product = products[_productId];
        require(product.productId != 0, "Product does not exist");

        product.categoryId = _categoryId;

        emit ProductUpdatedCategory(_productId, _categoryId);
    }

    function deleteProduct(uint256 productId) public onlyOwner {
        require(products[productId].productId != 0, "Product does not exist");

        delete products[productId];

        uint256 index = productIndex[productId];
        uint256 lastIndex = productIds.length -1;
        if (index != lastIndex) {
            uint256 lastProductId = productIds[lastIndex];
            productIds[index] = lastProductId;
            productIndex[lastProductId] = index;
        }

        productIds.pop();
        delete productIndex[productId];

        emit ProductDeleted(productId);
    }

     function getProduct(uint256 _productId) public view returns (
        uint256,
        string memory,
        string memory,
        uint256,
        uint256
    ) {
       Product memory product = products[_productId];
        require(product.productId != 0, "ProductRegistry: product does not exist");
        return (product.productId, product.productName, product.manufacturer, product.productionDate, product.categoryId);
    }

    function getProductCount() public view returns (uint256) {
        return productIds.length;
    }

}