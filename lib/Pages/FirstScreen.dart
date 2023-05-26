import 'package:flutter/material.dart';
import 'package:jazzcash/Pages/AppBar.dart';
import 'package:jazzcash/Pages/SecondContainer.dart';

import 'FirstContainer.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  bool _isScrolledToTop = true;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isScrolledToTop = _scrollController.position.pixels == 0;
      });
    });

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 222.0, end: 50.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ApplicationToolBar(),
      ),
      body: Stack(
        children: [
          NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  expandedHeight: _isScrolledToTop ? _animation.value : 50.0,
                  flexibleSpace: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Container(
                            color: const Color(0xfff3f3f3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Divider(
                                  height: 0.1,
                                  color: Colors.white,
                                ),
                                FirstContainer(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ];
            },
            body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SecondContainer(),
                  ]),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.grey,
              ),
              height: 25.0,
              width: 500,
              child: const SizedBox(
                width: 50,
                child: Icon(
                  Icons.expand_less_sharp,
                  color: Colors.black38,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
