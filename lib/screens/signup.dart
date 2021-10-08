// ignore_for_file: prefer_const_constructors


import "package:flutter/material.dart";

class SignUP extends StatefulWidget {

  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Padding( 
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder()
                  
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding( 
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder()
                ),
                obscureText: true,
              ),
            ),
            Padding( 
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text("Confirm Password"),
                  border: OutlineInputBorder()
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height:20),
            InkWell(
              
              onTap: (){},
              child: Container(
                
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Sign Up", 
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),)),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}