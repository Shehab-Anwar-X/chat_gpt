abstract class ChoiceMessageKeys {
  const ChoiceMessageKeys();

  static const role = 'role';
  static const content = 'content';

  static List<String> toList() {
    return <String>[
      role,
      content,
    ];
  }
}
