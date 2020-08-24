import 'package:cloud_functions/cloud_functions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/styles/text_styles.dart';

class ContactMe extends StatefulWidget {
  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final descriptionController = TextEditingController();
  final subjectController = TextEditingController();
  bool sending = false;

  sendMessage() async {
    try {
      setState(() {
        sending = true;
      });
      final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
        functionName: 'sendMail',
      );
      print(emailController.text);
      await callable.call(<String, String>{
        'description': descriptionController.text,
        'subject': subjectController.text,
        'email': emailController.text,
      });
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content:Icon(Icons.check),

        ),
      );
      setState(() {
        emailController.clear();
        subjectController.clear();
        descriptionController.clear();
        print(":lolz");
        sending = false;
      });
    } catch (e) {
      print(e.toString());
      // TODO
      setState(() {
        sending = false;
      });
    }

// HTML message to multiple recipients
  }

//

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Send me a message.",style: subTitleTextStyle(DeviceScreenType.mobile),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 300,
                  ),
                  padding: EdgeInsets.only(left: 8),
                  child: TextFormField(
                    validator: (string) {
                      if (EmailValidator.validate(string)) {
                        return null;
                      } else {
                        return "Enter a valid email";
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Your Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.blueGrey, width: 1),
                        ),
                        isDense: true),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300),
                  padding: EdgeInsets.only(left: 8),
                  child: TextFormField(
                    validator: (string) {
                      return null;
                    },
                    controller: subjectController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.blueGrey, width: 1),
                        ),
                        hintText: "Subject",
                        isDense: true),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 300,
                  ),
                  padding: EdgeInsets.only(left: 8),
                  child: TextFormField(
                    validator: (string) {
                      if (string.trim().isNotEmpty) {
                        return null;
                      } else {
                        return "Description can't be empty";
                      }
                    },
                    controller: descriptionController,
                    decoration: InputDecoration(
                        hintText: "Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.blueGrey, width: 1),
                        ),
                        isDense: true),
                    maxLines: 5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedGradientButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      print("reached sendmessage");
                      sendMessage();
                    } else {
//                    showDialog(context: context,child: Text(""))
                    }
                  },
                  child: !sending
                      ? Text(
                          "Send",
                          style: TextStyle(color: Colors.white),
                        )
                      : SizedBox(
                          width: 15,
                          height: 15,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        ),
                  gradient: LinearGradient(
                      colors: [Colors.blueGrey, Colors.grey],
                      end: Alignment.centerRight,
                      begin: Alignment.centerLeft),
                  height: 20,
                  width: 250,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
//sendMessages() async {
////    String username = 'suryanshtomar.st10@gmail.com';
////    String password = '236147.jayu';
////
////    final smtpServer = gmail(username, password);
////    // Use the SmtpServer class to configure an SMTP server:
////    // final smtpServer = SmtpServer('smtp.domain.com');
////    // See the named arguments of SmtpServer for further configuration
////    // options.
////
////    // Create our message.
////    final message = Message()
////      ..from = Address(username, 'Your name')
////      ..recipients.add(username)
////      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
////      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
////      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";
////
////    try {
////      final sendReport = await send(message, smtpServer);
////      print('Message sent: ' + sendReport.toString());
////    } on MailerException catch (e) {
////      print('Message not sent.');
////      for (var p in e.problems) {
////        print('Problem: ${p.code}: ${p.msg}');
////      }
////    }
//print("hell1");
//    var accountCredentials = new ServiceAccountCredentials.fromJson(r'''
//{
//  "type": "service_account",
//  "project_id": "portfolio-sound-mixer",
//  "private_key_id": "37ff53076a59b7c63bcc33c186c251ef8992bd10",
//  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCw6DIyFyHlAhPk\nrp0didOThNs+0a0CN9SOd6H1Lvsn0HMcy/MN1GpU92w226trDJ/K2YwrvttBhhk8\nUFpptB6T8ymoKlN8N+TQu16fiDc7YFNtLtLVb1+XXHhPRxgICgUikG0LgEZZrUPA\nHXp6hPk7Qln2eAeBJuOkpvfCOfNFETTXB7pLZ6PgmKp9yGN7leScn7FTa6k7uYnc\nXUSA0MWPslgZVdYMkkLYuRqzbcbCIDaSSqeUmLQFPCmOkwIL4vTJ2aERVtW0+up1\ntvhwi7xnhUA6GHU0EtayRPQuQTnMTrbBQk7T4d580tml3wFYdWVZhgAmc3lLfMPb\noW4iRUOpAgMBAAECggEAUhyEZ/GKvvP27dcKgBJgDQHGjeLerb/iPfpTRy12T+WV\n+JDFkO6+KA/rv464guiKJqpRQGDG/iPTBMa7IIMFCmD8PdzfgTGkWCoP4nZkRIAS\nWQQ5we1+7g9ynEGAawLTnVZx9ruka61bXAmSttmPoSzL+vV9bjnxwZPqPdGOE8kA\nK9jDORSMtZVhiM31aG9t+pQM4x58p3zf+0+YKjWyqEcTWGRQ/aKQ1UUB8IDqMDb8\no/a7AMa2UahdEyzl7rtviiPmoygK6sBH33+480ReBQaPK2Kuac/E1kHzIgm+X7aX\njkKIVt7MY890jUMBqdFvl1ejw64XX4Itou0OuoJDPQKBgQD1jaqQ/yxXbw3xaBbu\ngzRsgAWN0YSmDeETpgKwhZY+c8yRUb6LWy6ejMxrHVYf1yJPjoRHxQjvAncobyla\nJqVaToXuAXZSGwbUzLQJt6ju0cI6y81qauD5Mdg+Ny6UVtasZilO9aTJhhS5yfRp\nZhDMuj4x3GvAfbiWGc8iQuRt9wKBgQC4buYejVi2rMnOiPf0R/HsO5a8HA0jS0EZ\ni2HUFgrg8HltI5yzLOczsdUtxtz2fyAHl7rWJBebq1lVwXv54p7HP7j8QxkksJcc\nLy3u9TuhHNa83s4cg4tNhihYlWZyg6QyI3fxAJ/Wyo+h75ih/QVxm8LAUPdLN3jy\n4R0sshnzXwKBgHO8Dr2Cl7qqDC9Q+SX3zzioanW6X8QIXKJvJ2tduz+6QpvnpGB4\nXJO8FwkRbataMcC/kldlZd2JEvKK2jm0Z1EWG4ffRo5SULjxtpWx67yMPviJYEsd\nDuZE+P/x8FFYUJw3FpcxrjaRrKkYp8sZoSdtTK0hj+PNHbgZeAhU8OdnAoGBAJAM\nthl4xqhvDnQNELUwGCktZY7oze4aEe+UqMUQrlCAIib3IKXlVXNP2zQU1XKFWgv0\nG060A+hnDbBoHZ/Pu7nd8Gq/MX0xm+S8iMDRs1AkCSidURh+OahEN3Dwx4J7hRxQ\nDZcjqLQHo+WUEH+88qqIQLUax/tsiUASSUomlRQ7AoGAQj2uAGQsXrGqA00lnuVo\ncRnFu6hA/TTKkxjEdhWm+AlPpvoLry5tDDaX3T+DhiePUWujAXHoNhgb35xI0WRd\nQ1pULNISUOeX1Tk6XI1wMM1RGhnapfZMgMBp4JBuozIsUGjPT3418tCXJRVY0Qjt\nCcxSL+UCvwVl8j7u0WymEiY=\n-----END PRIVATE KEY-----\n",
//  "client_email": "jayutomar@portfolio-sound-mixer.iam.gserviceaccount.com",
//  "client_id": "104472485081790115402",
//  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//  "token_uri": "https://oauth2.googleapis.com/token",
//  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/jayutomar%40portfolio-sound-mixer.iam.gserviceaccount.com"
//}
//
//''');
//    var scopes = [GmailApi.GmailSendScope];
//
//    var content = '''
//Content-Type: text/html; charset="us-ascii"
//MIME-Version: 1.0
//Content-Transfer-Encoding: 7bit
//
//subject: helllll
//
//yeah''';
//
//    var bytes = utf8.encode("content");
//    var base64 = base64Encode(bytes);
//    var body = json.encode({'raw': base64});
//String from = 'me';
//    String to= 'suryanshtomar.st10@gmail.com';
//    String subject= 'Some subject';
//    String contentType= 'text/html';
//    String charset= 'utf-8';
//    String contentTransferEncoding='base64';
//    String emailContent= '<table></table>';
//print("hell12");
////    var client = new http.Client();
//    clientViaServiceAccount(accountCredentials, scopes).then((http_client) {
//      var gmail = new GmailApi(http_client);
////      Message message = Message.fromJson({"payload":{"body":{"data":base64}}});
//      gmail.users.messages.send( Message.fromJson({
//        'raw': getBase64Email(
//            source: 'From: $from\r\n'
//                'To: $to\r\n'
//                'Subject: $subject\r\n'
//                'Content-Type: $contentType; charset=$charset\r\n'
//                'Content-Transfer-Encoding: $contentTransferEncoding\r\n\r\n'
//                '$emailContent'), // emailContent is HTML table.
//      }), from);
//    });
//    print("hell3");
////    obtainAcc
////    essCredentialsViaServiceAccount(accountCredentials, scopes, client)
////        .then((AccessCredentials credentials) {
////    // Access credentials are available in [credentials].
////    // ...
////    client.close();
////    });
//  }
//String getBase64Email({String source}) {
//  List<int> bytes = utf8.encode(source);
//  String base64String = base64UrlEncode(bytes);
//
//  return base64String;
//}
