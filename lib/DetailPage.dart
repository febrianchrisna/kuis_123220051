import 'package:flutter/material.dart';
import 'newsmodel.dart';

class DetailPage extends StatefulWidget {
  final NewsModel news;
  final String username;
  final Function onLikeUpdated;

  const DetailPage({
    super.key,
    required this.news,
    required this.username,
    required this.onLikeUpdated,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      if (!_isLiked) {
        widget.news.likes++;
        _isLiked = true;
      } else {
        widget.news.likes--;
        _isLiked = false;
      }
      widget.onLikeUpdated();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // News Image
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.network(
                widget.news.image,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value:
                      loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image_not_supported, size: 40),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    widget.news.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    widget.news.description,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: _isLiked ? Colors.red : Colors.grey,
                          size: 30,
                        ),
                        onPressed: _toggleLike,
                      ),
                      Text(
                        '${widget.news.likes} likes',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
