import { ethers } from "ethers";

const contractAbi = [
  "event OwnershipTransfered(address indexed previousOwner, address indexed newOwner)",
  "function transferOwnership(address _newOwner) public",
  "event ProductAdded(uint256 indexed productId, string productName, string manufacturer, uint256 productionDate, uint256 categoryId)",
  "event ProductUpdatedCategory(uint256 indexed productId, uint256 categoryId)",
  "event ProductDeleted(uint256 indexed productId)",
  "function addProducts(uint256 productId, string productName, string manufacturer, uint256 productionDate, uint256 categoryId) public",
  "function updateCategory(uint256 productId, uint256 categoryId) public",
  "function deleteProduct(uint256 productId) public",
  "function getProduct(uint256 productId) public view returns (uint256, string, string, uint256, uint256)",
  "function getProductCount() public view returns (uint256)",
];

const { PRIVATE_KEY, PROVIDER_URL, CONTRACT_ADDRESS } = process.env;

if (!PRIVATE_KEY || !PROVIDER_URL || !CONTRACT_ADDRESS) {
  throw new Error("Missing environment variables for blockchain setup.");
}

const privateKey = process.env.PRIVATE_KEY as string;
const providerUrl = process.env.PROVIDER_URL as string;
const contractAddress = process.env.CONTRACT_ADDRESS as string;

const provider = new ethers.JsonRpcProvider(PROVIDER_URL);
const wallet = new ethers.Wallet(PRIVATE_KEY, provider);

export const productRegistryContract = new ethers.Contract(
  contractAddress,
  contractAbi,
  wallet
);
