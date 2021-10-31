import 'package:cgc_landran_information/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:cgc_landran_information/Page/home_page.dart';


class GoogleSignInButtonWidget extends StatelessWidget {
  const GoogleSignInButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: OutlinedButton.icon(
        label: Text(
          'Sign In With Google',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        ),
        icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
        onPressed: () {
          
            final provider = Provider.of<GoogleSignInProvider>(context,
                listen: false);
              

            
          
        },
      ),
    );
  }
}
