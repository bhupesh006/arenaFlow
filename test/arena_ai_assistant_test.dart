import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:arena_flow/features/assistant/presentation/pages/arena_ai_assistant_page.dart';

void main() {
  testWidgets('ArenaAiAssistantPage structural and semantics widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ArenaAiAssistantPage(),
      ),
    );

    // Verify Title exists
    expect(find.text('Arena AI Assistant'), findsOneWidget);

    // Verify chat UI elements
    final textField = find.bySemanticsLabel('Type your message to the AI assistant');
    final sendButton = find.bySemanticsLabel('Send message');
    
    expect(textField, findsOneWidget);
    expect(sendButton, findsOneWidget);

    // Interact with text field
    await tester.enterText(textField, 'Where is the restroom?');
    expect(find.text('Where is the restroom?'), findsOneWidget);

    // Tap to simulate message send
    await tester.tap(sendButton);
    await tester.pump();
    
    // Assert message sent state triggered (the text field clears)
    expect(find.text('Where is the restroom?'), findsNothing);
    
    // Assert user message is now in the list
    expect(find.text('Where is the restroom?'), findsOneWidget);
  });
}
