import 'package:flutter/material.dart';

class AcaoRapidaCard extends StatelessWidget {
  //Variaveis
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const AcaoRapidaCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFB7DD89),
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsets.all(14),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xFF4CAF50),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child:Text(
                title,
                style: TextStyle(
                fontSize: 14,
                fontWeight:FontWeight.bold)
              )
              )
          ],
        ),
      ),
    );
  }
}
