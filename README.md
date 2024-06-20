# Hotel Booking

This is a Solidity contract for a hotel booking system. It allows users to create and manage bookings for different types of rooms. The contract includes functions for creating a new booking, confirming a booking, and viewing booking details. The booking details are stored in a mapping with unique identifiers.

# Description

The provided code is a Solidity contract for a hotel booking system. Here's a summary of the key features:

    >>Room Types: The contract defines an enum RoomType with three options: Single, Double, and Suite.
    >>Booking Structure: The contract has a Booking struct that stores the details of a booking, including the guest address, room type, check-in and check-out dates, number of rooms, and a flag to indicate if the booking is confirmed.
    >>Booking Storage: The contract uses a mapping bookings to store the bookings, with the booking ID as the key. It also keeps track of the next available booking ID in the nextBookingId variable.
    >>Booking Creation: The createBooking function allows users to create a new booking by providing the guest address, room type, check-in and check-out dates, and the number of rooms.
    >>Booking Confirmation: The confirmBooking function can be used to confirm a booking, simulating an approval process.
    >>Booking Viewing: The viewBooking function allows a guest to view the details of their own booking.
  

The provided code demonstrates the basic functionality of a hotel booking system implemented using Solidity. It includes features for creating, confirming, and viewing bookings, as well as the use of a custom data structure (Booking) and a mapping to store the booking details.


# Getting Started



# Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., TravelBokking.sol). Copy and paste the following code into the file:

````js // SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract HotelBooking {

    // Define an enum for different room types
    enum RoomType { Single, Double, Suite }

    // Structure to store hotel booking details
    struct Booking {
        address guest;
        RoomType roomType;
        uint checkInDate; // Unix timestamp
        uint checkOutDate; // Unix timestamp
        uint numRooms;
        bool isConfirmed;
    }

    // Mapping for storing bookings with unique identifiers
    mapping(uint => Booking) public bookings;
    uint public nextBookingId = 1; // Keeps track of next booking ID

    // Function to create a new hotel booking
    function createBooking(address _guest, RoomType _roomType, uint _checkInDate, uint _checkOutDate, uint _numRooms) public {
        Booking memory newBooking = Booking(_guest, _roomType, _checkInDate, _checkOutDate, _numRooms, false);
        bookings[nextBookingId] = newBooking;
        nextBookingId++;
    }

    // Function to confirm a booking (simulates approval process)
    function confirmBooking(uint _bookingId) public {
        require(bookings[_bookingId].isConfirmed == false, "Booking already confirmed");
        bookings[_bookingId].isConfirmed = true;
    }

    // Function to view booking details (guest can see their bookings)
    function viewBooking(uint _bookingId) public view returns (Booking memory) {
        require(bookings[_bookingId].guest == msg.sender, "Unauthorized to view booking");
        return bookings[_bookingId];
    }

    /*
        Few addresses for testing purpose:
        
   
    */
}
````



To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.7" (or another compatible version), and then click on the "Compile HotelBooking.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "HotelBooking" contract from the dropdown menu, and then click on the "Deploy" button.



## Authors

Abhishek Kumar  
[@Abhishek](https://www.linkedin.com/in/abhishek-kumar-75273024b/)


## License

This MyToken is licensed under the MIT License 
