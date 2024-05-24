abstract class Vehicle {
  void refuel();
  void move();
}

class ElectricCar extends Vehicle {
  @override
  void move() {
    print('changing battery....');
  }

  @override
  void refuel() {
    print('Moving');
  }
}

class PetrolCar extends Vehicle {
  @override
  void move() {
    print('moving......');
  }

  @override
  void refuel() {
    print('Refilling the petrol....');
  }
}

void serviceVehicle(Vehicle vehicle) {
  vehicle.refuel();
}


/**The original code violated the Liskov
Substitution Principle because
ElectricCar, as a subclass of
Vehicle, wasn't truly substitutable for
Vehicle in all situations.
4. Specifically, the refuel method didn't
make sense for ElectricCar. */