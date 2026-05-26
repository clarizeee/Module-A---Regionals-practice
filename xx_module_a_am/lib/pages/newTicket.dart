import 'package:flutter/material.dart';
import 'package:xx_module_a_am/models.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';
import 'dart:io';

class ticketCreate extends StatefulWidget {
  const ticketCreate({super.key});

  @override
  State<ticketCreate> createState() => _ticketCreateState();
}

class _ticketCreateState extends State<ticketCreate> {
 
  String? _pickedType;
  final TextEditingController nameCont = TextEditingController();
  final _picker = ImagePicker();
  String? what = "";
  String? path;
  String url = "";

  pickImage() async {
    final ImageSource? source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text("Gallery"),
            onTap: () => Navigator.pop(context, ImageSource.gallery),
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text("Camera"),
            onTap: () => Navigator.pop(context, ImageSource.camera),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
    if (source != null) {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        //  final directory = await getApplicationDocumentsDirectory();
        //  final newPath = '${directory.path}/${pickedFile.name}';
        // final newFile = await File(pickedFile.path).copy(newPath);
        path = pickedFile.path;


        if (what == "") {
          what = url;
        }
      }
    }
  }

  final now = DateTime.now();



  final random = Random();





   @override
  Widget build(BuildContext context) {
    final year = now.year;
    final month = now.month;
    final day = now.day;
    final hour = now.hour;
    final minute = now.minute;
    final numericId = DateTime.now().millisecondsSinceEpoch; 
    final a = random.nextInt(10);
    final row = random.nextInt(10);
    final column = random.nextInt(10);

    Ticket newTicket = Ticket(
      id: numericId,
      type: "",
      image: "",
      name: "",
      seat: "A$a Row$row Column$column",
      time: "$year-$month-$day $hour:$minute",
    );

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Create new ticket"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              spacing: 10,
              children: [
                SizedBox(
                  width: width * 0.7,
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: DropdownButton<String>(
                        value: _pickedType,  
                        items: ["Opening ceremony", "Closing ceremony"].map((t) {
                          return DropdownMenuItem<String>(value: t, child: Text(t));
                        }).toList(),
                                  
                        onChanged: (newVal) {
                          setState(() {
                            _pickedType = newVal;
                          });               
                        },
                      ),
                    ),
                  ),
                ),
          
                SizedBox(
                  width: width * 0.7,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all()
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        controller: nameCont,
                        decoration: InputDecoration(
                          hint: Text("Input your name")
                        ),
                      ),
                    ),
                  ),
                ),

                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.grey,
                    focusColor: Colors.grey,
                    hoverColor: Colors.grey,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                     await pickImage();
                     setState(() {
                       
                     });
                    },
                    child: Container(
                      width: width * .7,
                     // height: 89.2,
                      decoration: BoxDecoration(
                        border: Border.all()
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Choose one picture"),
                      ),
                    ),
                  ),
                ),
              SizedBox(
                width: width * 0.7,
                height: 200,
                child: path == null ? Image.asset("assets/image0.png", fit: BoxFit.cover) : Image.file(File(path!), fit: BoxFit.cover)
              ),
              ElevatedButton(onPressed: () {
                //TODO: add ticket here
              }, child: Text("Create"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}