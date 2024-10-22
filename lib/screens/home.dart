import 'package:flutter/material.dart';

class HomeMaterialStatefulPage extends StatefulWidget {
  const HomeMaterialStatefulPage({super.key});

  @override
  State<HomeMaterialStatefulPage> createState() => _HomeMaterialStatePage();
}

class _HomeMaterialStatePage extends State<HomeMaterialStatefulPage> {
  double convertResult = 0;
  TextEditingController textEditingController = TextEditingController();

  void _performConversion() {
    setState(() {
      final enteredAmount = double.tryParse(textEditingController.text) ?? 0;
      convertResult = enteredAmount * 80;
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Currency Converter",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor:
            Colors.black, // You can customize the AppBar's color if needed
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
            child: Text(
              "${convertResult.toStringAsFixed(2)} INR",
              style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          HomeTextField(controller: textEditingController),
          ConvertButton(onButtonPressed: _performConversion)
        ],
      )),
      backgroundColor: Colors.black,
    );
  }
}

class HomeTextField extends StatelessWidget {
  const HomeTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white60,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: "Enter the amount in INR..",
            hintStyle: const TextStyle(color: Colors.white60),
            prefixIcon: const Icon(Icons.monetization_on_outlined),
            prefixIconColor: Colors.white,
            focusedBorder: border,
            enabledBorder: border),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ConvertButton extends StatelessWidget {
  const ConvertButton({super.key, required this.onButtonPressed});

  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
      child: TextButton(
        onPressed: onButtonPressed,
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(Colors.blueGrey),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          minimumSize: const WidgetStatePropertyAll(
            Size(double.infinity, 50),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        child: const Text("Convert"),
      ),
    );
  }
}
