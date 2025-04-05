import 'dart:convert';
import 'package:crm_smart/core/utils/end_points.dart';
import 'package:http/http.dart' as http;
import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final String baseUrl;

  ChatRepositoryImpl({String? baseUrl})
      : baseUrl = baseUrl ?? EndPoints.baseUrls.url;

  @override
  Future<String> sendMessageToAI(String questionId, {String? clientId}) async {
    try {
      print('chatting with questionId: $questionId, clientId: $clientId');
      final uri = Uri.parse('$baseUrl${EndPoints.chatAi.send_question}');
      print(uri);

      final Map<String, dynamic> payload = {
        'questionId': questionId,
      };

      // Add clientId if available
      if (clientId != null) {
        payload['clientId'] = clientId;
      }
     print(jsonEncode(payload).toString());
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );

      print('response');
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return data['response'] ?? 'No response from AI';
      } else {
        throw Exception(
            'Failed to get response from AI: ${response.statusCode}');
      }
    } catch (e) {
      // For development purposes, return a mock response
      return _getMockResponse(questionId, clientId);
    }
  }

  // Mock responses for testing without API
  String _getMockResponse(String questionId, String? clientId) {
    // General questions
    if (questionId == 'sales_summary') {
      return 'تحليل المبيعات الأخيرة يظهر زيادة بنسبة 15٪ في مبيعات المنتج A مقارنة بالربع السابق. أعلى 3 منتجات من حيث المبيعات هي المنتج A والمنتج B والمنتج C. يُنصح بزيادة المخزون من هذه المنتجات لتلبية الطلب المتزايد.';
    } else if (questionId == 'client_recommendations') {
      return 'اقترح إرسال عروض خاصة للعملاء غير النشطين لأكثر من 3 أشهر. يمكنك أيضًا تنظيم حدث افتراضي لعرض المنتجات الجديدة وإعادة إشراك العملاء. التواصل المنتظم عبر البريد الإلكتروني مع محتوى ذي قيمة يساعد في الحفاظ على العلاقات.';
    } else if (questionId == 'task_prioritization') {
      return 'يمكن ترتيب المهام حسب العائد المتوقع وموعد التسليم. استخدم تقنية بوموردو للتركيز: 25 دقيقة عمل متبوعة بـ 5 دقائق راحة. حدد الأهداف الأسبوعية وقسمها إلى مهام يومية. خصص وقتًا محددًا للاجتماعات ووقتًا آخر للعمل دون مقاطعة.';
    } else if (questionId == 'market_analysis') {
      return 'تظهر تحليلات السوق الحالية زيادة الطلب على المنتجات الرقمية والخدمات عن بُعد. ينصح بتطوير منتجات تلبي هذه الاحتياجات. المنافسون الرئيسيون يتجهون نحو حلول متكاملة، لذا يمكن التفكير في تقديم حزم خدمات شاملة لزيادة القيمة للعملاء.';
    } else if (questionId == 'customer_support') {
      return 'لتحسين دعم العملاء، يمكن إنشاء قاعدة معرفة شاملة للأسئلة الشائعة، وتدريب الموظفين على تقنيات التعاطف والاستماع النشط. تنفيذ نظام تذاكر فعال يضمن عدم إغفال أي استفسار. قياس زمن الاستجابة ورضا العملاء بانتظام للتحسين المستمر.';
    }
    // Client-specific questions
    else if (questionId == 'client_payment_analysis') {
      return 'تحليل مدفوعات العميل ${clientId}: يظهر التحليل أن هذا العميل يسدد المدفوعات في الموعد المحدد بنسبة 95٪. متوسط وقت السداد هو 7 أيام قبل تاريخ الاستحقاق. لديه 3 فواتير مستحقة حاليًا بقيمة إجمالية 15,000 ريال. التوصيات: 1) تقديم خصم للدفع المبكر. 2) زيادة حد الائتمان نظرًا لسجله الجيد.';
    } else if (questionId == 'client_engagement') {
      return 'اقتراحات لزيادة مشاركة العميل ${clientId}: 1) دعوة العميل للمشاركة في برنامج الولاء الخاص بكم. 2) إرسال استبيان لمعرفة احتياجاته المستقبلية. 3) جدولة اجتماع ربع سنوي لمراجعة الخدمات المقدمة له. 4) إرسال تحديثات منتظمة عن المنتجات الجديدة التي قد تهمه بناءً على مشترياته السابقة.';
    } else if (questionId == 'client_support_status') {
      return 'ملخص حالة الدعم للعميل ${clientId}: توجد 2 تذكرة دعم مفتوحة حاليًا (رقم 45678، 45680). تم حل 7 تذاكر في الشهر الماضي، مع متوسط وقت استجابة 4 ساعات. الموضوعات الشائعة: مشاكل تسجيل الدخول، استفسارات الفواتير. الاقتراحات: 1) تعيين مدير دعم مخصص. 2) تقديم جلسة تدريبية للمستخدمين. 3) مراجعة أسباب مشاكل تسجيل الدخول المتكررة.';
    } else if (questionId == 'client_opportunities') {
      return 'فرص البيع للعميل ${clientId}: بناءً على تاريخ المشتريات، يوصى بعرض: 1) خدمة الصيانة الممتازة (تكمل منتجاته الحالية). 2) ترقية حزمة البرامج إلى الإصدار الاحترافي (زيادة في القيمة). 3) حلول التكامل مع أنظمة CRM (توسع أفقي). الفرصة الأكثر ربحية: ترقية حزمة البرامج بهامش ربح متوقع 40٪.';
    } else if (questionId == 'client_risk_assessment') {
      return 'تقييم مخاطر العميل ${clientId}: مستوى الخطر: منخفض. نقاط القوة: علاقة طويلة الأمد (5+ سنوات)، معدل تجديد عالٍ، توسيع تدريجي للمشتريات. نقاط الضعف المحتملة: اعتماد على منتج واحد فقط، تغييرات أخيرة في فريق الإدارة لديهم. استراتيجيات الاحتفاظ: 1) تقديم عروض خاصة للمنتجات المكملة. 2) جدولة اجتماع تعارف مع فريق الإدارة الجديد. 3) تخصيص مدير حساب جديد لتجديد العلاقة.';
    } else {
      return 'شكراً لاستخدام مساعد الذكاء الاصطناعي. يرجى تحديد أحد الخيارات المتاحة للحصول على تحليل مخصص.';
    }
  }
}
