import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget customNetworkImage ({required String imageUrl}) {
  return CachedNetworkImage(
    imageUrl: imageUrl.toString(),
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    placeholder: (context, url) => Container(decoration: BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.circular(12.0)),child: const Center(child: SizedBox(height: 26.0,width: 26.0,child: CircularProgressIndicator(color: Colors.white,strokeWidth: 0.4,)))),
    errorWidget: (context, url, error) => Container(decoration: BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.circular(12.0)), child: const Icon(Icons.error)),
  );
}