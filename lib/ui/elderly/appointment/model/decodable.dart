abstract class Decodable<ModelType> {
  ModelType decode(Map<String, dynamic> json);
}