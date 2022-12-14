import 'dart:convert';

import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart';
import 'package:app_de_libros/data/book_model.dart';

/// Implementation of a public API service for IT Bookstore.
/// Reference documentation available at <link>https://api.itbook.store/</link>.
class HttpService {
  Client client = Client();
  final HtmlUnescape _htmlUnescape = HtmlUnescape();
  final String _newBooksUrl = "https://api.itbook.store/1.0/new";
  final String _searchUrl = "https://api.itbook.store/1.0/search";
  final String _detailsUrl = "https://api.itbook.store/1.0/books";

  // Get newly released books.
  Future<List<Book>> getNewBooks() async {
    final Response res = await client.get(Uri.parse(_newBooksUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(_htmlUnescape.convert(res.body))['books'];

      List<Book> books = body
          .map(
            (dynamic item) => Book.fromJson(item),
          )
          .toList();

      return books;
    } else {
      throw Exception("No se pueden obtener los libros más nuevos");
    }
  }

  // Search books by title, author, ISBN or keywords.
  // /search/{query}
  // /search/{query}/{page}
  Future<List<Book>> search(String query) async {
    final Response res = await client.get(Uri.parse("$_searchUrl/$query"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(_htmlUnescape.convert(res.body))['books'];

      List<Book> books = body
          .map(
            (dynamic item) => Book.fromJson(item),
          )
          .toList();

      return books;
    } else {
      throw Exception("Search query \"$query\" has failed.");
    }
  }

  // Get book details by ISBN.
  Future<Book> getBook(String isbn) async {
    final Response res = await client.get(Uri.parse("$_detailsUrl/$isbn"));

    if (res.statusCode == 200) {
      Book book = Book.fromJson(jsonDecode(_htmlUnescape.convert(res.body)));
      return book;
    } else {
      throw Exception("Unable to get details for book with ISBN \"$isbn\".");
    }
  }
}
