import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late final Box box;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('peopleBox');
  }

  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  _addInfo() async {
    // Add info to people box
    box.put('name', 'John');
    box.put('country', 'Italy');
    print('Info added to box');
  }

  _getInfo() {
    // Get info from people box
    var name = box.get('name');
    var country = box.get('country');
    print('Info retrieved from box: $name ($country');
  }

  _updateInfo() {
    // Update info of people box
    box.put('name', 'Mike');
    box.put('country', 'United States');
    print('Info updated in box !');
  }

  _deleteInfo() {
    // Delete info from people box
    box.delete('name');
    box.delete('country');
    print('Info deleted from box');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('People Info'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: _addInfo,
              child: Text('Add'),
            ),
            ElevatedButton(
              onPressed: _getInfo,
              child: Text('Get'),
            ),
            ElevatedButton(
              onPressed: _updateInfo,
              child: Text('Update'),
            ),
            ElevatedButton(
              onPressed: _deleteInfo,
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
