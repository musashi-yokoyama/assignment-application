class SrarchRangePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _SrarchRangePage createState() => _SrarchRangePageState();
}

class _SrarchRangePageState extends State<MyHomePage> {
  double _sliderValue = 1.5; // Change initial value to be slightly below half
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_getDistanceText(_sliderValue)}',
              style: TextStyle(fontSize: 45,), // increase font size
            ),
          ],
        ),
      ),
      body: _selectedIndex == 0
          ? Column(
        children: [
          Spacer(), // Use Spacer to push slider to the bottom
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                _sliderValue += details.primaryDelta! / 100;
                if (_sliderValue < 0) {
                  _sliderValue = 0;
                } else if (_sliderValue > 4) {
                  _sliderValue = 4;
                }
              });
            },
            child: Slider(
              value: _sliderValue,
              onChanged: (newValue) {
                setState(() {
                  _sliderValue = newValue;
                });
              },
              min: 0,
              max: 4,
              divisions: 4,
            ),
          ),
          SizedBox(height: 1), // Add some space for the button
          ElevatedButton(
              onPressed: () {},
              child: Text('検索する'),
              style: ElevatedButton.styleFrom(fixedSize: Size(100, 40))
          ),
        ],
      )
          : SearchCategoryPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '周囲で探す',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'カテゴリで探す',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.brown,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  String _getDistanceText(double value) {
    switch (value.toInt()) {
      case 0:
        return '300m';
      case 1:
        return '500m';
      case 2:
        return '1000m';
      case 3:
        return '2000m';
      case 4:
        return '3000m';
      default:
        return '';
    }
  }
}