import 'package:avangers_order/src/config/constants/spacements.dart';
import 'package:avangers_order/src/data/models/marvel_film_model.dart';
import 'package:avangers_order/src/ui/blocs/states/base_page_state.dart';
import 'package:avangers_order/src/ui/components/custom_behavior.dart';
import 'package:avangers_order/src/ui/components/custom_icon.dart';
import 'package:avangers_order/src/ui/components/custom_image.dart';
import 'package:avangers_order/src/ui/pages/home/components/home_banner.dart';
import 'package:avangers_order/src/ui/pages/home/components/skeleton_home_banner.dart';
import 'package:avangers_order/src/ui/pages/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/home_error_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = Modular.get<HomeBloc>();
    _homeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          splashRadius: 24,
          icon: const CustomIcon(
            asset: CustomIcons.menu,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const CustomIcon(asset: CustomIcons.marvel_white),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const CustomImage(
              image: CustomImages.avengers,
            ).asset(context),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.2),
                Colors.black,
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacements.L),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'MARVEL CINEMATIC UNIVERSE',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: Spacements.XL),
                      Text(
                        'LINHA DO TEMPO',
                        textAlign: TextAlign.start,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Spacements.S),
                BlocBuilder<HomeBloc, BaseState>(
                  bloc: _homeBloc,
                  builder: (_, state) {
                    return SizedBox(
                      height: 260,
                      child: Visibility(
                        visible: state is! ErrorState,
                        replacement: HomeErrorWidget(onPressed: _homeBloc),
                        child: ScrollConfiguration(
                          behavior: CustomBehavior(),
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Spacements.L,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                state is SuccessState ? state.data.length : 8,
                            separatorBuilder: (_, i) =>
                                const SizedBox(width: Spacements.S),
                            itemBuilder: (_, i) {
                              if (state
                                  is SuccessState<List<MarvelFilmModel>>) {
                                final list = state.data;
                                final film = list[i];
                                return HomeBannerComponent(film: film);
                              } else if (state is LoadingState) {
                                return const SkeletonHomeBanner();
                              } else {
                                return const SizedBox.shrink(
                                  key: Key('EmptyStateKey'),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: Spacements.L),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
