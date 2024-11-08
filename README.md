<p><strong>flutter_arc_text</strong> is a Flutter package that allows you to display text along an arc. This can be useful for creating logos, unique UI elements, or adding a creative touch to your Flutter applications. The package also supports animations, allowing for dynamic text displays along curved paths.</p>

<h2>Features</h2>

<ul>
  <li><strong>Arc Text Display</strong>: Easily render text along a customizable arc.</li>
  <li><strong>Animation Support</strong>: Animate text around the arc for eye-catching effects.</li>
  <li><strong>Customization</strong>: Adjust the radius, angle, and position of the text on the arc.</li>
  <li><strong>Compatibility</strong>: Works seamlessly on iOS, Android, and web platforms.</li>
</ul>

<h2>Installation</h2>

<p>Add <code>flutter_arc_text</code> as a dependency in your <code>pubspec.yaml</code> file:</p>

<pre>
<code>
dependencies:
  flutter_arc_text: ^0.0.1
</code>
</pre>

<p>Then, run <code>flutter pub get</code> to fetch the package.</p>

<h2>Usage</h2>

<p>Here’s a simple example to get you started with displaying text along an arc.</p>

<pre>
<code>
import 'package:flutter_arc_text/flutter_arc_text.dart';

class ArcTextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ArcText(
        text: "Hello Flutter!",
        radius: 100, // Adjust the radius as needed
        startAngle: -45, // Adjust start angle of the text
        sweepAngle: 180, // Adjust arc coverage
        style: TextStyle(
          fontSize: 24,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
</code>
</pre>

<h2>Parameters</h2>

<ul>
  <li><strong>text</strong>: The text to display along the arc.</li>
  <li><strong>radius</strong>: The radius of the arc (distance from the center).</li>
  <li><strong>startAngle</strong>: The starting angle of the text on the arc.</li>
  <li><strong>sweepAngle</strong>: The arc coverage or the angle span.</li>
  <li><strong>style</strong>: The text style, including font size, color, and weight.</li>
</ul>

<img src="https://github.com/user-attachments/assets/2b5b897e-0bda-4ada-818c-cc864e4f3cd3" alt="Image 1" height="400" width="200">
<img src="https://github.com/user-attachments/assets/2110df81-092f-48a9-83e7-5b875cca8cd9" alt="Image 2" height="400" width="200">
<img src="https://github.com/user-attachments/assets/47c77dae-fff9-47f8-b74a-803720928d73" alt="arc_text_demo_vid" height="400" width="200">

<h2>Additional Information</h2>

<h3>Contributing</h3>

<p>Contributions are welcome! If you'd like to help improve this package, please fork the repository and submit a pull request. For major changes, consider opening an issue first to discuss what you’d like to add or change.</p>

<h3>Filing Issues</h3>

<p>If you encounter any bugs or have feature requests, please open an issue on the GitHub Issues page. We’ll do our best to respond promptly.</p>

<h3>License</h3>

<p>This package is open-source and available under the MIT License.</p>
