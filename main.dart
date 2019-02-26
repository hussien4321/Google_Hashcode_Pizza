import 'dart:io';
import 'dart:convert';
import 'dart:async';
import './pizza.dart';
import './solver.dart';
import './coord.dart';

Future<List<String>> importFile(String filename) async {
  final file = new File(filename);
  Stream<List<int>> inputStream = file.openRead();

  List<String> data = await inputStream
    .transform(utf8.decoder)       // Decode bytes to UTF-8.
    .transform(new LineSplitter()) // Convert stream to individual lines.
    .toList();
  return data;
}

writeResultToFile(String filename, List<Coord> results) async {
  int count = results.length;
  String output = count.toString();
  for(int c = 0; c < count; c++){
    output += "\n${results[c]}";
  }

  await File(filename).writeAsString(output);

}

main() async {
  List<String> filenames = ["a_example", "b_small", "c_medium", "d_big"];
  // print('hello hash code 2019!');
  for(String filename in filenames){
    List<String> data = await importFile("./inputs/$filename.in");
    Pizza pizza = new Pizza(data);

    Solver solver = new Solver(pizza);
    List<Coord> finalSlices = solver.solve();

    await writeResultToFile("./outputs/$filename.out", finalSlices);

  }
}