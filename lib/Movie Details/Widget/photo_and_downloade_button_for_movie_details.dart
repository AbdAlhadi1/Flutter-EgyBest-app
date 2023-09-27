import 'package:Mova/Main%20calsses/movie.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
// ignore: must_be_immutable
class PhotoAndDownloadButton extends StatefulWidget {
  Movie? movie;
  PhotoAndDownloadButton({super.key,required this.movie});

  @override
  State<PhotoAndDownloadButton> createState() => _PhotoAndDownloadButtonState();
}

class _PhotoAndDownloadButtonState extends State<PhotoAndDownloadButton> {
  late final WebViewController webViewController;
  @override
  void initState() {
    webViewController = WebViewController()..loadRequest(Uri.parse("https://adel.pythonanywhere.com/movies/${widget.movie!.moveInfo.movieId}/"));
    super.initState();
  }
  lunchLink()async{

    if (await canLaunchUrl(Uri.parse( widget.movie!.moveInfo.movieUrl))) {
      await launchUrl (Uri.parse( widget.movie!.moveInfo.movieUrl) , mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $Uri.parse( sponserImageController.link.value)';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
         Padding(
          padding: const EdgeInsets.only(top: 40,bottom: 25),
          child: Center(
            child: SizedBox(
              height:420,
              width: 300,
              child: Image(image: NetworkImage(widget.movie!.moveInfo.movieImage),fit: BoxFit.fill,),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(right: 78,left: 78),
            backgroundColor: Colors.green,
          ),
          onPressed: (){
            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WebPage(webViewController: webViewController)));
            lunchLink();
            //lunchLink(movie!);
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.download_for_offline),
              SizedBox(width: 7,),
              Text("مشاهدة وتحميل الفيلم"),
            ],
          ),
        )
      ],
    );
  }
}

class WebPage extends StatefulWidget {
  WebViewController webViewController;
  WebPage({super.key,required this.webViewController});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: WebViewWidget(
            controller: widget.webViewController,
          ),
        )
    );
  }
}

