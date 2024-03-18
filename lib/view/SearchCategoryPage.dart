import "package:flutter/material.dart";

class SearchCategoryPage extends StatelessWidget {
  final List<String> categories = [
    "ラーメン",
    "居酒屋",
    "中華",
    "和食",
    "洋食",
    "カフェ・スイーツ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('今あなたが食べたいものは'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            categoryName: categories[index],
            imagePath: 'assets/images/${categories[index].toLowerCase()}.jpg',
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final String imagePath;

  const CategoryItem({
    required this.categoryName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        margin: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(
              categoryName,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}