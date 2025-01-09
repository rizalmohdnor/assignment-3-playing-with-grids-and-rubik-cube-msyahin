import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2x2 Rubik\'s Cube',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: const CubeScreen(),
    );
  }
}

class CubeState {
  List<List<Color>> faces = [
    [Colors.red, Colors.red, Colors.red, Colors.red], // Front
    [Colors.blue, Colors.blue, Colors.blue, Colors.blue], // Left
    [Colors.green, Colors.green, Colors.green, Colors.green], // Right
    [Colors.yellow, Colors.yellow, Colors.yellow, Colors.yellow], // rear
    [Colors.orange, Colors.orange, Colors.orange, Colors.orange], // Top
    [Colors.white, Colors.white, Colors.white, Colors.white], // Bottom
  ];

  // Rotate top face clockwise
  void rotateTop() {
    List<Color> tempTop = [...faces[4]];
    faces[4] = [tempTop[2], tempTop[0], tempTop[3], tempTop[1]];

    // Update adjacent faces
    List<Color> frontTop = [faces[0][0], faces[0][1]];
    List<Color> leftTop = [faces[1][0], faces[1][1]];
    List<Color> rightTop = [faces[2][0], faces[2][1]];
    List<Color> rearTop = [faces[3][0], faces[3][1]];

    faces[0][0] = leftTop[0];
    faces[0][1] = leftTop[1];

    faces[1][0] = rearTop[0];
    faces[1][1] = rearTop[1];

    faces[2][0] = frontTop[0];
    faces[2][1] = frontTop[1];

    faces[3][0] = rightTop[0];
    faces[3][1] = rightTop[1];
  }

  // Rotate top face counterclockwise (3 clockwise rotations)
  void rotateTopPrime() {
    rotateTop();
    rotateTop();
    rotateTop();
  }

  // Rotate bottom face clockwise
  void rotateBottom() {
    List<Color> tempBottom = [...faces[5]];
    faces[5] = [tempBottom[2], tempBottom[0], tempBottom[3], tempBottom[1]];

    // Update adjacent faces
    List<Color> frontBottom = [faces[0][2], faces[0][3]];
    List<Color> leftBottom = [faces[1][2], faces[1][3]];
    List<Color> rightBottom = [faces[2][2], faces[2][3]];
    List<Color> rearBottom = [faces[3][2], faces[3][3]];

    faces[0][2] = rightBottom[0];
    faces[0][3] = rightBottom[1];

    faces[1][2] = frontBottom[0];
    faces[1][3] = frontBottom[1];

    faces[2][2] = rearBottom[0];
    faces[2][3] = rearBottom[1];

    faces[3][2] = leftBottom[0];
    faces[3][3] = leftBottom[1];
  }

  // Rotate bottom face counterclockwise (3 clockwise rotations)
  void rotateBottomPrime() {
    rotateBottom();
    rotateBottom();
    rotateBottom();
  }

  // Rotate left face clockwise
  void rotateLeft() {
    List<Color> tempLeft = [...faces[1]];
    faces[1] = [tempLeft[2], tempLeft[0], tempLeft[3], tempLeft[1]];

    // Update adjacent faces
    List<Color> topLeft = [faces[4][0], faces[4][2]];
    List<Color> frontLeft = [faces[0][0], faces[0][2]];
    List<Color> bottomLeft = [faces[5][0], faces[5][2]];
    List<Color> rearRight = [faces[3][3], faces[3][1]];

    faces[4][0] = rearRight[0];
    faces[4][2] = rearRight[1];

    faces[0][0] = topLeft[0];
    faces[0][2] = topLeft[1];

    faces[5][0] = frontLeft[0];
    faces[5][2] = frontLeft[1];

    faces[3][3] = bottomLeft[0];
    faces[3][1] = bottomLeft[1];
  }

  // Rotate left face counterclockwise (3 clockwise rotations)
  void rotateLeftPrime() {
    rotateLeft();
    rotateLeft();
    rotateLeft();
  }

  // Rotate right face clockwise
  void rotateRight() {
    List<Color> tempRight = [...faces[2]];
    faces[2] = [tempRight[2], tempRight[0], tempRight[3], tempRight[1]];

    // Update adjacent faces
    List<Color> topRight = [faces[4][1], faces[4][3]];
    List<Color> frontRight = [faces[0][1], faces[0][3]];
    List<Color> bottomRight = [faces[5][1], faces[5][3]];
    List<Color> rearLeft = [faces[3][2], faces[3][0]];

    faces[4][1] = frontRight[0];
    faces[4][3] = frontRight[1];

    faces[0][1] = bottomRight[0];
    faces[0][3] = bottomRight[1];

    faces[5][1] = rearLeft[0];
    faces[5][3] = rearLeft[1];

    faces[3][2] = topRight[0];
    faces[3][0] = topRight[1];
  }

  // Rotate right face counterclockwise (3 clockwise rotations)
  void rotateRightPrime() {
    rotateRight();
    rotateRight();
    rotateRight();
  }

  // Rotate front face clockwise
  void rotateFront() {
    List<Color> tempFront = [...faces[0]];
    faces[0] = [tempFront[2], tempFront[0], tempFront[3], tempFront[1]];

    // Update adjacent faces
    List<Color> topFront = [faces[4][2], faces[4][3]];
    List<Color> leftRight = [faces[1][1], faces[1][3]];
    List<Color> bottomFront = [faces[5][0], faces[5][1]];
    List<Color> rightLeft = [faces[2][0], faces[2][2]];

    faces[4][2] = leftRight[1];
    faces[4][3] = leftRight[0];

    faces[1][1] = bottomFront[0];
    faces[1][3] = bottomFront[1];

    faces[5][0] = rightLeft[0];
    faces[5][1] = rightLeft[1];

    faces[2][0] = topFront[1];
    faces[2][2] = topFront[0];
  }

  // Rotate front face counterclockwise (3 clockwise rotations)
  void rotateFrontPrime() {
    rotateFront();
    rotateFront();
    rotateFront();
  }

  // Rotate rear face clockwise
  void rotaterear() {
    List<Color> temprear = [...faces[3]];
    faces[3] = [temprear[2], temprear[0], temprear[3], temprear[1]];

    // Update adjacent faces
    List<Color> toprear = [faces[4][0], faces[4][1]];
    List<Color> leftLeft = [faces[1][0], faces[1][2]];
    List<Color> bottomrear = [faces[5][2], faces[5][3]];
    List<Color> rightRight = [faces[2][1], faces[2][3]];

    faces[4][0] = rightRight[1];
    faces[4][1] = rightRight[0];

    faces[1][0] = toprear[1];
    faces[1][2] = toprear[0];

    faces[5][2] = leftLeft[0];
    faces[5][3] = leftLeft[1];

    faces[2][1] = bottomrear[0];
    faces[2][3] = bottomrear[1];
  }

  // Rotate rear face counterclockwise (3 clockwise rotations)
  void rotaterearPrime() {
    rotaterear();
    rotaterear();
    rotaterear();
  }

  // Shuffle the cube
  void shuffle() {
    final rotations = [
      rotateTop,
      rotateBottom,
      rotateLeft,
      rotateRight,
      rotateFront,
      rotaterear,
      rotateTopPrime,
      rotateBottomPrime,
      rotateLeftPrime,
      rotateRightPrime,
      rotateFrontPrime,
      rotaterearPrime,
    ];

    final random = Random();

    for (int i = 0; i < 2; i++) {
      // Create 2 random rotations
      int randomRotation =
      random.nextInt(rotations.length); // Generate a random index
      rotations[randomRotation](); // Execute the corresponding rotation
    }
  }

  // Reset the cube to its solved state
  void reset() {
    faces = [
      [Colors.red, Colors.red, Colors.red, Colors.red], // Front
      [Colors.blue, Colors.blue, Colors.blue, Colors.blue], // Left
      [Colors.green, Colors.green, Colors.green, Colors.green], // Right
      [Colors.yellow, Colors.yellow, Colors.yellow, Colors.yellow], // rear
      [Colors.orange, Colors.orange, Colors.orange, Colors.orange], // Top
      [Colors.white, Colors.white, Colors.white, Colors.white], // Bottom
    ];
  }
}

class CubeScreen extends StatefulWidget {
  const CubeScreen({Key? key}) : super(key: key);

  @override
  _CubeScreenState createState() => _CubeScreenState();
}

class _CubeScreenState extends State<CubeScreen> {
  CubeState cube = CubeState();

  void rotateTop() {
    setState(() {
      cube.rotateTop();
    });
  }

  void rotateTopPrime() {
    setState(() {
      cube.rotateTopPrime();
    });
  }

  void rotateBottom() {
    setState(() {
      cube.rotateBottom();
    });
  }

  void rotateBottomPrime() {
    setState(() {
      cube.rotateBottomPrime();
    });
  }

  void rotateLeft() {
    setState(() {
      cube.rotateLeft();
    });
  }

  void rotateLeftPrime() {
    setState(() {
      cube.rotateLeftPrime();
    });
  }

  void rotateRight() {
    setState(() {
      cube.rotateRight();
    });
  }

  void rotateRightPrime() {
    setState(() {
      cube.rotateRightPrime();
    });
  }

  void rotateFront() {
    setState(() {
      cube.rotateFront();
    });
  }

  void rotateFrontPrime() {
    setState(() {
      cube.rotateFrontPrime();
    });
  }

  void rotaterear() {
    setState(() {
      cube.rotaterear();
    });
  }

  void rotaterearPrime() {
    setState(() {
      cube.rotaterearPrime();
    });
  }

  void shuffle() {
    setState(() {
      cube.shuffle();
    });
  }

  void reset() {
    setState(() {
      cube.reset();
    });
  }

  Widget buildFace(List<Color> faceColors) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) => Container(color: faceColors[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: const Text(
              '2x2 Rubik\'s Cube',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Up', style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buildFace(cube.faces[4]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      const Text('Left', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: buildFace(cube.faces[1]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      const Text('Front', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: buildFace(cube.faces[0]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      const Text('Right', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: buildFace(cube.faces[2]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text('Down', style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buildFace(cube.faces[5]),
                ),
              ],
            ),
            Column(
              children: [
                const Text('Rear', style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buildFace(cube.faces[3]),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: rotateFront,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text('F'),
                ),
                ElevatedButton(
                  onPressed: rotaterear,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text('B'),
                ),
                ElevatedButton(
                  onPressed: rotateTop,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text('U'),
                ),
                ElevatedButton(
                  onPressed: rotateBottom,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text('D'),
                ),
                ElevatedButton(
                  onPressed: rotateLeft,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text('L'),
                ),
                ElevatedButton(
                  onPressed: rotateRight,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text('R'),
                ),
              ],
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: rotateFrontPrime,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text("F'"),
                ),
                ElevatedButton(
                  onPressed: rotaterearPrime,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text("B'"),
                ),
                ElevatedButton(
                  onPressed: rotateTopPrime,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text("U'"),
                ),
                ElevatedButton(
                  onPressed: rotateBottomPrime,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text("D'"),
                ),
                ElevatedButton(
                  onPressed: rotateLeftPrime,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text("L'"),
                ),
                ElevatedButton(
                  onPressed: rotateRightPrime,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text("R'"),
                ),
              ],
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: shuffle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Shuffle'),
                ),
                ElevatedButton(
                  onPressed: reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
