abstract class Vehicle {
  void move();
}

abstract class FuelVehicle extends Vehicle {
  void refuel();
}

abstract class ElectricVehicle extends Vehicle {
  void charge();
}

class ElectricCar extends ElectricVehicle {
  @override
  void charge() {
    print('Charging the battery.....');
  }

  @override
  void move() {
    print('Moving.....');
  }
}

class PetrolCar extends FuelVehicle {
  @override
  void move() {
    print('moving.....');
  }

  @override
  void refuel() {
    print('Refilling the petrol.....');
  }
}

void serviceFuelVehicle(FuelVehicle vehicle) {
  vehicle.refuel();
}

void serviceElectricVehicle(ElectricVehicle vehicle) {
  vehicle.charge();
}

/**In the refactored solution, we separated
FuelVehicle and ElectricVehicle
as two different abstractions, both
extending Vehicle.
2. This allows us to create separate service
methods for each type of vehicle,
ensuring that we don't attempt to
perform an action that doesn't make
sense for a particular type of vehicle.
 */
