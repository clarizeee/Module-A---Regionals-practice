import 'package:flutter/material.dart';
import 'models.dart';
import 'handlers.dart';
import 'package:provider/provider.dart';
import 'styles.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'pages/eventDetails.dart';
class eventItem extends StatefulWidget {
  final Event event;
  const eventItem({super.key, required this.event});

  @override
  State<eventItem> createState() => _eventItemState();
}

class _eventItemState extends State<eventItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),

      child: InkWell(
        borderRadius: BorderRadius.circular(16),

        onTap: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => eventDetails(event: widget.event)));
        },

        child: Ink(
          padding: const EdgeInsets.all(12),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),

          child: SizedBox(
            height: 120,

            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),

                  child: Image.asset(
                    widget.event.images[0],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        widget.event.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        widget.event.text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 8),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),

                        decoration: BoxDecoration(
                          color: widget.event.viewCount > 0
                              ? Colors.green.withOpacity(0.15)
                              : Colors.red.withOpacity(0.15),

                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Text(
                          widget.event.viewCount > 0 ? "Read" : "Unread",

                          style: TextStyle(
                            color: widget.event.viewCount > 0
                                ? Colors.green
                                : Colors.red,

                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ticketItem extends StatelessWidget {
  final Ticket ticket;
  const ticketItem({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: BehindMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (context) {
              context.read<ProviderClass>().removeTickets(ticket);
            },
            backgroundColor: Color.fromARGB(255, 192, 67, 67),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Delete',
          ),          
        ],),
      child: Container(
        child: Row(children: [
          Image.asset(ticket.image, width: 100, height: 100,),
          Expanded(
            child: Column(children: [
              Text(ticket.name),
              Text(ticket.seat)
            ],),
          )
        ],)
      ),
    );
  }
}