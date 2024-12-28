class ChatUser {
  late final String image;
  late final String about;
  late final String name;
  late final String createdAt;
  late final bool isOnline;
  late final String id;
  late final String lastActive;
  late final String email;
  late final String pushToken;


  ChatUser(
      {required this.image,
        required this.name,
        required this.about,
        required this.createdAt,
        required this.isOnline,
        required this.lastActive,
        required this.id,
        required this.email,
        required this.pushToken});


  ChatUser.fromJson(Map<String, dynamic> json) {
    image = json['image']??'';
    name = json['name']??'';
    about = json['about']??'';
    createdAt = json['created_at']??'';
    isOnline = json['is_online']??'';
    lastActive = json['last_active']??'';
    id = json['id']??'';
    email = json['email']??'';
    pushToken = json['push_token']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['about'] = this.about;
    data['created_at'] = this.createdAt;
    data['is_online'] = this.isOnline;
    data['last_active'] = this.lastActive;
    data['id'] = this.id;
    data['email'] = this.email;
    data['push_token'] = this.pushToken;
    return data;
  }
}