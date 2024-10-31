// import 'dart:io';
// import 'dart:convert'; // For encoding the image to base64
// import 'package:dio/dio.dart';

// const String BASE_URL =
//     "https://api.yourapi.com"; // Update with your actual URL
// const String API_KEY = "your_api_key"; // Replace with your actual API key

// class ApiService {
//   final Dio _dio = Dio();

//   Future<String> sendImageToGPT4Vision({
//     required File image,
//     int maxTokens = 50,
//     String model = "gpt-4-vision-preview",
//   }) async {
//     final String base64Image = await encodeImage(image);

//     try {
//       final response = await _dio.post(
//         "$BASE_URL/chat/completions",
//         options: Options(
//           headers: {
//             HttpHeaders.authorizationHeader: 'Bearer $API_KEY',
//             HttpHeaders.contentTypeHeader: "application/json",
//           },
//         ),
//         data: {
//           "image": base64Image,
//           "max_tokens": maxTokens,
//           "model": model,
//         },
//       );

//       // Return the disease name or handle as needed
//       return response.data['choices'][0]['text'];
//     } catch (error) {
//       throw Exception("Error detecting disease: $error");
//     }
//   }

//   Future<String> encodeImage(File image) async {
//     List<int> imageBytes = await image.readAsBytes();
//     return base64Encode(imageBytes);
//   }
// }
