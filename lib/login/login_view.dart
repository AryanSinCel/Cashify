import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController contact = TextEditingController();
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(66, 200, 186, 1),
          title: const Text("Login/Signup", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.close),color: Colors.white,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter your phone number",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8), // Adds spacing
            Row(
              children: [
                const Text("+91"),
                const SizedBox(width: 10), // Adds spacing
                Expanded( // Fixes width issue
                  child: TextField(
                    controller: contact,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "Enter phone number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),

            ///Terms and Condition
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = newBool!;
                    });
                  },
                ),
                Expanded( // Ensures proper text wrapping
                  child: Wrap( // Wrap helps in breaking text properly on small screens
                    alignment: WrapAlignment.start,
                    children: [
                      const Text("I agree to the "),
                      GestureDetector(
                        onTap: () {
                          /// Navigate to Terms
                        },
                        child: const Text(
                          "Terms and Conditions",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue, // Optional: Change to match theme
                          ),
                        ),
                      ),
                      const Text(" & "),
                      GestureDetector(
                        onTap: () {
                          /// Navigate to Privacy Policy
                        },
                        child: const Text(
                          "Privacy Policy",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue, // Optional: Change to match theme
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20,),

            ///Continue Button
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: Color.fromRGBO(66, 200, 186, 1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 40,
                    width: 400,
                    child:
                        Align(
                          alignment: Alignment.center,
                          child:  Text("CONTINUE", style: TextStyle(color: Colors.white),),
                        )
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),

            Align(
              alignment: Alignment.center,
              child: Text("OR", style: TextStyle(color: Colors.grey),),
            ),

            SizedBox(height: 20,),

            ///Login with true-caller
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black), // Added border color
                  borderRadius: BorderRadius.circular(5), // Ensures rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 40,
                    width: 400,
                    child: Center( // Centers the Row inside
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // Ensures row content stays centered
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.call, color: Colors.lightBlue),
                          SizedBox(width: 15), // Adds spacing between elements
                          Text("Login with ", style: TextStyle(color: Colors.black)),
                          Text("truecaller", style: TextStyle(color: Colors.lightBlue)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
