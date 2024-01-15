import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tolk_tik/domain/entities/video_post.dart';

import '../../../config/theme/helpers/human_formats.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost videos;
  const VideoButtons({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          likes: videos.likes,
          iconFigure: Icons.favorite,
        ),
        _CustomIconButton(
            likes: videos.views, iconFigure: Icons.remove_red_eye_outlined),
        _CustomIconButton(likes: (videos.likes) * 5, iconFigure: Icons.comment),
        SpinPerfect(
            infinite: true,
            duration: const Duration(seconds: 5),
            child: const _CustomIconButton(
                likes: 0, iconFigure: Icons.play_circle_outline)),
        const _CustomIconButton(
          likes: 0,
          iconFigure: Icons.share,
        )
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int likes;
  final IconData iconFigure;
  final Color? color;
  const _CustomIconButton(
      {super.key, required this.likes, required this.iconFigure, color})
      : color = color ?? Colors.white70;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconFigure,
            size: 35,
          ),
          color: color,
        ),
        if (likes > 0) Text(HumanFormats.humanReadbleNumber(likes.toDouble()))
      ],
    );
  }
}
