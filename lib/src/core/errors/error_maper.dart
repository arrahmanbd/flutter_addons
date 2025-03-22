part of 'package:flutter_addons/flutter_addons.dart';

// Define an abstraction for error handling
abstract class ErrorMapper {
  /// Maps a specific error to a human-readable message.
  String mapError(Exception error, [StackTrace? stackTrace]);

  /// Maps HTTP status codes to human-readable error messages for different HTTP request types.
  /// This method handles common HTTP error responses, including client errors (4xx),
  /// server errors (5xx), and success responses (2xx).
  /// 
  /// A default implementation is provided. You can override this in subclasses for custom error mapping.
  String mapHttpError(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad Request. Please check your request parameters.";
      case 401:
        return "Unauthorized. Please check your authentication credentials.";
      case 403:
        return "Forbidden. You do not have permission to access this resource.";
      case 404:
        return "Not Found. The resource could not be found.";
      case 409:
        return "Conflict. The request could not be completed due to a conflict.";
      case 415:
        return "Unsupported Media Type. The request format is not supported by the server.";
      case 422:
        return "Unprocessable Entity. The request was well-formed but could not be processed.";
      case 429:
        return "Too Many Requests. You have sent too many requests in a given amount of time.";
      case 500:
        return "Internal Server Error. Something went wrong on the server side.";
      case 502:
        return "Bad Gateway. The server received an invalid response from an upstream server.";
      case 503:
        return "Service Unavailable. The server is temporarily down for maintenance.";
      case 504:
        return "Gateway Timeout. The server did not get a timely response from an upstream server.";
      case 201:
        return "Created. The resource was successfully created.";
      case 204:
        return "No Content. The request was successful, but there is no content to return.";
      case 200:
        return "OK. The request was successful.";
      default:
        return "An unknown error occurred. Please try again.";
    }
  }
}
