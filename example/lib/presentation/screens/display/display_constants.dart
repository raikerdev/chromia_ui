class AvatarConstants {
  static const initialsCode = '''ChromiaAvatar.initials(
  initials: 'AB',
  backgroundColor: colors.primary,
  size: ChromiaAvatarSize.extraLarge,
)''';

  static const iconCode = '''ChromiaAvatar.icon(
  icon: Icons.person,
  backgroundColor: colors.primary,
  size: ChromiaAvatarSize.extraLarge,
)''';

  static const imageCode = '''ChromiaAvatar.image(
  imageProvider: const NetworkImage('https://picsum.photos/200'),
  backgroundColor: colors.primary,
  size: ChromiaAvatarSize.extraLarge,
)''';

  static const sizesCode = '''ChromiaAvatar.initials(
  initials: 'AB',
  size: ChromiaAvatarSize.extraSmall,
),
ChromiaAvatar.initials(
  initials: 'CD',
  size: ChromiaAvatarSize.small,
),
ChromiaAvatar.initials(
  initials: 'EF',
  size: ChromiaAvatarSize.medium,
),
ChromiaAvatar.initials(
  initials: 'GH',
  size: ChromiaAvatarSize.large,
),
ChromiaAvatar.initials(
  initials: 'IJ',
  size: ChromiaAvatarSize.extraLarge,
),''';

  static const shapeCircleCode = '''ChromiaAvatar.initials(
  initials: 'CD',
  backgroundColor: colors.primary,
  shape: ChromiaAvatarShape.circle,
  size: ChromiaAvatarSize.extraLarge,
)''';

  static const shapeRoundedCode = '''ChromiaAvatar.initials(
  icon: Icons.person,
  backgroundColor: colors.primary,
  shape: ChromiaAvatarShape.rounded,
  size: ChromiaAvatarSize.extraLarge,
)''';

  static const shapeSquareCode = '''ChromiaAvatar.initials(
  imageProvider: const NetworkImage('https://picsum.photos/200'),
  backgroundColor: colors.primary,
  shape: ChromiaAvatarShape.square,
  size: ChromiaAvatarSize.extraLarge,
)''';

  static const groupCode = '''ChromiaAvatarGroup(
  max: 3,
  showMore: true,
  size: ChromiaAvatarSize.extraLarge,
  spacing: 15,
  avatars: [
    ChromiaAvatar.initials(initials: 'AB', backgroundColor: colors.primary),
    ChromiaAvatar.initials(initials: 'CD', backgroundColor: colors.secondary),
    ChromiaAvatar.initials(initials: 'EF', backgroundColor: colors.success),
    ChromiaAvatar.initials(initials: 'GH', backgroundColor: colors.error),
  ],
)''';
}

class BadgeConstants {
  static const dotCode = '''ChromiaBadge(
  child: Icon(
    Icons.notifications,
    size: 32,
    color: colors.primary,
  ),
)''';

  static const countCode = '''ChromiaBadge(
  value: '9',
  child: Icon(
    Icons.notifications,
    size: 32,
    color: colors.primary,
  ),
)''';

  static const overflowCode = '''ChromiaBadge(
  value: '99',
  maxValue: 9,
  child: Icon(
    Icons.notifications,
    size: 32,
    color: colors.primary,
  ),
)''';

  static const smallCode = '''ChromiaBadge(
  value: '99',
  maxValue: 9,
  size: ChromiaBadgeSize.small,
  child: Icon(
    Icons.notifications,
    size: 32,
    color: colors.primary,
  ),
)''';

  static const mediumCode = '''ChromiaBadge(
  value: '99',
  maxValue: 9,
  size: ChromiaBadgeSize.medium,
  child: Icon(
    Icons.notifications,
    size: 32,
    color: colors.primary,
  ),
)''';

  static const largeCode = '''ChromiaBadge(
  value: '99',
  maxValue: 9,
  size: ChromiaBadgeSize.large,
  child: Icon(
    Icons.notifications,
    size: 32,
    color: colors.primary,
  ),
)''';

  static const circleCode = '''ChromiaBadge(
  value: '99',
  maxValue: 9,
  shape: ChromiaBadgeShape.circle,
  child: Icon(
    Icons.notifications,
    size: 32,
    color: colors.primary,
  ),
)''';

  static const roundedCode = '''ChromiaBadge(
  value: '99',
  maxValue: 9,
  shape: ChromiaBadgeShape.rounded,
  child: Icon(
    Icons.notifications,
    size: 32,
    color: colors.primary,
  ),
)''';

  static const squareCode = '''ChromiaBadge(
  value: '99',
  maxValue: 9,
  shape: ChromiaBadgeShape.square,
  child: Icon(
    Icons.notifications,
    size: 32,
    color: colors.primary,
  ),
)''';

  static const topRightCode = '''ChromiaBadge(
  value: '99',
  maxValue: 9,
  position: ChromiaPosition.topRight(),
  child: Icon(
    Icons.notifications,
    size: 32,
    color: colors.primary,
  ),
)''';

  static const bottomRightCode = '''ChromiaBadge(
  value: '99',
  maxValue: 9,
  position: ChromiaPosition.bottomRight(),
  child: Icon(
    Icons.notifications,
    size: 32,
    color: colors.primary,
  ),
)''';

  static const bottomLeftCode = '''ChromiaBadge(
  value: '99',
  maxValue: 9,
  position: ChromiaPosition.bottomLeft(),
  child: Icon(
    Icons.notifications,
    size: 32,
    color: colors.primary,
  ),
)''';

  static const topLeftCode = '''ChromiaBadge(
  value: '99',
  maxValue: 9,
  position: ChromiaPosition.topLeft(),
  child: Icon(
    Icons.notifications,
    size: 32,
    color: colors.primary,
  ),
)''';

  static const dotOnAvatar = '''ChromiaStatusBadge(
  status: ChromiaStatusType.success,
  child: ChromiaAvatar(child: Icon(Symbols.person)),
),
ChromiaStatusBadge(
  status: ChromiaStatusType.warning,
  child: ChromiaAvatar(child: Icon(Symbols.person)),
),
ChromiaStatusBadge(
  status: ChromiaStatusType.error,
  child: ChromiaAvatar(child: Icon(Symbols.person)),
),
ChromiaStatusBadge(
  status: ChromiaStatusType.info,
  child: ChromiaAvatar(child: Icon(Symbols.person)),
),
ChromiaStatusBadge(
  status: ChromiaStatusType.neutral,
  child: ChromiaAvatar(child: Icon(Symbols.person)),
)''';

  static const withTextLabels = '''ChromiaStatusBadge(
  status: ChromiaStatusType.success,
  text: 'Active',
),
ChromiaStatusBadge(
  status: ChromiaStatusType.warning,
  text: 'Pending',
),
ChromiaStatusBadge(
  status: ChromiaStatusType.error,
  text: 'Error',
),
ChromiaStatusBadge(
  status: ChromiaStatusType.info,
  text: 'Info',
),
ChromiaStatusBadge(
  status: ChromiaStatusType.neutral,
  text: 'Inactive',
)''';

  static const labelSimple = '''ChromiaLabelBadge(text: 'v1.0.0')''';

  static const labelWithIcon = '''ChromiaLabelBadge(
  text: 'Favorite',
  icon: Icons.favorite,
)''';

  static const labelWithColor = '''ChromiaLabelBadge(
  text: 'New',
  backgroundColor: colors.primary,
  textColor: colors.onPrimary,
)''';

  static const labelShapes = '''ChromiaLabelBadge(
  text: 'Square',
  shape: ChromiaBadgeShape.square,
  backgroundColor: colors.error,
  textColor: colors.onError,
),
ChromiaLabelBadge(
  text: 'Rounded',
  shape: ChromiaBadgeShape.rounded,
  backgroundColor: colors.warning,
  textColor: colors.onWarning,
),
ChromiaLabelBadge(
  text: 'Circle',
  shape: ChromiaBadgeShape.circle,
  backgroundColor: colors.info,
  textColor: colors.onInfo,
)''';

}

class ChipConstants {
  static const simpleCode = '''ChromiaChipGroup(
  children: [
    ChromiaChip(label: 'Flutter'),
    ChromiaChip(label: 'Dart'),
    ChromiaChip(label: 'Mobile'),
    ChromiaChip(label: 'Design'),
    ChromiaChip(label: 'UI'),
  ],
)''';

  static const withIconCode = '''ChromiaChipGroup(
  children: [
    ChromiaChip(label: 'Home', icon: Icons.home),
    ChromiaChip(label: 'Favorite', icon: Icons.favorite),
    ChromiaChip(label: 'Star', icon: Icons.star),
    ChromiaChip(label: 'Settings', icon: Icons.settings),
  ],
)''';

  static const withAvatarCode = '''ChromiaChipGroup(
  children: [
    ChromiaChip(
      label: 'Alice',
      avatar: ChromiaAvatar.initials(
        initials: 'A',
        backgroundColor: colors.primary,
        size: ChromiaAvatarSize.extraSmall,
      ),
    ),
    ChromiaChip(
      label: 'Bob',
      avatar: ChromiaAvatar.initials(
        initials: 'B',
        backgroundColor: colors.secondary,
        size: ChromiaAvatarSize.extraSmall,
      ),
    ),
    ChromiaChip(
      label: 'Charlie',
      avatar: ChromiaAvatar.initials(
        initials: 'C',
        backgroundColor: colors.success,
        size: ChromiaAvatarSize.extraSmall,
      ),
    ),
  ],
)''';

  static const deletableCode = '''final tags = ['Flutter', 'Dart', 'Mobile', 'UI'];
  
ChromiaChipGroup(
  children: tags.map((tag) {
    return ChromiaChip(
      label: tag,
      onDeleted: () {
        setState(() => tags.remove(tag));
      },
    );
  }).toList(),
)''';

  static const filterCode = '''bool active = false;
bool pending = true;
bool completed = false;
    
ChromiaChip.filter(
  label: 'Active',
  selected: active,
  icon: Icons.check_circle,
  selectedIcon: Icons.check_circle,
  onSelected: (v) => setState(() => active = v),
),
ChromiaChip.filter(
  label: 'Pending',
  selected: pending,
  icon: Icons.pending,
  selectedIcon: Icons.pending,
  onSelected: (v) => setState(() => pending = v),
),
ChromiaChip.filter(
  label: 'Completed',
  selected: completed,
  icon: Icons.done_all,
  selectedIcon: Icons.done_all,
  onSelected: (v) => setState(() => completed = v),
)''';

  static const choiceCode = '''String? selected;
  
ChromiaChipGroup(
  children: ['Small', 'Medium', 'Large', 'XL'].map(
    (option) {
      return ChromiaChip.choice(
        label: option,
        selected: selected == option,
        onSelected: () => setState(() => selected = option),
      );
    },
  ).toList(),
)''';

}

class ListTileConstants {
  static const standard = '''ChromiaListTile(
  variant: ChromiaListTileVariant.standard,
  leading: layersIcon,
  trailing: chevronRightIcon,
  title: const Text('Standard'),
  subtitle: const Text('Default variant'),
  onTap: () {},
)''';

  static const outlined = '''ChromiaListTile(
  variant: ChromiaListTileVariant.outlined,
  leading: layersIcon,
  trailing: chevronRightIcon,
  title: const Text('Outlined'),
  subtitle: const Text('With border'),
  onTap: () {},
)''';

  static const card = '''ChromiaListTile(
  variant: ChromiaListTileVariant.card,
  leading: layersIcon,
  trailing: chevronRightIcon,
  title: const Text('Card'),
  subtitle: const Text('With elevation'),
  onTap: () {},
)''';

  static const selectable = '''final items = [
  (icon: Icons.home, title: 'Home'),
  (icon: Icons.explore, title: 'Explore'),
  (icon: Icons.notifications, title: 'Notifications'),
  (icon: Icons.settings, title: 'Settings'),
];

int selectedIndex = 0;

Column(
  children: items.asMap().entries.map((e) {
    final i = e.key;
    final item = e.value;
    final isSelected = selectedIndex == i;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: ChromiaListTile(
        leading: Icon(
          item.icon,
          color: isSelected ? colors.primary : colors.onSurfaceVariant,
        ),
        title: Text(item.title),
        selected: isSelected,
        trailing: isSelected
            ? Icon(Icons.check, color: colors.primary)
            : null,
        onTap: () => setState(() => selectedIndex = i),
      ),
    );
  }).toList(),
)''';

  static const disabledTile = '''
ChromiaListTile(
  leading: Icon(Icons.block),
  title: Text('Disabled Item'),
  subtitle: Text('This item is disabled'),
  enabled: false,
)''';

  static const checkboxTile = '''bool notifications = true;
  
ChromiaListTileCheckbox(
  value: notifications,
  onChanged: (v) => setState(() => notifications = v ?? false),
  leading: Icon(Icons.notifications, color: colors.primary),
  title: Text('Push Notifications'),
  subtitle: Text('Receive alerts in real time'),
)''';

  static const checkboxTileVariants = '''bool v1 = true;
bool v2 = false;
bool v3 = true;

ChromiaListTileCheckbox(
  value: v1,
  onChanged: (v) => setState(() => v1 = v ?? false),
  title: Text('Standard'),
  subtitle: Text('Default look'),
  variant: ChromiaListTileVariant.standard,
)
ChromiaListTileCheckbox(
  value: v2,
  onChanged: (v) => setState(() => v2 = v ?? false),
  title: Text('Outlined'),
  subtitle: Text('With border'),
  variant: ChromiaListTileVariant.outlined,
)
ChromiaListTileCheckbox(
  value: v3,
  onChanged: (v) => setState(() => v3 = v ?? false),
  title: Text('Card'),
  subtitle: Text('With elevation'),
  variant: ChromiaListTileVariant.card,
)''';

  static const radioTile = '''String theme = 'light';

ChromiaListTileRadioButton<String>(
  value: 'light',
  groupValue: theme,
  onChanged: (v) => setState(() => theme = v ?? theme),
  leading: Icon(Icons.light_mode, color: colors.primary),
  title: Text('Light'),
  subtitle: Text('Light color scheme'),
)''';

  static const toggleTile = '''bool notifications = true;

ChromiaListTileToggleButton(
  value: notifications,
  onChanged: (v) => setState(() => notifications = v),
  leading: Icon(Icons.notifications, color: colors.primary),
  title: Text('Push Notifications'),
  subtitle: Text('Receive alerts in real time'),
)''';

  static const sliderTile = '''double volume = 60;

ChromiaListTileSlider(
  value: volume,
  onChanged: (v) => setState(() => volume = v),
  title: Text('Volume'),
  subtitle: Text('Adjust playback volume'),
  min: 0,
  max: 100,
  divisions: 10,
  valueBuilder: (v) => '\${v.toInt()}%',
)''';

  static const rangeSliderTile = '''RangeValues priceRange = const RangeValues(200, 700);

ChromiaListTileRangeSlider(
  values: priceRange,
  onChanged: (v) => setState(() => priceRange = v),
  title: Text('Price range'),
  min: 0,
  max: 1000,
  divisions: 10,
  valueBuilder: (v) => '\$\${v.toInt()}',
)''';

}