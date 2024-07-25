import 'package:first_albaraka_supabase/model/message_model.dart';
import 'package:first_albaraka_supabase/service/message_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chat = Provider<ServicesImp>((ref) {
  return ServicesImp();
});

final getData = StreamProvider<List<message_model>>((ref) {
  return ref.read(chat).getMessages();
});
