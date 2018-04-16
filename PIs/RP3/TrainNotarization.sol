pragma solidity ^0.4.18;

contract TrainNotarization {

   /*
   Roles:
   0 = "User"
   1 = "Carrier"
   2 = "Train"
   */

  struct carrierData {
   int pressure;
   int humidity;
   int temperature;
   int timestamp;
   string productID;
   }

  struct trainData {
   int pressure;
   int humidity;
   int temperature;
   int timestamp;
   }

   mapping(address => trainData) private trainDataList;
   mapping(address => carrierData) private carrierDataList;
   mapping(address => uint) private roles;

   address admin;

   event carrierRegistered(address indexed adminAddress, address indexed carrierAddress, int timestamp);
   event trainRegistered(address indexed adminAddress, address indexed trainAddress, int timestamp);

   event trainDataRegistered(address indexed trainAddress, int pressure, int humidity, int temperature, int timestamp);
   event carrierDataRegistered(address indexed carrierAddress, address indexed trainAddress, int productID, int timestamp);

   function TrainNotarization() public{
       admin = msg.sender;
   }

   modifier onlyAdmin {
       require(msg.sender == admin);
       _;
   }

   modifier onlyCarrier {
       require(roles[msg.sender] == 1);
    _;
   }

   modifier onlyTrain {
       require(roles[msg.sender] == 2);
    _;
   }

  function addCarrier(address _carrierAddress, int _timestamp) public onlyAdmin{
      if(roles[_carrierAddress] != 0) revert();
      roles[_carrierAddress] = 1;
      companyRegistred(msg.sender, _carrierAddress, _timestamp);
  }

  function addTrain(address _trainAddress, int _timestamp) public onlyAdmin{
      if(roles[_trainAddress] != 0) revert();
      roles[_trainAddress] = 2;
      companyRegistred(msg.sender, _trainAddress, _timestamp);
  }


  function updateCarrierData(address _carrierAddress, address _trainAddress, int _productID, int _timestamp) public onlyCarrier {
      trainDataList[_trainAddress] = trainData(_temperature, _timestamp);
  }

  function updateTrainData(address _trainAddress, int _pressure, int _humidity, int _temperature, int _timestamp) public onlyTrain {
      trainDataList[_trainAddress] = trainData(_temperature, _timestamp);
  }


  function getRole(address _address) view public returns (uint){
      return roles[_address];
  }


}