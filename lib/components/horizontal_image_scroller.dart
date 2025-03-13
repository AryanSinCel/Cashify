import 'package:flutter/material.dart';

class HorizontalImageScroller extends StatelessWidget {
  final List<String> imageUrls;
  final double imageWidth;
  final double imageHeight;
  final double spacing;

  const HorizontalImageScroller({
    super.key,
    required this.imageUrls,
    this.imageWidth = 200,
    this.imageHeight = 100,
    this.spacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      child: Row(
        children: imageUrls.map((imageUrl) {
          return Padding(
            padding: EdgeInsets.only(right: spacing),
            child: Image.network(
              imageUrl,
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress){
                if(loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(),
                );
              },errorBuilder: (context, error, stackTrace){
              return Icon(Icons.error); //To display if image is unable to fetch
            },
            ),
          );
        }).toList(),
      ),
    );
  }
}
