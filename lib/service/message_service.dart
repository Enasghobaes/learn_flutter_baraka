import 'package:first_albaraka_supabase/model/message_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

abstract class CoreSrvice {
  Stream<List<message_model>> getMessages();
  Future<bool> addMessage(chatModel);
}

class ServicesImp extends CoreSrvice {
  @override
  Stream<List<message_model>> getMessages() {
    var messages = supabase
        .from("Chat")
        .select('*')
        .then((data) => data.map((map) => message_model.fromMap(map)).toList());
    return messages.asStream();
  }

  Future<bool> addMessage(chatModel) async {
    await supabase
        .from('Chat')
        .insert({"message": chatModel.message, "is_me": false}).select();
    return true;
  }
}
