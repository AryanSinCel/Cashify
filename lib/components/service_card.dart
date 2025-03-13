import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const ServiceCard({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            height: 60,
            width: 60,
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
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
