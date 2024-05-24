abstract class Shape {
  double calculateArea();
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);
  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }
}

class Square extends Shape {
  double side;
  Square(this.side);

  @override
  double calculateArea() {
    return side * side;
  }
}

class AreaCalculator {
  double calculateArea(Shape shape) {
    return shape.calculateArea();
  }
}

/**In the refactored solution, we have an
abstract Shape class with an abstract
calculateArea method.
2. Then, we have the Circle and Square
classes, which are concrete
implementations of the Shape class.
3. Each of these classes overrides the
calculateArea method to provide its
own implementation.
4. Finally, we have the AreaCalculator
class that uses the Shape class to
calculate the area, so it doesn't need to
know the specific type of */
