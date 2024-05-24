class Shape {
  String type;
  Shape(this.type);
}

class AreaCalculator {
  double calculateArea(Shape shape) {
    if (shape.type == 'circle') {
      // calculate area of circle
      return 00.0;
    } else if (shape.type == 'square') {
      //  calculate area of square
      return 0.00;
    }
    return 0.0;
  }
}

/**The bad code violated the Open/Closed
Principle because the AreaCalculator
class was not closed for modification.
6. Every time we wanted to add a new
shape, we had to modify the
AreaCalculator class.
7. This made the class difficult to maintain,
and also increased the risk of introducing
bugs. */