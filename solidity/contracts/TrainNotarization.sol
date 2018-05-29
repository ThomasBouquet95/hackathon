pragma solidity ^0.4.18;
contract TrainNotarization {
   

   address admin;

   event trainStationRegistered(address indexed adminAddress, address indexed trainStationAddress, int timestamp);
   event trainRegistered(address indexed adminAddress, address indexed trainAddress, int timestamp);
   event trainDataRegistered(address indexed trainAddress, int pressure, int humidity, int temperature, int timestamp);
   event trainStationDataRegistered(address indexed carrierAddress, int pressure, int humidity, int temperature, int timestamp, int isTrainArrived, int isCargoHere);

   function TrainNotarization() public{
       admin = msg.sender;
   }
  

  function updateTrainStationData(address _trainStationAddress, int _pressure, int _humidity, int _temperature, int _timestamp, int _isTrainArrived, int _isCargoHere) public {

      trainStationDataRegistered(_trainStationAddress, _pressure, _humidity, _temperature, _timestamp, _isTrainArrived, _isCargoHere);
  }

  function updateTrainData(address _trainAddress, int _pressure, int _humidity, int _temperature, int _timestamp) public {

      trainDataRegistered(_trainAddress, _pressure, _humidity, _temperature, _timestamp);
  }


}
