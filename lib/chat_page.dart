import 'package:flutter/material.dart';


class StaffMessage extends StatefulWidget {
  final String text;
  final bool showTime;
  const StaffMessage({super.key, required this.text, this.showTime = false});

  @override
  State<StaffMessage> createState() => _StaffMessageState();
}

class _StaffMessageState extends State<StaffMessage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, color: Colors.white, size: 18),
        ),
        SizedBox(width: 8),
        Flexible(
          child: Container(
            padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color:  Color(0xFFF1F1F1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  style:  TextStyle(fontSize: 15, color: Colors.black87),
                ),
                if (widget.showTime)
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "26 minutes ago",
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomerMessage extends StatefulWidget {
  final String text;
  const CustomerMessage({super.key, required this.text});

  @override
  State<CustomerMessage> createState() => _CustomerMessageState();
}

class _CustomerMessageState extends State<CustomerMessage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFE53935),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              widget.text,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(
            'assets/images/womens.png',
          ),
        ),
      ],
    );
  }
}