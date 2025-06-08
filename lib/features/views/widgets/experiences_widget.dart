import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';

class ExperiencesWidget extends StatelessWidget {
  const ExperiencesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final padding = SpacingSize.getPadding(size.width);

    return DecoratedBox(
      decoration: BoxDecoration(color: theme.cardTheme.color),
      child: AnimatedPadding(
        duration: Durations.medium1,
        padding: EdgeInsets.all(padding),
        child: Column(
          spacing: padding,
          children: [
            ExperienceWidget(
              period: 'DEZ 2021 - AGO 2024',
              company: 'Gupy',
              ocupattion: 'Desenvolvedor Mobile Pleno',
              skills: ['Flutter', 'Dart', 'Dart Web'],
              descriptions: [
                'Contribuição no Aumento de Engajamento: Colaborei no desenvolvimento de um aplicativo de treinamento corporativo utilizando Flutter/Dart com gamificação, que resultou em 70% de engajamento, NPS de 8.0 e avaliação de 4.8 estrelas.',
                'Melhoria de UX e Performance: Participei do desenvolvimento front-end de uma plataforma web, ajudando a melhorar a responsividade da interface e contribuindo para o aumento de 30% no engajamento dos usuários.',
              ],
            ),
            ExperienceWidget(
              period: 'SET 2017 - DEZ 2021',
              company: 'Pulse',
              ocupattion: 'Desenvolvedor Mobile Junior',
              skills: ['React Native', 'TypeScript', 'ReactJs', 'JavaScript'],
              descriptions: [
                'Melhoria de processos: Colaborei no desenvolvimento de um aplicativo de micro gerenciamento de rotinas e acompanhamentos de indicadores do grupos de supermercados utilizando React Native/JavaScript tanto para Gestores quanto para Colaboradores.',
                'Melhoria significativa de UX: Participei do desenvolvimento front-end de uma plataforma web com React, ajudando a melhorar a responsividade da interface e contribuindo para o aumento no engajamento dos clientes de diferentes setores do mercado, criando e melhorando rotinas do varejo, atacado e suas logísticas e processos.',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({
    super.key,
    required this.period,
    required this.company,
    required this.ocupattion,
    required this.skills,
    required this.descriptions,
  });

  final String period;
  final String company;
  final String ocupattion;
  final List<String> skills;
  final List<String> descriptions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isScreenMedium = size.width >= ScreenSize.small;
    final padding = SpacingSize.getPadding(size.width);

    return Flex(
      direction: isScreenMedium ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: isScreenMedium ? EdgeInsets.all(padding) : EdgeInsets.zero,
          child: Text(period, style: theme.textTheme.labelMedium),
        ),
        Flexible(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              company,
              style: theme.textTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SpacingSize.small,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ocupattion,
                  style: theme.textTheme.titleMedium,
                ),
                Wrap(
                    spacing: SpacingSize.small,
                    children: List.generate(skills.length,
                        (index) => Chip(label: Text(skills[index])))),
                ...List.generate(
                  descriptions.length,
                  (index) => Flexible(
                    child: Text(
                      descriptions[index],
                      style: theme.textTheme.bodyLarge,
                    ),
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
