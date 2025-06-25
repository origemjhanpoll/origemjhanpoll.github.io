import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';
import 'package:origemjhanpoll_github_io/core/utils/url_launcher_util.dart';
import 'package:origemjhanpoll_github_io/feature/models/contact_model.dart';

class ContactWidget extends StatelessWidget {
  final ContactModel model;

  const ContactWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final padding = SpacingSize.getPadding(size.width);
    final isScreenMedium = size.width >= ScreenSize.small;
    final urlLauncherUtil = UrlLauncherUtil();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedPadding(
          duration: Durations.medium1,
          padding: EdgeInsets.only(top: padding, left: padding, right: padding),
          child: Text(
            model.title.toUpperCase(),
            style: theme.textTheme.headlineMedium!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        AnimatedPadding(
          duration: Durations.medium1,
          padding: EdgeInsets.all(padding),
          child: Text(
            model.description,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        AnimatedPadding(
          duration: Durations.medium1,
          padding: EdgeInsets.all(padding),
          child: Wrap(
            spacing: SpacingSize.medium,
            runSpacing: SpacingSize.medium,
            alignment: WrapAlignment.center,
            children: model.contactItems.map((contactItem) {
              return _buildContactCard(
                context,
                contactItem,
                urlLauncherUtil,
                isScreenMedium,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard(
    BuildContext context,
    ContactItem contactItem,
    UrlLauncherUtil urlLauncherUtil,
    bool isScreenMedium,
  ) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: Durations.medium1,
      width: isScreenMedium ? 300 : double.infinity,
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () => urlLauncherUtil.launchURL(contactItem.url),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.all(SpacingSize.medium),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildIcon(contactItem, theme),
                SizedBox(height: SpacingSize.small),
                Text(
                  contactItem.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SpacingSize.small),
                Text(
                  contactItem.value,
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(ContactItem contactItem, ThemeData theme) {
    final iconSize = 32.0;

    switch (contactItem.type) {
      case ContactType.email:
        return Icon(
          Icons.email,
          size: iconSize,
          color: theme.colorScheme.primary,
        );
      case ContactType.phone:
        return Icon(
          Icons.phone,
          size: iconSize,
          color: theme.colorScheme.primary,
        );
      case ContactType.whatsapp:
        return SvgPicture.asset(
          'assets/svg/icon_whatsapp.svg',
          width: iconSize,
          height: iconSize,
          colorFilter: ColorFilter.mode(
            theme.colorScheme.primary,
            BlendMode.srcIn,
          ),
        );
      case ContactType.linkedin:
        return Icon(
          Icons.link,
          size: iconSize,
          color: theme.colorScheme.primary,
        );
      case ContactType.github:
        return Icon(
          Icons.code,
          size: iconSize,
          color: theme.colorScheme.primary,
        );
      case ContactType.website:
        return Icon(
          Icons.language,
          size: iconSize,
          color: theme.colorScheme.primary,
        );
    }
  }
}
