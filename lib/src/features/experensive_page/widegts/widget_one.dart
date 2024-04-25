import 'package:flutter/material.dart';

class WidgetOne extends StatefulWidget {
  const WidgetOne({Key? key}) : super(key: key);

  @override
  State<WidgetOne> createState() => _WidgetOneState();
}

class _WidgetOneState extends State<WidgetOne> {
  final List<TextEditingController> textControllers = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 14),
                  child: Icon(Icons.check),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: textControllers[index],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Option text',
                    ),
                  ),
                ),
                if (textControllers[index].text.isNotEmpty)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        textControllers[index].clear();
                      });
                    },
                    icon: const Icon(Icons.cancel),
                  ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.grain),
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
          ),
          itemCount: textControllers.length,
        ),
      ),
    );
  }
}
