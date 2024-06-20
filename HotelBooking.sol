// SPDX-License-Identifier: MIT
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
        Few addresses for testing purpose:0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
         */
}
