enum MessageStatus { not_sent, not_viewed, viewed }

class ChatMessage {
  final String text;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    this.text,
    this.messageStatus,
    this.isSender,
  });
}

List chatMessages = [
  ChatMessage(
    text:
        "Hi Buddy, dsvdskbvdskvbdskjvbsdkjvdbvksdjbvdkjsdbsvdjkbvsdjkdbvkjvdsbkjvsdbsdkjvbv",
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Hello, How are you? sdkjbvdskjbvsdkbv",
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "I am good.",
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Glad to hear it. daklbfajlbaslbaslafalkfbaldf",
    messageStatus: MessageStatus.not_viewed,
    isSender: true,
  ),
  ChatMessage(
    text:
        "Hi Buddy, dsvdskbvdskvbdskjvbsdkjvdbvksdjbvdkjsdbsvdjkbvsdjkdbvkjvdsbkjvsdbsdkjvbv",
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Hello, How are you? sdkjbvdskjbvsdkbv",
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "I am good.",
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Glad to hear it. daklbfajlbaslbaslafalkfbaldf",
    messageStatus: MessageStatus.not_viewed,
    isSender: true,
  ),
  ChatMessage(
    text:
        "Hi Buddy, dsvdskbvdskvbdskjvbsdkjvdbvksdjbvdkjsdbsvdjkbvsdjkdbvkjvdsbkjvsdbsdkjvbv",
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Hello, How are you? sdkjbvdskjbvsdkbv",
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "I am good.",
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Glad to hear it. daklbfajlbaslbaslafalkfbaldf",
    messageStatus: MessageStatus.not_viewed,
    isSender: true,
  ),
  ChatMessage(
    text:
        "Hi Buddy, dsvdskbvdskvbdskjvbsdkjvdbvksdjbvdkjsdbsvdjkbvsdjkdbvkjvdsbkjvsdbsdkjvbv",
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Hello, How are you? sdkjbvdskjbvsdkbv",
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "I am good.",
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Glad to hear it. daklbfajlbaslbaslafalkfbaldf",
    messageStatus: MessageStatus.not_viewed,
    isSender: true,
  ),
  ChatMessage(
    text:
        "Hi Buddy, dsvdskbvdskvbdskjvbsdkjvdbvksdjbvdkjsdbsvdjkbvsdjkdbvkjvdsbkjvsdbsdkjvbv",
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Hello, How are you? sdkjbvdskjbvsdkbv",
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "I am good.",
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Glad to hear it. daklbfajlbaslbaslafalkfbaldf",
    messageStatus: MessageStatus.not_viewed,
    isSender: true,
  ),
];
