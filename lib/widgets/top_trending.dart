import 'package:bookmark/screens/screens.dart';
import 'package:bookmark/services/services.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class TopTrending extends StatelessWidget {
  const TopTrending({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, NewsDetailsScreen.routeName);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  boxFit: BoxFit.fill,
                  errorWidget: Image.asset(
                    'assets/images/empty_image.jpg',
                  ),
                  imageUrl:
                      'https://classic.exame.com/wp-content/uploads/2016/09/size_960_16_9_smartphone-metro1.jpg?quality=70&strip=info&w=960',
                  height: size.height * 0.33,
                  width: double.infinity,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const NewDetailsWebView(),
                          inheritTheme: true,
                          ctx: context,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.link,
                      color: color,
                    ),
                  ),
                  const Spacer(),
                  SelectableText(
                    '7-4-2024',
                    style: GoogleFonts.montserrat(fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
